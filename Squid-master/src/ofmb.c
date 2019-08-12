#include "squid.h"
//my code
typedef enum _ConfigOP{
	Add,
	Modify,
	Delete
}ConfigOP;

static void changeConfigFile(int priority, char *config, ConfigOP op);
static void configToRule(acl_access *rule, ActionType action_type);
static int aclVarCount(acl_access *rule);
static void propAclList(rule_acl_var *acllist, acl_list * curlist);
static void portAcl(rule_acl_var *aclVar, intrange *port);
static void ipAcl(rule_acl_var *aclVar, splayNode *splay);
static void domainAcl(rule_acl_var *aclVar, splayNode *splay);
static void timeAcl(rule_acl_var *aclVar, acl_time_data *time);
static void methodAcl(rule_acl_var *aclVar, intlist *method);
static void protoAcl(rule_acl_var *aclVar, intlist *proto);
static void insertRule(rule_table *tmp);
static void portRule(rule_table *new, int new_size, int i);
static void ipRule(rule_table *new, int new_size, int i);
void rule_send();
/*static void ip_rule(acl *a, int allow);
static void traversal_ip_splay(splayNode *splay, char *type, int allow);
static void port_rule(acl *a, int allow);
static void write_action(rule_table *tmp, char *type, int allow);
static void insert_rule_table(rule_table *tmp);*/

void
ofmbConnectionsOpen(void)
{
	u_short port;
	struct in_addr listen_addr;
	safe_inet_addr("0.0.0.0", &listen_addr);
	debug(1, 1) ("1111111111111111111111ofmb_port: %d\n", Config.Port.ofmb);
	debug(49, 5) ("ofmbConnectionOpen: Called\n");
	if ((port = Config.Port.ofmb) <= 0)
		return;
	enter_suid();
	theOfmbConnection = comm_open(SOCK_STREAM,
		IPPROTO_TCP,
		listen_addr,
		port,
		COMM_NONBLOCKING,
		"OFMB Socket");
	leave_suid();
	if (theOfmbConnection < 0)
		fatal("Cannot open OFMB Socket");
	comm_listen(theOfmbConnection);
	commSetSelect(theOfmbConnection, COMM_SELECT_READ, ofmbAccept, NULL, 0);
	debug(1, 1) ("Accepting OFMB messages at %s on port %d, FD %d.\n",
			inet_ntoa(listen_addr), (int) port, theOfmbConnection);

	ActionType action_type = HTTP_ACCESS;
	RuleTable = NULL;
	configToRule(Config.accessList.http, action_type);
	rule_send();
}

void
ofmbConnectionClose(void)
{
    if (theOfmbConnection > -1) {
	debug(80, 1) ("FD %d Closing OFMB socket\n", theOfmbConnection);
	comm_close(theOfmbConnection);
	theOfmbConnection = -1;
    }
}

void
ofmbAccept(int sock, void *data)
{
	int fd = -1;
	fde *F;
	ConnStateData *connState = NULL;
    struct sockaddr_in peer;
    struct sockaddr_in me;
    int max = INCOMING_HTTP_MAX;

    commSetSelect(sock, COMM_SELECT_READ, ofmbAccept, data, 0);
    while (max--) {
		memset(&peer, '\0', sizeof(struct sockaddr_in));
		memset(&me, '\0', sizeof(struct sockaddr_in));
		if ((fd = comm_accept(sock, &peer, &me)) < 0) {
			if (!ignoreErrno(errno))
			debug(1, 1) ("ofmbAccept: FD %d: accept failure: %s\n",
				fd, xstrerror());
			break;
		}
		F = &fd_table[fd];
		connState = cbdataAlloc(ConnStateData);
		connState->peer = peer;
		connState->log_addr = peer.sin_addr;
		connState->fd = fd;
		comm_add_close_handler(fd, ofmbclose, connState);
		debug(1, 1) ("ofmbAccept: FD %d: accepted port %d client %s:%d\n", fd, F->local_port, F->ipaddr, F->remote_port);
		fd_note_static(fd, "controller ofmb connect");
		commSetSelect(fd, COMM_SELECT_READ, ofmbReadRequest, connState, 0);
    }
}

void
ofmbReadRequest(int fd, void *data)
{
	int priority;
	ConfigOP op;
	char config[1024];
	memset(config, '\0', sizeof(config));
	ConnStateData *conn = data;
	char buf[1024];
	int len;
	static struct sockaddr_in from;
	socklen_t flen = sizeof(struct sockaddr_in);
	memset(&from, '\0', flen);
	len = recvfrom(fd, buf, sizeof(buf), 0, (struct sockaddr *) &from, &flen);

	if (len>0) {
		gettimeofday(&tprestart,NULL);
		memcpy(&priority, buf, sizeof(int));
		memcpy(&op, buf+sizeof(int), sizeof(ConfigOP));
		if (len-sizeof(int)-sizeof(ConfigOP) > 0){
			memcpy(config, buf+sizeof(int)+sizeof(ConfigOP), len-sizeof(int)-sizeof(ConfigOP));
		}
		debug(1, 1) ("len: %d, config: %s  priority: %d   ConfigOP: %d\n", len, config, priority, op);
		debug(1, 1) ("peer.sin_addr: %s, port: %d\n", inet_ntoa(conn->peer.sin_addr), conn->peer.sin_port);
		changeConfigFile(priority, config, op);
	}
	commSetSelect(fd, COMM_SELECT_READ, ofmbReadRequest, NULL, 0);
}

void
ofmbclose(int fd, void *data)
{
	debug(1, 1) ("1111111111close close");
}

//
void
changeConfigFile(int priority, char *config, ConfigOP op)
{
	FILE *conf_file;
	int i = 0;
	char line[1024]; //足够容纳最大长度的一行！
	if (!(conf_file = fopen(ConfigFile, "r+"))) {	// 尝试以读写方式打开文件.
		debug(1, 1) ("Open config file failed.\n");
	}
	long offset1 = 0, offset2 = 0;//1为对应配置前偏移量，2为对应配置后偏移量
	while(i <= priority){
		offset1 = ftell(conf_file);
		fgets(line, sizeof(line), conf_file);
		if (!strncmp(line, "http_access", sizeof("http_access")-1)){
			i++;
		}

	}
	if (op == Modify || op == Delete) offset2 = ftell(conf_file);
	char save[130][1024];
	i = 0; // 清0, 记录后面共有多少行
	if (op == Add){
		fseek(conf_file, offset1, SEEK_SET);
	}else if(op == Modify || op == Delete){
		fseek(conf_file, offset2, SEEK_SET);
	}
	while ((fgets(save[i], 1024, conf_file))) {	// 循环读取文件, 直到fgets返回NULL表示读完
		i++;
	}
	fseek(conf_file, offset1, SEEK_SET);
	if (op != Delete ){
		if(config != NULL || strlen(config)>0){
			fprintf(conf_file, "%s\n", config);
		}
	}

	int j;
	for (j = 0; j < i; j++) {	// 之前保存的数据, 依次往后面写
		fputs(save[j], conf_file);
	}
	long end = 0;
	end = ftell(conf_file);
	int k = ftruncate(fileno(conf_file), end);
	debug(1, 1) ("kkkkk %d  errno %d\n", k, errno);

	fclose(conf_file);
	reconfigure(SIGHUP);
}

void
configToRule(acl_access *rule, ActionType action_type)
{
	int acl_var_count;
	rule_table *new;
	acl_list *curlist;
	int curprio = 0;
	int i;
	int new_size;
	for (; rule != NULL; rule = rule->next){
		acl_var_count = aclVarCount(rule);
		//debug(1, 1) ("acl_var_count:%d\n", acl_var_count);
		new_size = sizeof(rule_table)+acl_var_count*sizeof(rule_acl_var);
		new = (rule_table *)xmalloc(new_size);
		new->next = NULL;
		new->length = new_size - sizeof(rule_table *);
		new->acttype = action_type;
		new->actdesc = rule->allow == 1 ? allow : deny;
		new->priority = curprio++;
		//debug(1, 1) ("action_type:%s\n", new->action_type);
		//debug(1, 1) ("action_desc:%s\n", new->action_desc);
		//debug(1, 1) ("priority:%d\n", new->priority);
		new->properties.allow = rule->allow;
		new->properties.length = acl_var_count;
		new->matches.proto = HTTP;
		curlist = rule->acl_list;
		for (i=0; i<acl_var_count; i++){
			propAclList(&new->properties.aclVar[i], curlist);
			//debug(1, 1) ("i:%d\n", i);
			//debug(1, 1) ("op:%d\n", new->properties.aclVar[i].op);
			//debug(1, 1) ("name:%s\n", new->properties.aclVar[i].name);
			curlist = curlist->next;
		}
		//对IP、port，拆解成多条rule，将信息填入basic header
		int already_exists = 0;
		for (i=0; i<acl_var_count; i++){
			already_exists = 0;
			switch (new->properties.aclVar[i].type){
				case ACL_URL_PORT:
					portRule(new, new_size, i);
					already_exists = 1;
					break;
				case ACL_SRC_IP:
				case ACL_DST_IP:
					ipRule(new, new_size, i);
					already_exists = 1;
					break;
				default:
					break;
			}
		}
		if (!already_exists)
			insertRule(new);
	}
}

void
portRule(rule_table *new, int new_size, int i){
	int j;
	rule_table *curnew;
	for (j=0; j<new->properties.aclVar[i].length; j++){
		curnew = (rule_table *)xmalloc(new_size);
		curnew->next = NULL;
		memcpy(curnew, new, new_size);
		curnew->matches.dpts[0] = curnew->properties.aclVar[i].data[j].intrange.i;
		curnew->matches.dpts[1] = curnew->properties.aclVar[i].data[j].intrange.j;
		insertRule(curnew);
	}
}

void
ipRule(rule_table *new, int new_size, int i){
	int j;
	rule_table *curnew;
	for (j=0; j<new->properties.aclVar[i].length; j++){
		curnew = (rule_table *)xmalloc(new_size);
		curnew->next = NULL;
		memcpy(curnew, new, new_size);
		if(curnew->properties.aclVar[i].type == ACL_SRC_IP){
			curnew->matches.src_ip = curnew->properties.aclVar[i].data[j].ip_data.addr1;
		}
		else{
			curnew->matches.dst_ip = curnew->properties.aclVar[i].data[j].ip_data.addr1;
		}
		curnew->matches.mask = curnew->properties.aclVar[i].data[j].ip_data.mask;
		insertRule(curnew);
	}
}

void
insertRule(rule_table *tmp){
	int length = 0;
	if (!RuleTable){
		RuleTable = tmp;
		length ++;
	}else{
		rule_table *cur = RuleTable;
		length ++;
		while(cur->next){
			cur = cur->next;
			length++;
		}
		cur->next = tmp;
		length++;
	}
/*	debug(1, 1) ("name:%s\n", tmp->properties.aclVar[0].name);
	debug(1, 1) ("length:%d\n", length);*/
}

int
aclVarCount(acl_access *rule){
	int acl_var_count = 0;
	acl_list *a_list;
	for(a_list=rule->acl_list; a_list!=NULL; a_list=a_list->next)
		acl_var_count ++;
	return acl_var_count;
}

void
propAclList(rule_acl_var *aclVar, acl_list * curlist){
	aclVar->op = curlist->op;
	strcpy(aclVar->name, curlist->acl->name);
	aclVar->type = curlist->acl->type;
	aclVar->length = 0;
	switch (curlist->acl->type){
		case ACL_URL_PORT:
	    case ACL_MY_PORT:
	    	portAcl(aclVar,(intrange *)curlist->acl->data);
	    	break;
	    case ACL_SRC_IP:
	    case ACL_DST_IP:
	    case ACL_MY_IP:
	    	ipAcl(aclVar, (splayNode *)curlist->acl->data);
	    	break;
	    case ACL_SRC_DOMAIN:
	    case ACL_DST_DOMAIN:
	    	domainAcl(aclVar, (splayNode *)curlist->acl->data);
	    	break;
	    case ACL_TIME:
	    	timeAcl(aclVar, (acl_time_data *)curlist->acl->data);
	    	break;
	    case ACL_METHOD:
	    	methodAcl(aclVar, (intlist *)curlist->acl->data);
	    	break;
	    case ACL_PROTO:
	    	protoAcl(aclVar, (intlist *)curlist->acl->data);
	    	break;
	    default:
	    	break;
	}
}

void
portAcl(rule_acl_var *aclVar, intrange *port){
	for(; port != NULL; port = port->next){
		aclVar->data[aclVar->length].intrange.i = port->i;
		aclVar->data[aclVar->length].intrange.j = port->j;
		aclVar->length++;
	}
/*	int x;
	for (x=0; x < aclVar->length; x++){
		debug(1, 1) ("name:%s   i:%d\n", aclVar->name, x);
		debug(1, 1) ("i:%d   j:%d\n", aclVar->data[x].intrange.i, aclVar->data[x].intrange.j);
	}*/
}

void
ipAcl(rule_acl_var *aclVar, splayNode *splay){
	if (splay){
		acl_ip_data *q = (acl_ip_data *)splay->data;
		aclVar->data[aclVar->length].ip_data.addr1 = q->addr1;
		aclVar->data[aclVar->length].ip_data.addr2 = q->addr2;
		aclVar->data[aclVar->length].ip_data.mask = q->mask;
		//debug(1, 1) ("name: %s \n", aclVar->name);
		//debug(1, 1) ("1: %s\n", inet_ntoa(aclVar->data[aclVar->length].ip_data.addr1));
		//debug(1, 1) ("2: %s\n", inet_ntoa(aclVar->data[aclVar->length].ip_data.addr2));
		//debug(1, 1) ("mask: %s\n", inet_ntoa(aclVar->data[aclVar->length].ip_data.mask));
		aclVar->length++;
		//debug(1, 1) ("length:%d\n", aclVar->length);
		ipAcl(aclVar, splay->left);
		ipAcl(aclVar, splay->right);
	}
}

void
domainAcl(rule_acl_var *aclVar, splayNode *splay){
	if (splay){
		char *a = (char *)splay->data;
		strcpy(aclVar->data[aclVar->length].domain, a);
		aclVar->length++;
		domainAcl(aclVar, splay->left);
		domainAcl(aclVar, splay->right);
	}
}

void
timeAcl(rule_acl_var *aclVar, acl_time_data *time){
	for(; time != NULL; time = time->next){
		aclVar->data[aclVar->length].time.weekbits = time->weekbits;
		aclVar->data[aclVar->length].time.start = time->start;
		aclVar->data[aclVar->length].time.stop = time->stop;
		aclVar->length++;
	}
/*	int x;
	for (x=0; x < aclVar->length; x++){
		debug(1, 1) ("name:%s   i:%d\n", aclVar->name, x);
		debug(1, 1) ("weekbits:%d   start:%d   stop:%d\n", aclVar->data[x].time.weekbits, \
				aclVar->data[x].time.start, aclVar->data[x].time.stop);
	}*/
}

void
methodAcl(rule_acl_var *aclVar, intlist *method){
	for(; method != NULL; method = method->next){
		aclVar->data[aclVar->length].method = method->i;
		aclVar->length++;
	}
/*	int x;
	for (x=0; x < aclVar->length; x++){
		debug(1, 1) ("name:%s   i:%d\n", aclVar->name, x);
		debug(1, 1) ("method:%d \n", aclVar->data[x].method);
	}*/
}

void
protoAcl(rule_acl_var *aclVar, intlist *proto){
	for(; proto != NULL; proto = proto->next){
		aclVar->data[aclVar->length].proto = proto->i;
		aclVar->length++;
	}
}

void
rule_send()
{
	int sock_cli = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

	struct sockaddr_in servaddr;
	memset(&servaddr, 0, sizeof(servaddr));
	servaddr.sin_family = AF_INET;
	servaddr.sin_port = htons(8887);
	servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");

	if(connect(sock_cli, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0){
		debug(1, 1) ("connect error\n");
		return;
	}
    char sendbuf[1024];
    char recvbuf[10];
    rule_table *cur;
    int message_len;
    int recv_ok = 1;
    int recv_len;
    for (cur=RuleTable; cur!=NULL&&recv_ok; cur = cur->next){
    	message_len = cur->length;
    	memcpy(sendbuf, &(cur->matches), message_len);
    	int len = send(sock_cli, sendbuf, message_len, 0);
    	//debug(1, 1) ("properties allow:%d\n", cur->properties.allow);
    	//debug(1, 1) ("properties lentgh:%d\n", cur->properties.length);
    	debug(1, 1) ("send len:%d\n", len);
    	recv_ok = 0;
    	recv_len = recv(sock_cli, recvbuf, 10, 0);
    	recvbuf[recv_len] = '\0';
    	if (strcmp(recvbuf, "ok") == 0)
    		recv_ok = 1;
    }
    if(recv_ok){
    	strcpy(sendbuf, "over");
    	send(sock_cli, sendbuf, strlen(sendbuf), 0);
    }
	close(sock_cli);
}

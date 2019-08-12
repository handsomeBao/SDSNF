#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/shm.h>
#include<inttypes.h>

#define MYPORT  8887
#define QUEUE   20
#define BUFFER_SIZE 1024

struct _basic_header{
	uint16_t spts[2];   /* source ports range */
	uint16_t dpts[2];    /* destination ports range */
	uint32_t flags;
	struct in_addr src_ip;
	struct in_addr dst_ip;
	struct in_addr mask;
	int proto;
};

union _rule_data{
	struct{
		int i;
		int j;
	}intrange;
	struct{
		struct in_addr addr1;
		struct in_addr addr2;
		struct in_addr mask;
	}ip_data;
	struct{
		int weekbits;
		int start;
		int stop;
	}time;
	int method;
	int proto;
	char domain[20];
};

struct _rule_acl_var{
	int op;
	char name[32];
	int type;
	int length;
	union _rule_data data[10];
};

struct _rule_properties{
	int allow;
	int length;
	struct _rule_acl_var aclVar[0];
};

struct _rule_table{
	struct _basic_header basic;
	uint8_t priority;
	int acttype;
	int actdesc;
	int length;
	struct _rule_properties properties;
};


int main()
{

    int server_sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);

    struct sockaddr_in server_sockaddr;
    server_sockaddr.sin_family = AF_INET;
    server_sockaddr.sin_port = htons(MYPORT);
    server_sockaddr.sin_addr.s_addr = htonl(INADDR_ANY);

    int on=1;
    if((setsockopt(server_sockfd,SOL_SOCKET,SO_REUSEADDR, &on, sizeof(on)))<0)
    {
        perror("setsockopt failed");
        exit(EXIT_FAILURE);
    }

    if (bind(server_sockfd, (struct sockaddr *)&server_sockaddr, sizeof(server_sockaddr)) == -1){
        perror("bind");
        exit(1);
    }

    if (listen(server_sockfd, QUEUE) == -1){
        perror("listen");
        exit(1);
    }

    char buffer[BUFFER_SIZE];
    struct sockaddr_in client_addr;
    socklen_t length = sizeof(client_addr);
    while(1){
        int conn = accept(server_sockfd, (struct sockaddr *)&client_addr, &length);
        if (conn < 0){
            perror("connect");
            exit(1);
        }
        printf("%s\n", inet_ntoa(client_addr.sin_addr));
        struct _rule_table recvRule;
        int i;
        int j;
        int recv_num = 0;
        int len = 0;
        char sendOK[10];
        while (1){
            memset(buffer, 0, sizeof(buffer));
            len = recv(conn, buffer, sizeof(buffer), 0);
            if (len > 0){
                if(len == 4){
                    buffer[len] = '\0';
                    printf("overbuf: %s\n", buffer);
                    if (strcmp(buffer, "over") == 0){;
                        recv_num = 0;
                        close(conn);
                        printf("change recv num%d\n", recv_num);
                        break;
                    }
                }
                recv_num ++;
                printf("recv len:%d recv mun:%d\n", len, recv_num);
                memset(&recvRule,0,sizeof(struct _rule_table));
                memcpy(&recvRule, buffer, len);
                strcpy(sendOK,"ok");
                send(conn, sendOK, strlen(sendOK), 0);
                //printf("length:%d  priority:%d  proto:%d\n", recvRule.length, recvRule.priority, recvRule.basic.proto);
                //printf("type: %d, desc: %d  ", recvRule.acttype, recvRule.actdesc);
                printf("properties allow:%d    properties length: %d\n", recvRule.properties.allow, recvRule.properties.length);
                for (i=0; i<recvRule.properties.length; i++){
                    //printf("op: %d, name: %s, length: %d\n", recvRule.properties.aclVar[i].op, \
                           recvRule.properties.aclVar[i].name, recvRule.properties.aclVar[i].length );
                    printf("type: %d \n", recvRule.properties.aclVar[i].type);
                    switch(recvRule.properties.aclVar[i].type){
                        case 1:
                        case 2:
                        case 3: // ip
                            printf("ruleip, src:%s   ", inet_ntoa(recvRule.basic.src_ip));
                            printf("dst:%s   ", inet_ntoa(recvRule.basic.dst_ip));
                            printf("mask:%s\n", inet_ntoa(recvRule.basic.mask));
                            for(j=0; j<recvRule.properties.aclVar[i].length; j++){
                                printf("1: %s  ", inet_ntoa(recvRule.properties.aclVar[i].data[j].ip_data.addr1));
                                printf("2: %s  ", inet_ntoa(recvRule.properties.aclVar[i].data[j].ip_data.addr2));
                                printf("mask: %s\n", inet_ntoa(recvRule.properties.aclVar[i].data[j].ip_data.mask));
                            }
                            break;
                        case 4:
                        case 5: // domain
                            for(j=0; j<recvRule.properties.aclVar[i].length; j++){
                                printf("domain: %s\n", recvRule.properties.aclVar[i].data[j].domain);
                            }
                            break;
                        case 8: //time
                            for(j=0; j<recvRule.properties.aclVar[i].length; j++){
                                printf("weekbits: %d  ", recvRule.properties.aclVar[i].data[j].time.weekbits);
                                printf("start: %d  ", recvRule.properties.aclVar[i].data[j].time.start);
                                printf("stop: %d\n", recvRule.properties.aclVar[i].data[j].time.stop);
                            }
                            break;
                        case 11: //port
                            printf("ruleport, port1:%d   port2:%d\n", recvRule.basic.dpts[0], recvRule.basic.dpts[1]);
                            for(j=0; j<recvRule.properties.aclVar[i].length; j++)
                                printf("i: %d, j: %d\n", recvRule.properties.aclVar[i].data[j].intrange.i, recvRule.properties.aclVar[i].data[j].intrange.j);
                            break;
                        case 17: //proto
                            for(j=0; j<recvRule.properties.aclVar[i].length; j++)
                                printf("i: %d\n", recvRule.properties.aclVar[i].data[j].proto);
                            break;
                        case 18: //method
                            for(j=0; j<recvRule.properties.aclVar[i].length; j++)
                                printf("i: %d\n", recvRule.properties.aclVar[i].data[j].method);
                            break;
                        default:
                            break;
                    }
                }
            }
        }
    }
    close(server_sockfd);

    return 0;
}


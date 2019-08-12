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

#define MYPORT  8887
#define BUFFER_SIZE 1024


typedef enum _ConfigOP{
	Add,
	Modify,
	Delete
}ConfigOP;

int main()
{
    int sock_cli = socket(AF_INET, SOCK_STREAM, 0);

    struct sockaddr_in servaddr;
    memset(&servaddr, 0, sizeof(servaddr));
    servaddr.sin_family = AF_INET;
    servaddr.sin_port = htons(8888);
    servaddr.sin_addr.s_addr = inet_addr("127.0.0.1");

    if(connect(sock_cli, (struct sockaddr *)&servaddr, sizeof(servaddr)) < 0){
        perror("connect");
        exit(1);
    }

    struct sockaddr_in addrMy;
    memset(&addrMy,0,sizeof(addrMy));
    int len = sizeof(addrMy);

    getsockname(sock_cli,(struct sockaddr*)&addrMy, &len);

    char recvbuf[BUFFER_SIZE];

    int priority = 4;
    ConfigOP op = Delete;
    char config[] = "http_access allow SINA";
    char sendbuf[BUFFER_SIZE];
    memset(sendbuf, 0, sizeof(sendbuf));
    memcpy(sendbuf, (char *)&priority, sizeof(int));
    memcpy(sendbuf+sizeof(int), (char *)&op, sizeof(ConfigOP));
    memcpy(sendbuf+sizeof(int)+sizeof(ConfigOP), config, sizeof(config));
    printf("fd:%d, port:%d\n", sock_cli, addrMy.sin_port);
    if (op == Delete){
        printf("%s, %ld\n", sendbuf, sizeof(int)+sizeof(ConfigOP));
        send(sock_cli, sendbuf, sizeof(int)+sizeof(ConfigOP), 0);
    }else{
        printf("%s, %ld\n", sendbuf, sizeof(int)+sizeof(ConfigOP)+sizeof(config));
        send(sock_cli, sendbuf, sizeof(int)+sizeof(ConfigOP)+sizeof(config), 0);
    }
    //recv(sock_cli, recvbuf, sizeof(recvbuf), 0);
    //fputs(recvbuf, stdout);
    close(sock_cli);
    return 0;
}

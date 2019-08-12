################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../lib/Array.o \
../lib/Stack.o \
../lib/base64.o \
../lib/getfullhostname.o \
../lib/hash.o \
../lib/heap.o \
../lib/html_quote.o \
../lib/iso3307.o \
../lib/md5.o \
../lib/ntlmauth.o \
../lib/radix.o \
../lib/rfc1035.o \
../lib/rfc1123.o \
../lib/rfc1738.o \
../lib/rfc2617.o \
../lib/safe_inet_addr.o \
../lib/splay.o \
../lib/stub_memaccount.o \
../lib/util.o \
../lib/uudecode.o 

C_SRCS += \
../lib/Array.c \
../lib/GNUregex.c \
../lib/Stack.c \
../lib/base64.c \
../lib/dirent.c \
../lib/dlmalloc.c \
../lib/drand48.c \
../lib/encrypt.c \
../lib/getfullhostname.c \
../lib/getopt.c \
../lib/hash.c \
../lib/heap.c \
../lib/html_quote.c \
../lib/inet_ntoa.c \
../lib/initgroups.c \
../lib/iso3307.c \
../lib/md5.c \
../lib/ntlmauth.c \
../lib/radix.c \
../lib/rfc1035.c \
../lib/rfc1123.c \
../lib/rfc1738.c \
../lib/rfc2617.c \
../lib/safe_inet_addr.c \
../lib/snprintf.c \
../lib/splay.c \
../lib/sspwin32.c \
../lib/strerror.c \
../lib/strsep.c \
../lib/stub_memaccount.c \
../lib/tempnam.c \
../lib/util.c \
../lib/uudecode.c \
../lib/win32lib.c 

OBJS += \
./lib/Array.o \
./lib/GNUregex.o \
./lib/Stack.o \
./lib/base64.o \
./lib/dirent.o \
./lib/dlmalloc.o \
./lib/drand48.o \
./lib/encrypt.o \
./lib/getfullhostname.o \
./lib/getopt.o \
./lib/hash.o \
./lib/heap.o \
./lib/html_quote.o \
./lib/inet_ntoa.o \
./lib/initgroups.o \
./lib/iso3307.o \
./lib/md5.o \
./lib/ntlmauth.o \
./lib/radix.o \
./lib/rfc1035.o \
./lib/rfc1123.o \
./lib/rfc1738.o \
./lib/rfc2617.o \
./lib/safe_inet_addr.o \
./lib/snprintf.o \
./lib/splay.o \
./lib/sspwin32.o \
./lib/strerror.o \
./lib/strsep.o \
./lib/stub_memaccount.o \
./lib/tempnam.o \
./lib/util.o \
./lib/uudecode.o \
./lib/win32lib.o 

C_DEPS += \
./lib/Array.d \
./lib/GNUregex.d \
./lib/Stack.d \
./lib/base64.d \
./lib/dirent.d \
./lib/dlmalloc.d \
./lib/drand48.d \
./lib/encrypt.d \
./lib/getfullhostname.d \
./lib/getopt.d \
./lib/hash.d \
./lib/heap.d \
./lib/html_quote.d \
./lib/inet_ntoa.d \
./lib/initgroups.d \
./lib/iso3307.d \
./lib/md5.d \
./lib/ntlmauth.d \
./lib/radix.d \
./lib/rfc1035.d \
./lib/rfc1123.d \
./lib/rfc1738.d \
./lib/rfc2617.d \
./lib/safe_inet_addr.d \
./lib/snprintf.d \
./lib/splay.d \
./lib/sspwin32.d \
./lib/strerror.d \
./lib/strsep.d \
./lib/stub_memaccount.d \
./lib/tempnam.d \
./lib/util.d \
./lib/uudecode.d \
./lib/win32lib.d 


# Each subdirectory must supply rules for building sources it contributes
lib/%.o: ../lib/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



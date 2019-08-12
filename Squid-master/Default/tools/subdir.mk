################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../tools/cachemgr__CGIEXT_-cachemgr.o \
../tools/squidclient.o 

C_SRCS += \
../tools/cachemgr.c \
../tools/cossdump.c \
../tools/squidclient.c 

OBJS += \
./tools/cachemgr.o \
./tools/cossdump.o \
./tools/squidclient.o 

C_DEPS += \
./tools/cachemgr.d \
./tools/cossdump.d \
./tools/squidclient.d 


# Each subdirectory must supply rules for building sources it contributes
tools/%.o: ../tools/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/external_acl/ip_user/dict.c \
../helpers/external_acl/ip_user/main.c \
../helpers/external_acl/ip_user/match.c 

OBJS += \
./helpers/external_acl/ip_user/dict.o \
./helpers/external_acl/ip_user/main.o \
./helpers/external_acl/ip_user/match.o 

C_DEPS += \
./helpers/external_acl/ip_user/dict.d \
./helpers/external_acl/ip_user/main.d \
./helpers/external_acl/ip_user/match.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/external_acl/ip_user/%.o: ../helpers/external_acl/ip_user/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/external_acl/session/squid_session.c 

OBJS += \
./helpers/external_acl/session/squid_session.o 

C_DEPS += \
./helpers/external_acl/session/squid_session.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/external_acl/session/%.o: ../helpers/external_acl/session/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



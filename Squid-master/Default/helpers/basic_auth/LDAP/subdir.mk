################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/basic_auth/LDAP/squid_ldap_auth.c 

OBJS += \
./helpers/basic_auth/LDAP/squid_ldap_auth.o 

C_DEPS += \
./helpers/basic_auth/LDAP/squid_ldap_auth.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/basic_auth/LDAP/%.o: ../helpers/basic_auth/LDAP/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



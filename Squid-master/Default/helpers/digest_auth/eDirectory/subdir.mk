################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/digest_auth/eDirectory/digest_pw_auth.c \
../helpers/digest_auth/eDirectory/edir_ldapext.c \
../helpers/digest_auth/eDirectory/ldap_backend.c 

OBJS += \
./helpers/digest_auth/eDirectory/digest_pw_auth.o \
./helpers/digest_auth/eDirectory/edir_ldapext.o \
./helpers/digest_auth/eDirectory/ldap_backend.o 

C_DEPS += \
./helpers/digest_auth/eDirectory/digest_pw_auth.d \
./helpers/digest_auth/eDirectory/edir_ldapext.d \
./helpers/digest_auth/eDirectory/ldap_backend.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/digest_auth/eDirectory/%.o: ../helpers/digest_auth/eDirectory/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/ntlm_auth/fakeauth/fakeauth_auth.c 

OBJS += \
./helpers/ntlm_auth/fakeauth/fakeauth_auth.o 

C_DEPS += \
./helpers/ntlm_auth/fakeauth/fakeauth_auth.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/ntlm_auth/fakeauth/%.o: ../helpers/ntlm_auth/fakeauth/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



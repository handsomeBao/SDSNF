################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/ntlm_auth/mswin_sspi/libntlmssp.c \
../helpers/ntlm_auth/mswin_sspi/ntlm_auth.c 

OBJS += \
./helpers/ntlm_auth/mswin_sspi/libntlmssp.o \
./helpers/ntlm_auth/mswin_sspi/ntlm_auth.o 

C_DEPS += \
./helpers/ntlm_auth/mswin_sspi/libntlmssp.d \
./helpers/ntlm_auth/mswin_sspi/ntlm_auth.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/ntlm_auth/mswin_sspi/%.o: ../helpers/ntlm_auth/mswin_sspi/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



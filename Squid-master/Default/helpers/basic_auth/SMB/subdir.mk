################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/basic_auth/SMB/smb_auth.c 

OBJS += \
./helpers/basic_auth/SMB/smb_auth.o 

C_DEPS += \
./helpers/basic_auth/SMB/smb_auth.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/basic_auth/SMB/%.o: ../helpers/basic_auth/SMB/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/basic_auth/mswin_sspi/mswin_auth.c \
../helpers/basic_auth/mswin_sspi/valid.c 

OBJS += \
./helpers/basic_auth/mswin_sspi/mswin_auth.o \
./helpers/basic_auth/mswin_sspi/valid.o 

C_DEPS += \
./helpers/basic_auth/mswin_sspi/mswin_auth.d \
./helpers/basic_auth/mswin_sspi/valid.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/basic_auth/mswin_sspi/%.o: ../helpers/basic_auth/mswin_sspi/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



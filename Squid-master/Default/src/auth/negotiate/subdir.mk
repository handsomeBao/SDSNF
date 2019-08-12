################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/auth/negotiate/auth_negotiate.c 

OBJS += \
./src/auth/negotiate/auth_negotiate.o 

C_DEPS += \
./src/auth/negotiate/auth_negotiate.d 


# Each subdirectory must supply rules for building sources it contributes
src/auth/negotiate/%.o: ../src/auth/negotiate/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



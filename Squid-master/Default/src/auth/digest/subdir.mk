################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/auth/digest/auth_digest.c 

OBJS += \
./src/auth/digest/auth_digest.o 

C_DEPS += \
./src/auth/digest/auth_digest.d 


# Each subdirectory must supply rules for building sources it contributes
src/auth/digest/%.o: ../src/auth/digest/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



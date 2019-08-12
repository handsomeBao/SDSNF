################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../src/auth/basic/auth_basic.o 

C_SRCS += \
../src/auth/basic/auth_basic.c 

OBJS += \
./src/auth/basic/auth_basic.o 

C_DEPS += \
./src/auth/basic/auth_basic.d 


# Each subdirectory must supply rules for building sources it contributes
src/auth/basic/%.o: ../src/auth/basic/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



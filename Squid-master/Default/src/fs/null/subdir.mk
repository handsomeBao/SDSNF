################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/fs/null/store_null.c 

OBJS += \
./src/fs/null/store_null.o 

C_DEPS += \
./src/fs/null/store_null.d 


# Each subdirectory must supply rules for building sources it contributes
src/fs/null/%.o: ../src/fs/null/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



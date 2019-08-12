################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../src/repl/lru/store_repl_lru.o 

C_SRCS += \
../src/repl/lru/store_repl_lru.c 

OBJS += \
./src/repl/lru/store_repl_lru.o 

C_DEPS += \
./src/repl/lru/store_repl_lru.d 


# Each subdirectory must supply rules for building sources it contributes
src/repl/lru/%.o: ../src/repl/lru/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



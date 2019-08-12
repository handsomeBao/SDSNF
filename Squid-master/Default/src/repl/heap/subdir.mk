################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/repl/heap/store_heap_replacement.c \
../src/repl/heap/store_repl_heap.c 

OBJS += \
./src/repl/heap/store_heap_replacement.o \
./src/repl/heap/store_repl_heap.o 

C_DEPS += \
./src/repl/heap/store_heap_replacement.d \
./src/repl/heap/store_repl_heap.d 


# Each subdirectory must supply rules for building sources it contributes
src/repl/heap/%.o: ../src/repl/heap/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



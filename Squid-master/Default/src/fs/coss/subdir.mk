################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/fs/coss/async_io.c \
../src/fs/coss/store_dir_coss.c \
../src/fs/coss/store_io_coss.c 

OBJS += \
./src/fs/coss/async_io.o \
./src/fs/coss/store_dir_coss.o \
./src/fs/coss/store_io_coss.o 

C_DEPS += \
./src/fs/coss/async_io.d \
./src/fs/coss/store_dir_coss.d \
./src/fs/coss/store_io_coss.d 


# Each subdirectory must supply rules for building sources it contributes
src/fs/coss/%.o: ../src/fs/coss/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/fs/diskd/diskd.c \
../src/fs/diskd/store_dir_diskd.c \
../src/fs/diskd/store_io_diskd.c 

OBJS += \
./src/fs/diskd/diskd.o \
./src/fs/diskd/store_dir_diskd.o \
./src/fs/diskd/store_io_diskd.o 

C_DEPS += \
./src/fs/diskd/diskd.d \
./src/fs/diskd/store_dir_diskd.d \
./src/fs/diskd/store_io_diskd.d 


# Each subdirectory must supply rules for building sources it contributes
src/fs/diskd/%.o: ../src/fs/diskd/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



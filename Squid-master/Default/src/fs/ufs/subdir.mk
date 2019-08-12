################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
O_SRCS += \
../src/fs/ufs/store_dir_ufs.o \
../src/fs/ufs/store_io_ufs.o 

C_SRCS += \
../src/fs/ufs/store_dir_ufs.c \
../src/fs/ufs/store_io_ufs.c 

OBJS += \
./src/fs/ufs/store_dir_ufs.o \
./src/fs/ufs/store_io_ufs.o 

C_DEPS += \
./src/fs/ufs/store_dir_ufs.d \
./src/fs/ufs/store_io_ufs.d 


# Each subdirectory must supply rules for building sources it contributes
src/fs/ufs/%.o: ../src/fs/ufs/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



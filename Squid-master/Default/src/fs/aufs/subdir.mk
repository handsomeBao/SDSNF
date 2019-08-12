################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/fs/aufs/aiops.c \
../src/fs/aufs/aiops_win32.c \
../src/fs/aufs/async_io.c \
../src/fs/aufs/store_dir_aufs.c \
../src/fs/aufs/store_io_aufs.c 

OBJS += \
./src/fs/aufs/aiops.o \
./src/fs/aufs/aiops_win32.o \
./src/fs/aufs/async_io.o \
./src/fs/aufs/store_dir_aufs.o \
./src/fs/aufs/store_io_aufs.o 

C_DEPS += \
./src/fs/aufs/aiops.d \
./src/fs/aufs/aiops_win32.d \
./src/fs/aufs/async_io.d \
./src/fs/aufs/store_dir_aufs.d \
./src/fs/aufs/store_io_aufs.d 


# Each subdirectory must supply rules for building sources it contributes
src/fs/aufs/%.o: ../src/fs/aufs/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



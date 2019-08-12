################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/basic_auth/MSNT/allowusers.c \
../helpers/basic_auth/MSNT/confload.c \
../helpers/basic_auth/MSNT/denyusers.c \
../helpers/basic_auth/MSNT/md4.c \
../helpers/basic_auth/MSNT/msntauth.c \
../helpers/basic_auth/MSNT/rfcnb-io.c \
../helpers/basic_auth/MSNT/rfcnb-util.c \
../helpers/basic_auth/MSNT/session.c \
../helpers/basic_auth/MSNT/smbdes.c \
../helpers/basic_auth/MSNT/smbencrypt.c \
../helpers/basic_auth/MSNT/smblib-util.c \
../helpers/basic_auth/MSNT/smblib.c \
../helpers/basic_auth/MSNT/usersfile.c \
../helpers/basic_auth/MSNT/valid.c 

OBJS += \
./helpers/basic_auth/MSNT/allowusers.o \
./helpers/basic_auth/MSNT/confload.o \
./helpers/basic_auth/MSNT/denyusers.o \
./helpers/basic_auth/MSNT/md4.o \
./helpers/basic_auth/MSNT/msntauth.o \
./helpers/basic_auth/MSNT/rfcnb-io.o \
./helpers/basic_auth/MSNT/rfcnb-util.o \
./helpers/basic_auth/MSNT/session.o \
./helpers/basic_auth/MSNT/smbdes.o \
./helpers/basic_auth/MSNT/smbencrypt.o \
./helpers/basic_auth/MSNT/smblib-util.o \
./helpers/basic_auth/MSNT/smblib.o \
./helpers/basic_auth/MSNT/usersfile.o \
./helpers/basic_auth/MSNT/valid.o 

C_DEPS += \
./helpers/basic_auth/MSNT/allowusers.d \
./helpers/basic_auth/MSNT/confload.d \
./helpers/basic_auth/MSNT/denyusers.d \
./helpers/basic_auth/MSNT/md4.d \
./helpers/basic_auth/MSNT/msntauth.d \
./helpers/basic_auth/MSNT/rfcnb-io.d \
./helpers/basic_auth/MSNT/rfcnb-util.d \
./helpers/basic_auth/MSNT/session.d \
./helpers/basic_auth/MSNT/smbdes.d \
./helpers/basic_auth/MSNT/smbencrypt.d \
./helpers/basic_auth/MSNT/smblib-util.d \
./helpers/basic_auth/MSNT/smblib.d \
./helpers/basic_auth/MSNT/usersfile.d \
./helpers/basic_auth/MSNT/valid.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/basic_auth/MSNT/%.o: ../helpers/basic_auth/MSNT/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



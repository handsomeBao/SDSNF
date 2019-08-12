################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/basic_auth/squid_radius_auth/squid_rad_auth.c \
../helpers/basic_auth/squid_radius_auth/util.c 

OBJS += \
./helpers/basic_auth/squid_radius_auth/squid_rad_auth.o \
./helpers/basic_auth/squid_radius_auth/util.o 

C_DEPS += \
./helpers/basic_auth/squid_radius_auth/squid_rad_auth.d \
./helpers/basic_auth/squid_radius_auth/util.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/basic_auth/squid_radius_auth/%.o: ../helpers/basic_auth/squid_radius_auth/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



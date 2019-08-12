################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/negotiate_auth/squid_kerb_auth/base64.c \
../helpers/negotiate_auth/squid_kerb_auth/squid_kerb_auth.c 

OBJS += \
./helpers/negotiate_auth/squid_kerb_auth/base64.o \
./helpers/negotiate_auth/squid_kerb_auth/squid_kerb_auth.o 

C_DEPS += \
./helpers/negotiate_auth/squid_kerb_auth/base64.d \
./helpers/negotiate_auth/squid_kerb_auth/squid_kerb_auth.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/negotiate_auth/squid_kerb_auth/%.o: ../helpers/negotiate_auth/squid_kerb_auth/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../helpers/negotiate_auth/squid_kerb_auth/spnegohelp/derparse.c \
../helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnego.c \
../helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnegohelp.c \
../helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnegoparse.c 

OBJS += \
./helpers/negotiate_auth/squid_kerb_auth/spnegohelp/derparse.o \
./helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnego.o \
./helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnegohelp.o \
./helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnegoparse.o 

C_DEPS += \
./helpers/negotiate_auth/squid_kerb_auth/spnegohelp/derparse.d \
./helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnego.d \
./helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnegohelp.d \
./helpers/negotiate_auth/squid_kerb_auth/spnegohelp/spnegoparse.d 


# Each subdirectory must supply rules for building sources it contributes
helpers/negotiate_auth/squid_kerb_auth/spnegohelp/%.o: ../helpers/negotiate_auth/squid_kerb_auth/spnegohelp/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



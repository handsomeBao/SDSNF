################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../snmplib/asn1.c \
../snmplib/coexistance.c \
../snmplib/mib.c \
../snmplib/parse.c \
../snmplib/snmp_api.c \
../snmplib/snmp_api_error.c \
../snmplib/snmp_error.c \
../snmplib/snmp_msg.c \
../snmplib/snmp_pdu.c \
../snmplib/snmp_vars.c \
../snmplib/snmplib_debug.c 

OBJS += \
./snmplib/asn1.o \
./snmplib/coexistance.o \
./snmplib/mib.o \
./snmplib/parse.o \
./snmplib/snmp_api.o \
./snmplib/snmp_api_error.o \
./snmplib/snmp_error.o \
./snmplib/snmp_msg.o \
./snmplib/snmp_pdu.o \
./snmplib/snmp_vars.o \
./snmplib/snmplib_debug.o 

C_DEPS += \
./snmplib/asn1.d \
./snmplib/coexistance.d \
./snmplib/mib.d \
./snmplib/parse.d \
./snmplib/snmp_api.d \
./snmplib/snmp_api_error.d \
./snmplib/snmp_error.d \
./snmplib/snmp_msg.d \
./snmplib/snmp_pdu.d \
./snmplib/snmp_vars.d \
./snmplib/snmplib_debug.d 


# Each subdirectory must supply rules for building sources it contributes
snmplib/%.o: ../snmplib/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -O2 -g -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



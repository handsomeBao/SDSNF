################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm

# All of the sources participating in the build are defined here
-include sources.mk
-include tools/subdir.mk
-include src/repl/lru/subdir.mk
-include src/repl/heap/subdir.mk
-include src/fs/ufs/subdir.mk
-include src/fs/null/subdir.mk
-include src/fs/diskd/subdir.mk
-include src/fs/coss/subdir.mk
-include src/fs/aufs/subdir.mk
-include src/auth/ntlm/subdir.mk
-include src/auth/negotiate/subdir.mk
-include src/auth/digest/subdir.mk
-include src/auth/basic/subdir.mk
-include src/subdir.mk
-include snmplib/subdir.mk
-include lib/subdir.mk
-include helpers/ntlm_auth/mswin_sspi/subdir.mk
-include helpers/ntlm_auth/fakeauth/subdir.mk
-include helpers/ntlm_auth/SMB/smbval/subdir.mk
-include helpers/ntlm_auth/SMB/subdir.mk
-include helpers/negotiate_auth/squid_kerb_auth/spnegohelp/subdir.mk
-include helpers/negotiate_auth/squid_kerb_auth/subdir.mk
-include helpers/negotiate_auth/mswin_sspi/subdir.mk
-include helpers/external_acl/unix_group/subdir.mk
-include helpers/external_acl/session/subdir.mk
-include helpers/external_acl/mswin_lm_group/subdir.mk
-include helpers/external_acl/mswin_ad_group/subdir.mk
-include helpers/external_acl/ldap_group/subdir.mk
-include helpers/external_acl/ip_user/subdir.mk
-include helpers/digest_auth/password/subdir.mk
-include helpers/digest_auth/ldap/subdir.mk
-include helpers/digest_auth/eDirectory/subdir.mk
-include helpers/basic_auth/squid_radius_auth/subdir.mk
-include helpers/basic_auth/mswin_sspi/subdir.mk
-include helpers/basic_auth/getpwnam/subdir.mk
-include helpers/basic_auth/YP/subdir.mk
-include helpers/basic_auth/SMB/subdir.mk
-include helpers/basic_auth/SASL/subdir.mk
-include helpers/basic_auth/PAM/subdir.mk
-include helpers/basic_auth/NCSA/subdir.mk
-include helpers/basic_auth/MSNT/subdir.mk
-include helpers/basic_auth/LDAP/subdir.mk
-include contrib/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: test

# Tool invocations
test: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GCC C++ Linker'
	g++  -o "test" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(C++_DEPS)$(C_DEPS)$(CC_DEPS)$(CPP_DEPS)$(EXECUTABLES)$(CXX_DEPS)$(C_UPPER_DEPS) test
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets

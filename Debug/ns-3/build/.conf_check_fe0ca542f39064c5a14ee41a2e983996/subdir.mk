################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns-3/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/test.cc 

OBJS += \
./ns-3/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/test.o 

CC_DEPS += \
./ns-3/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/test.d 


# Each subdirectory must supply rules for building sources it contributes
ns-3/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/%.o: ../ns-3/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



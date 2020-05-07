################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/application/adsr_core.cpp \
../src/application/chu_init.cpp \
../src/application/ddfs_core.cpp \
../src/application/gpio_cores.cpp \
../src/application/i2c_core.cpp \
../src/application/ps2_core.cpp \
../src/application/spi_core.cpp \
../src/application/sseg_core.cpp \
../src/application/timer_core.cpp \
../src/application/uart_core.cpp \
../src/application/vga_core.cpp \
../src/application/xadc_core.cpp 

OBJS += \
./src/application/adsr_core.o \
./src/application/chu_init.o \
./src/application/ddfs_core.o \
./src/application/gpio_cores.o \
./src/application/i2c_core.o \
./src/application/ps2_core.o \
./src/application/spi_core.o \
./src/application/sseg_core.o \
./src/application/timer_core.o \
./src/application/uart_core.o \
./src/application/vga_core.o \
./src/application/xadc_core.o 

CPP_DEPS += \
./src/application/adsr_core.d \
./src/application/chu_init.d \
./src/application/ddfs_core.d \
./src/application/gpio_cores.d \
./src/application/i2c_core.d \
./src/application/ps2_core.d \
./src/application/spi_core.d \
./src/application/sseg_core.d \
./src/application/timer_core.d \
./src/application/uart_core.d \
./src/application/vga_core.d \
./src/application/xadc_core.d 


# Each subdirectory must supply rules for building sources it contributes
src/application/%.o: ../src/application/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze g++ compiler'
	mb-g++ -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -I../../standalone_bsp_0/microblaze_I/include -mno-xl-reorder -mlittle-endian -mcpu=v10.0 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



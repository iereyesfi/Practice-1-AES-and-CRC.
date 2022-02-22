################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/src/core/ipv6/dhcp6.c \
../lwip/src/core/ipv6/ethip6.c \
../lwip/src/core/ipv6/icmp6.c \
../lwip/src/core/ipv6/inet6.c \
../lwip/src/core/ipv6/ip6.c \
../lwip/src/core/ipv6/ip6_addr.c \
../lwip/src/core/ipv6/ip6_frag.c \
../lwip/src/core/ipv6/mld6.c \
../lwip/src/core/ipv6/nd6.c 

OBJS += \
./lwip/src/core/ipv6/dhcp6.o \
./lwip/src/core/ipv6/ethip6.o \
./lwip/src/core/ipv6/icmp6.o \
./lwip/src/core/ipv6/inet6.o \
./lwip/src/core/ipv6/ip6.o \
./lwip/src/core/ipv6/ip6_addr.o \
./lwip/src/core/ipv6/ip6_frag.o \
./lwip/src/core/ipv6/mld6.o \
./lwip/src/core/ipv6/nd6.o 

C_DEPS += \
./lwip/src/core/ipv6/dhcp6.d \
./lwip/src/core/ipv6/ethip6.d \
./lwip/src/core/ipv6/icmp6.d \
./lwip/src/core/ipv6/inet6.d \
./lwip/src/core/ipv6/ip6.d \
./lwip/src/core/ipv6/ip6_addr.d \
./lwip/src/core/ipv6/ip6_frag.d \
./lwip/src/core/ipv6/mld6.d \
./lwip/src/core/ipv6/nd6.d 


# Each subdirectory must supply rules for building sources it contributes
lwip/src/core/ipv6/%.o: ../lwip/src/core/ipv6/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DFRDM_K64F -DFREEDOM -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 -DSERIAL_PORT_TYPE_UART=1 -DSDK_OS_FREE_RTOS -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\board" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\source" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\mdio" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\phy" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\lwip\contrib\apps\tcpecho" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\lwip\port" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\lwip\src" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\lwip\src\include" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\drivers" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\utilities" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\device" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\component\uart" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\component\serial_manager" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\component\lists" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\CMSIS" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\freertos\freertos_kernel\include" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\freertos\freertos_kernel\portable\GCC\ARM_CM4F" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lwip/src/netif/bridgeif.c \
../lwip/src/netif/bridgeif_fdb.c \
../lwip/src/netif/ethernet.c \
../lwip/src/netif/lowpan6.c \
../lwip/src/netif/lowpan6_ble.c \
../lwip/src/netif/lowpan6_common.c \
../lwip/src/netif/slipif.c \
../lwip/src/netif/zepif.c 

OBJS += \
./lwip/src/netif/bridgeif.o \
./lwip/src/netif/bridgeif_fdb.o \
./lwip/src/netif/ethernet.o \
./lwip/src/netif/lowpan6.o \
./lwip/src/netif/lowpan6_ble.o \
./lwip/src/netif/lowpan6_common.o \
./lwip/src/netif/slipif.o \
./lwip/src/netif/zepif.o 

C_DEPS += \
./lwip/src/netif/bridgeif.d \
./lwip/src/netif/bridgeif_fdb.d \
./lwip/src/netif/ethernet.d \
./lwip/src/netif/lowpan6.d \
./lwip/src/netif/lowpan6_ble.d \
./lwip/src/netif/lowpan6_common.d \
./lwip/src/netif/slipif.d \
./lwip/src/netif/zepif.d 


# Each subdirectory must supply rules for building sources it contributes
lwip/src/netif/%.o: ../lwip/src/netif/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MK64FN1M0VLL12 -DCPU_MK64FN1M0VLL12_cm4 -DUSE_RTOS=1 -DPRINTF_ADVANCED_ENABLE=1 -DFRDM_K64F -DFREEDOM -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1 -DSERIAL_PORT_TYPE_UART=1 -DSDK_OS_FREE_RTOS -DMCUXPRESSO_SDK -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\board" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\source" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\mdio" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\phy" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\lwip\contrib\apps\tcpecho" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\lwip\port" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\lwip\src" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\lwip\src\include" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\drivers" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\utilities" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\device" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\component\uart" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\component\serial_manager" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\component\lists" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\CMSIS" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\freertos\freertos_kernel\include" -I"C:\Users\MCRO\Documents\MCUXpressoIDE_11.4.1_6260\workspace\frdmk64f_lwip_tcpecho_freertos_ProyectoEdgar\freertos\freertos_kernel\portable\GCC\ARM_CM4F" -O0 -fno-common -g3 -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '



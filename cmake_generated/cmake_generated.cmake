# This is converter generated file, and shall not be touched by user
#
# It is always re-generated if converter script is called multiple times
# Use CMakeLists.txt to apply user changes
cmake_minimum_required(VERSION 3.22)

# Core MCU flags, CPU, instruction set and FPU setup
set(cpu_PARAMS ${cpu_PARAMS}
    -mthumb

    # -mcpu, -mfloat, -mfloat-abi config
    -mcpu=cortex-m7
    -mfpu=fpv5-d16
    -mfloat-abi=hard
)

# Linker script
set(linker_script_SRC ${linker_script_SRC} ${CMAKE_CURRENT_SOURCE_DIR}/linker_scripts/STM32H750VBTX_FLASH.ld)

# Sources
set(sources_SRCS ${sources_SRCS}
	${CMAKE_CURRENT_SOURCE_DIR}/Startup/startup_stm32h750vbtx.s
    ${CMAKE_CURRENT_SOURCE_DIR}/applications/main.c
	${CMAKE_CURRENT_SOURCE_DIR}/applications/shell_port.c
	${CMAKE_CURRENT_SOURCE_DIR}/applications/hardfault.c
	${CMAKE_CURRENT_SOURCE_DIR}/bsp/bsp.c	
	${CMAKE_CURRENT_SOURCE_DIR}/bsp/stm32h7xx_it.c
	${CMAKE_CURRENT_SOURCE_DIR}/bsp/src/bsp_key.c
	${CMAKE_CURRENT_SOURCE_DIR}/bsp/src/bsp_led.c
	${CMAKE_CURRENT_SOURCE_DIR}/bsp/src/bsp_timer.c
	${CMAKE_CURRENT_SOURCE_DIR}/bsp/src/bsp_uart_fifo.c	
	${CMAKE_CURRENT_SOURCE_DIR}/bsp/stm32h7xx_hal_timebase_tim_template.c
	
	#USB
	#${CMAKE_CURRENT_SOURCE_DIR}/applications/usb_init.c
	#${CMAKE_CURRENT_SOURCE_DIR}/Thrid_Party/CherryUSB-latest/osal/usb_osal_rtthread.c
	#${CMAKE_CURRENT_SOURCE_DIR}/Thrid_Party/CherryUSB-latest/port/dwc2/usb_glue_st.c
	#${CMAKE_CURRENT_SOURCE_DIR}/Thrid_Party/CherryUSB-latest/demo/cdc_acm_template.c
	#${CMAKE_CURRENT_SOURCE_DIR}/Thrid_Party/CherryUSB-latest/class/cdc/usbd_cdc.c
	#${CMAKE_CURRENT_SOURCE_DIR}/Thrid_Party/CherryUSB-latest/third_party/rt-thread-5.0/msh_cmd.c
	#${CMAKE_CURRENT_SOURCE_DIR}/Thrid_Party/CherryUSB-latest/core/usbd_core.c
	#${CMAKE_CURRENT_SOURCE_DIR}/Thrid_Party/CherryUSB-latest/port/dwc2/usb_dc_dwc2.c	
	
	#letter-shell
	${CMAKE_CURRENT_SOURCE_DIR}/Third_Party/letter-shell/src/shell_cmd_list.c
	${CMAKE_CURRENT_SOURCE_DIR}/Third_Party/letter-shell/src/shell_companion.c
	${CMAKE_CURRENT_SOURCE_DIR}/Third_Party/letter-shell/src/shell_ext.c
	${CMAKE_CURRENT_SOURCE_DIR}/Third_Party/letter-shell/src/shell.c

	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rcc.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_tim.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_spi.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pwr.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_tim_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_sai_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rcc_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_flash.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_flash_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_sram.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rtc.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_cortex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_i2c_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_i2s.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_cryp_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_sd.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_dma_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rtc_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_i2c.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_cryp.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_i2s_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_ll_sdmmc.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_usart.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_lptim.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_ll_delayblock.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_crc_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_gpio.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_uart_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_nor.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_mdma.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_dma.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_uart.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_comp.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rng.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_crc.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_cec.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_qspi.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_sai.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pwr_ex.c
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/CMSIS/Device/ST/STM32H7xx/Source/Templates/system_stm32h7xx.c
		
)

# Include directories
set(include_c_DIRS ${include_c_DIRS}
    ${CMAKE_CURRENT_SOURCE_DIR}/applications
	${CMAKE_CURRENT_SOURCE_DIR}/bsp	
	${CMAKE_CURRENT_SOURCE_DIR}/bsp/inc
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/STM32H7xx_HAL_Driver/Inc
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/CMSIS/Include
	${CMAKE_CURRENT_SOURCE_DIR}/libraries/CMSIS/Device/ST/STM32H7xx/Include	
	${CMAKE_CURRENT_SOURCE_DIR}/Third_Party/FreeRTOS-Kernel/include
	${CMAKE_CURRENT_SOURCE_DIR}/Third_Party/FreeRTOS-Kernel/portable/GCC/ARM_CM7/r0p1
	#${CMAKE_CURRENT_SOURCE_DIR}/libraries/HAL_Drivers/drv_flash
	
	#latter-shell
	${CMAKE_CURRENT_SOURCE_DIR}/Third_Party/letter-shell/src
)
set(include_cxx_DIRS ${include_cxx_DIRS})
set(include_asm_DIRS ${include_asm_DIRS})

# Symbols definition
#__STDC_LIMIT_MACROS, RT_USING_ARMLIBC, STM32H750xx, RT_USING_LIBC, 
#__CLK_TCK=RT_TICK_PER_SECOND, CONFIG_USB_DWC2_PORT=FS_PORT, __RTTHREAD__, USE_HAL_DRIVER
#"CONFIG_USB_DWC2_PORT=FS_PORT"
set(symbols_c_SYMB ${symbols_c_SYMB}	
	"STM32H750xx"
	"USE_HAL_DRIVER"
	SHELL_CFG_USER="shell_cfg_user.h"
)
set(symbols_cxx_SYMB ${symbols_cxx_SYMB})
set(symbols_asm_SYMB ${symbols_asm_SYMB}
    "DEBUG"
)

# 定义一个接口库 freertos_config
add_library(freertos_config INTERFACE)

target_include_directories(freertos_config SYSTEM
INTERFACE
	# FreeRTOSConfig路径
	${CMAKE_CURRENT_SOURCE_DIR}/applications
)

# 将projCOVERAGE_TEST宏设置为0
target_compile_definitions(freertos_config
  INTERFACE
    projCOVERAGE_TEST=0
)

# 设置变量FREERTOS_PATH的内容
set(FREERTOS_PATH ${CMAKE_CURRENT_SOURCE_DIR}/Third_Party/FreeRTOS-Kernel)

# 设置FreeRTOSD-Kernel的路径
add_subdirectory(${FREERTOS_PATH})

# 选择使用的内存管理文件
set( FREERTOS_HEAP "4" CACHE STRING "" FORCE)
# Select the native compile PORT
set( FREERTOS_PORT "RVDS_ARM_CM7" CACHE STRING "" FORCE)
# Select the cross-compile PORT
if (CMAKE_CROSSCOMPILING)
  #RVDS_ARM_CM7 GCC_ARM_CM7
  set( FREERTOS_PORT "GCC_ARM_CM7" CACHE STRING "" FORCE)  
endif()

# 需要将处理器信息传递到freertos_config中
target_compile_options(freertos_config INTERFACE ${cpu_PARAMS} )

# Link directories
set(link_DIRS ${link_DIRS}{{sr:link_DIRS}})

# Link libraries 链接库文件，同时库文件的头文件需要手动包含
set(link_LIBS ${link_LIBS}
    c
    m
	${CMAKE_CURRENT_SOURCE_DIR}/build/Debug/Third_Party/FreeRTOS-Kernel/libfreertos_kernel.a
)

# Compiler options
set(compiler_OPTS ${compiler_OPTS})

# Linker options
set(linker_OPTS ${linker_OPTS})

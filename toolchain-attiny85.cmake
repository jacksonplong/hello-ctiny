# Target platform
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)

# Toolchain
set(AVR_MCU "attiny85" CACHE STRING "Target AVR MCU")
set(AVR_FREQ "16000000UL" CACHE STRING "Target clock frequency (Hz)")

set(CMAKE_C_COMPILER avr-gcc)
set(CMAKE_CXX_COMPILER avr-g++)

# Compiler flags
set(CMAKE_C_FLAGS "-mmcu=${AVR_MCU} -DF_CPU=${AVR_FREQ} -Os")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")

# Prevent CMake from adding incompatible system libraries
set(CMAKE_EXE_LINKER_FLAGS "-mmcu=${AVR_MCU}")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

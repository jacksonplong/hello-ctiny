
cmake_minimum_required(VERSION 3.16)
project(hello-ctiny)

add_executable(main.elf
    src/main.c
)

# target_include_directories(main.elf PRIVATE my_lib)

# Generate HEX
add_custom_command(
    TARGET main.elf POST_BUILD
    COMMENT "Generating HEX, disassembly, and flashing fuses + firmware"
    
    # Convert to HEX
    COMMAND avr-objcopy -O ihex -R .eeprom main.elf main.hex
    
    # Convert to binary
    COMMAND avr-objcopy -O binary main.elf main.bin
    
    # View Hex
    COMMAND hexyl main.bin
    
    # View Assembly
#    COMMAND avr-objdump -D -m avr -b binary main.bin
    
    # Flash fuses (paths from source dir)
    COMMAND ${CMAKE_COMMAND} -E echo "Flashing fuses..."
    COMMAND avrdude -c usbtiny -p t85 -q -q -U lfuse:w:0xC2:m -U hfuse:w:0xDF:m -U efuse:w:0xFF:m   
    # Flash firmware
    COMMAND avrdude -c usbtiny -p t85 -q -U flash:w:main.hex
)

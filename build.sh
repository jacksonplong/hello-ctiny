cmake -B build -G Ninja -DCMAKE_TOOLCHAIN_FILE=toolchain-attiny85.cmake "$@"
cmake --build build

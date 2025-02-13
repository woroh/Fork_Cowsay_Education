cmake_minimum_required(VERSION 3.8)
project( cowsay )
set(CMAKE_CXX_STANDARD 17)

add_compile_options(-Wall -O2)

add_executable( cowsay main.cpp Cow.cpp Parser.cpp Field.cpp Cloud.cpp ASCIIPicture.cpp)

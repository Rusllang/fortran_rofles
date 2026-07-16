cmake_minimum_required(VERSION 3.16)

project(rofl LANGUAGES Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)

# set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -Wall -02")

add_subdirectory(modules)
add_subdirectory(src)
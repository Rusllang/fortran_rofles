cmake_minimum_required(VERSION 3.16)

project(rofl LANGUAGES Fortran)

file(GLOB SOURCES "./*.f90")

add_executable(test_cmake ${SOURCES})
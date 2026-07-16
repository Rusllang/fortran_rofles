file(GLOB CIRCLES_SOURCES "circles/*.f90")

add_executable(circles ${CIRCLES_SOURCES})

target_link_libraries(circles PRIVATE my_modules)

target_include_directories(circles PRIVATE ${CMAKE_Fortran_MODULE_DIRECTORY})

file(GLOB POINTS_SOURCES "points/*.f90")

add_executable(points ${POINTS_SOURCES})

target_link_libraries(points PRIVATE my_modules)

target_include_directories(points PRIVATE ${CMAKE_Fortran_MODULE_DIRECTORY})
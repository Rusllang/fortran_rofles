file(GLOB_RECURSE MODULE_SOURCES 
    "polymorphs/*.f90"
    "simple_classes/*.f90"
)

add_library(my_modules STATIC ${MODULE_SOURCES})

set_target_properties(my_modules PROPERTIES 
    Fortran_MODULE_DIRECTORY ${CMAKE_Fortran_MODULE_DIRECTORY}
)

target_include_directories(my_modules PUBLIC ${CMAKE_Fortran_MODULE_DIRECTORY})
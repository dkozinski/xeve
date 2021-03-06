cmake_minimum_required (VERSION 2.6)

# Check input arguments.
if(NOT SET_PROF)
  set(SET_PROF "MAIN")
endif()

if(("${SET_PROF}" STREQUAL "MAIN") OR ("${SET_PROF}" STREQUAL "BASE"))
  message("SET_PROF=${SET_PROF}")
else()
  message("SET_PORF should be BASE or MAIN [Input error: ${SET_PROF}]")
  return()
endif()
# Maps to a solution file (XEVE.sln).
project (XEVE)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Set compiler flags and options. 
if( MSVC )
elseif( UNIX OR MINGW )
    if(NOT CMAKE_BUILD_TYPE)
        set(CMAKE_BUILD_TYPE "Release")
    endif()
    message("CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}")

    if("${CMAKE_BUILD_TYPE}" STREQUAL "Debug")
        set(OPT_LV "O0")
    else()
        set(OPT_LV "O3")
    endif()

    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -${OPT_LV} -fomit-frame-pointer -Wall -Wno-unused-function -Wno-unused-but-set-variable -Wno-unused-variable -Wno-attributes -Werror -Wno-strict-overflow -Wno-unknown-pragmas -Wno-stringop-overflow -std=c99")
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-pointer-sign -pthread -Wno-pointer-to-int-cast -Wno-maybe-uninitialized")
    set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -lm")
endif()

# Command to output information to the console
message ("c Flags: " ${CMAKE_C_FLAGS})
message ("linker Flags: " ${CMAKE_EXE_LINKER_FLAGS})

# Sub-directories where more CMakeLists.txt exist
if(("${SET_PROF}" STREQUAL "BASE"))
   add_subdirectory(src_base)
endif()
if(("${SET_PROF}" STREQUAL "MAIN"))
   add_subdirectory(src_main)
endif()
add_subdirectory(app)

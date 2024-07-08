cmake_minimum_required(VERSION 3.25.0)
project(simple_linalg_kernels VERSION 0.1.0 LANGUAGES C CXX)

find_package(OpenMP REQUIRED)

# include_directories(${CMAKE_CURRENT_SOURCE_DIR}/cpp_baselines/lib/include)
include_directories(cpp_baselines/lib/include)

# add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/cpp_baselines)
add_subdirectory(cpp_baselines)
# include_directories(${CMAKE_CURRENT_SOURCE_DIR}/cpp_baselines/lib/include)

# get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
# foreach(dir ${dirs})
#   message(STATUS "dir='${dir}'")
# endforeach()

# message(dir="${CMAKE_CURRENT_SOURCE_DIR}")
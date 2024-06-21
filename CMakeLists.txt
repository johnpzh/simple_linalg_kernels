cmake_minimum_required(VERSION 3.25.0)
project(gemm VERSION 0.1.0 LANGUAGES C CXX)

find_package(OpenMP REQUIRED)

add_subdirectory(cpp_baselines)
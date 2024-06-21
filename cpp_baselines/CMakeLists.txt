add_executable(gemm gemm.cpp)
target_link_libraries(gemm PUBLIC OpenMP::OpenMP_CXX)
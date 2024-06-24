add_executable(gemm src/gemm.cpp)
target_link_libraries(gemm PUBLIC OpenMP::OpenMP_CXX)
add_subdirectory(lib)

# GEMM
# add_executable(gemm ${CMAKE_CURRENT_SOURCE_DIR}/src/gemm.cpp)
add_executable(gemm src/gemm.cpp)
target_link_libraries(gemm PUBLIC OpenMP::OpenMP_CXX)

# GEMV
# add_executable(gemv ${CMAKE_CURRENT_SOURCE_DIR}/src/gemv.cpp)
add_executable(gemv src/gemv.cpp)
target_link_libraries(gemv PUBLIC OpenMP::OpenMP_CXX)

# SpMM
# add_executable(spmm ${CMAKE_CURRENT_SOURCE_DIR}/src/spmm.cpp)
add_executable(spmm src/spmm.cpp)
target_link_libraries(spmm PUBLIC sparse_mm OpenMP::OpenMP_CXX)
# target_include_directories(spmm PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/lib/include)
# include_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib/include)

# SpMV
add_executable(spmv src/spmv.cpp)
target_link_libraries(spmv PUBLIC sparse_mm OpenMP::OpenMP_CXX)

# SpMM-v2
add_executable(spmm.v2 src/spmm.v2.cpp)
target_link_libraries(spmm.v2 PUBLIC sparse_mm OpenMP::OpenMP_CXX)

# SpMM-v3
add_executable(spmm.v3.schedule src/spmm.v3.schedule.cpp)
target_link_libraries(spmm.v3.schedule PUBLIC sparse_mm OpenMP::OpenMP_CXX)
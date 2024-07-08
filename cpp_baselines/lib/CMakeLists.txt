# Sparse Matrix Market Format Support
# add_library(sparse_mm 
#             ${CMAKE_CURRENT_SOURCE_DIR}/src/mmio.c
#             ${CMAKE_CURRENT_SOURCE_DIR}/src/mt_io.cpp
#             ${CMAKE_CURRENT_SOURCE_DIR}/src/sparse_matrix.cpp)
add_library(sparse_mm
            src/sparse.cpp
            src/mmio.cpp)

# target_include_directories(sparse_mm PUBLIC 
#                            ${CMAKE_CURRENT_SOURCE_DIR}/include)
# target_link_libraries(gemm PUBLIC OpenMP::OpenMP_CXX)

# # GEMV
# add_executable(gemv src/gemv.cpp)
# target_link_libraries(gemv PUBLIC OpenMP::OpenMP_CXX)
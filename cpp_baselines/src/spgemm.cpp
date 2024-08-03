#include <iostream>
#include <stdio.h>
#include <string.h>
#include <vector>
#include <chrono>
#include <algorithm>
#include <omp.h>
// #include "mt_io.h"
// #include "../lib/include/mt_io.h"
#include "sparse.h"

/**
 * Symbolic phase
 * C[i,k] = A[i,j] * B[j,k]
 */
void symbolic(CSRMatrix &A,
              CSRMatrix &B,
              CSRMatrix &C /* output */) {
    int64_t NI = A.num_rows_;
    int64_t NJ = A.num_cols_;
    int64_t NK = B.num_cols_;

    #pragma omp parallel
    {
    int64_t mark = 0;
    std::vector<int64_t> mark_array(NK, 0);

    #pragma omp for
    for (int64_t i_idx = 0; i_idx < NI; ++i_idx) {
        mark += 1;  /// Update mark to "reset" mark_array
        int64_t rowptr = 0;
        int64_t j_start = A.row_offsets_[i_idx];
        int64_t j_bound = A.row_offsets_[i_idx + 1];
        for (int64_t j = j_start; j < j_bound; ++j) {
            int64_t j_idx = A.col_ind_[j];
            int64_t k_start = B.row_offsets_[j_idx];
            int64_t k_bound = B.row_offsets_[j_idx + 1];
            for (int64_t k = k_start; k < k_bound; ++k) {
                int64_t k_idx = B.col_ind_[k];
                if (mark_array[k_idx] != mark) {  /// C[i_idx,k_idx] has not been seen yet
                    mark_array[k_idx] = mark;  /// Mark C[i_idx,k_idx] as seen
                    ++rowptr;
                }
            }
        }
        C.row_offsets_[i_idx] = rowptr;
    }  /// for (i_idx)
    }  /// #pragma omp parallel

    /// Reduce C.row_offsets_
    C.row_offsets_[NK] = 0;
    int64_t offset = 0;
    for (int64_t k_idx = 0; k_idx < NK + 1; ++k_idx) {
        int64_t curr = C.row_offsets_[k_idx];
        C.row_offsets_[k_idx] = offset;
        offset += curr;
    }
}

/**
 * Numeric phase.
 * C[i,k] = A[i,j] * B[j,k]
 */
void numeric(CSRMatrix &A,
             CSRMatrix &B,
             CSRMatrix &C) {
    int64_t NI = A.num_rows_;
    int64_t NJ = A.num_cols_;
    int64_t NK = B.num_cols_;

    #pragma omp parallel
    {
    int64_t mark = 0;
    std::vector<int64_t> mark_array(NK, 0);
    std::vector<double> ws_data(NK);

    #pragma omp for
    for (int64_t i_idx = 0; i_idx < NI; ++i_idx) {
        mark += 1;  /// Update mark to "reset" mark_array
        int64_t rowptr = C.row_offsets_[i_idx];  /// Provided by the symbolic phase
        int64_t j_start = A.row_offsets_[i_idx];
        int64_t j_bound = A.row_offsets_[i_idx + 1];
        for (int64_t j = j_start; j < j_bound; ++j) {
            int64_t j_idx = A.col_ind_[j];
            int64_t k_start = B.row_offsets_[j_idx];
            int64_t k_bound = B.row_offsets_[j_idx + 1];
            for (int64_t k = k_start; k < k_bound; ++k) {
                int64_t k_idx = B.col_ind_[k];
                if (mark_array[k_idx] != mark) {  /// C[i_idx,k_idx] has not been seen yet
                    mark_array[k_idx] = mark;  /// Mark C[i_idx,k_idx] as seen
                    C.col_ind_[rowptr++] = k_idx;
                    ws_data[k_idx] = A.values_[j] * B.values_[k];
                } else {
                    ws_data[k_idx] += A.values_[j] * B.values_[k];
                }
            }
        }

        int64_t k_start = C.row_offsets_[i_idx];
        int64_t k_bound = C.row_offsets_[i_idx + 1];
        std::sort(C.col_ind_ + k_start, C.col_ind_ + k_bound);
        for (int64_t k = k_start; k < k_bound; ++k) {
            int k_idx = C.col_ind_[k];
            C.values_[k] = ws_data[k_idx];
        }
    }  /// for (i_idx)
    }  /// #pragma omp parallel
}

void spgemm(const char *filename, bool debugging) {
    printf("filename: %s\n", filename);
    // std::cout << "NK: " << NK << std::endl;
    std::cout << "debugging: " << debugging << std::endl;

    /// Sparse matrix A
    CSRMatrix A;
    read_csr_matrix(filename, &A);

    /// Print matrix A
    if (debugging) {
        printf("\nCSMatrix A:\n");
        print_csr_matrix(&A);
    }

    /// Dense matrix B
    CSRMatrix B(A);
    if (debugging) {
        printf("\nCSMatrix B:\n");
        print_csr_matrix(&B);
    }
    int64_t NI = A.num_rows_;
    int64_t NJ = A.num_cols_;
    int64_t NK = B.num_cols_;

    // int64_t NK = 512;
    // int64_t NK = 32;
    // if (debugging) {
    //     NK = 4;
    // }

    // CSRMatrix &A = A;
    // std::vector<double> B(NJ * NK, 1.7);
    // std::vector<double> C(NI * NK, 0.0);
    CSRMatrix C;
    C.num_rows_ = NI;
    C.num_cols_ = NK;
    C.alloc_row_offsets_(NK + 1);

    // int num_threads = 8;
    // omp_set_num_threads(num_threads);
    // printf("num_threads: %d\n", num_threads);
    #pragma omp parallel
    {
        #pragma omp master
        printf("num_threads: %d\n", omp_get_num_threads());
    }


    int repeat = 100;
    if (debugging) {
        repeat = 1;
    }
    for (int r_i = 0; r_i < repeat; ++r_i) {

    auto start_time = std::chrono::high_resolution_clock::now();

    symbolic(A, B, C /* output */);

    int64_t nnz = C.row_offsets_[NK];
    C.nnz_ = nnz;
    C.alloc_col_ind(nnz);
    C.alloc_values(nnz);
    if (debugging) {
        printf("\nCSMatrix C after symbolic phase:\n");
        print_csr_matrix(&C);
    }

    numeric(A, B, C /* output */);

    auto end_time = std::chrono::high_resolution_clock::now();
    double exe_time = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time).count() / 1000000.0;
    printf("exe_time(s): %lf\n", exe_time);
    }  /// repeat loop
    printf("C.values_[0]: %lf\n", C.values_[0]);
    if (debugging) {
        printf("\nCSMatrix C:\n");
        print_csr_matrix(&C);
    }
}

int main(int argc, char *argv[]) {

    if (argc < 2) {
        fprintf(stderr, "Usage: %s <martix-market.mtx>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    bool debugging = false;
    if (argc >= 3 && strcmp("debug", argv[2]) == 0) {
        debugging = true;
    }

    // int64_t NK = strtoll(argv[2], nullptr, 0);

    spgemm(argv[1], debugging);

    return 0;
}
#include <iostream>
#include <stdio.h>
#include <string.h>
#include <vector>
#include <chrono>
#include <omp.h>
// #include "mt_io.h"
// #include "../lib/include/mt_io.h"
#include "sparse.h"

void spmm(const char *filename, bool debugging) {
    printf("filename: %s\n", filename);
    std::cout << "debugging: " << debugging << std::endl;

    /// Sparse matrix A
    CSRMatrix csr_matrix;
    read_csr_matrix(filename, &csr_matrix);

    /// Print matrix A
    if (debugging) {
        print_csr_matrix(&csr_matrix);
    }

    /// Dense matrix B
    int64_t NI = csr_matrix.num_rows_;
    int64_t NJ = csr_matrix.num_cols_;
    int64_t NK = 512;
    // int64_t NK = 32;
    if (debugging) {
        NK = 32;
    }

    CSRMatrix &A = csr_matrix;
    std::vector<double> B(NJ * NK, 1.7);
    std::vector<double> C(NI * NK, 0.0);

    int num_threads = 8;
    omp_set_num_threads(num_threads);
    printf("num_threads: %d\n", num_threads);


    int repeat = 100;
    if (debugging) {
        repeat = 1;
    }
    for (int r_i = 0; r_i < repeat; ++r_i) {

    auto start_time = std::chrono::high_resolution_clock::now();
    #pragma omp parallel for schedule(static)
    for (int64_t i = 0; i < NI; ++i) {
        int64_t j_loc_start = A.row_offsets_[i];
        int64_t j_loc_bound = A.row_offsets_[i + 1];
        for (int64_t j_loc = j_loc_start; j_loc < j_loc_bound; ++j_loc) {
            int64_t j = A.col_ind_[j_loc];
            double A_val = A.values_[j_loc];
            for (int64_t k = 0; k < NK; ++k) {
                double B_val = B[j * NK + k];
                C[i * NK + k] += A_val * B_val;
            }
        }
    }
    auto end_time = std::chrono::high_resolution_clock::now();
    double exe_time = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time).count() / 1000000.0;
    printf("exe_time(s): %lf\n", exe_time);

    }
    printf("C[6]: %lf\n", C[6]);
    if (debugging) {
        for (auto e : C) {
            printf("%lf,", e);
        }
        printf("\n");
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

    spmm(argv[1], debugging);

    return 0;
}
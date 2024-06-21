#include <iostream>
#include <stdio.h>
#include <vector>
#include <chrono>
#include <omp.h>

void gemm() {
    // int64_t NI = 8;
    // int64_t NJ = 4;
    // int64_t NK = 2;
    int64_t NI = 8000;
    int64_t NJ = 4000;
    int64_t NK = 2000;

    std::vector<double> a(NI * NJ, 2.2);
    std::vector<double> b(NJ * NK, 3.4);
    std::vector<double> c(NI * NK, 0.0);

    int num_threads = 8;
    omp_set_num_threads(num_threads);
    printf("num_threads: %d\n", num_threads);

    int repeat = 100;
    for (int r_i = 0; r_i < repeat; ++r_i) {

    auto start_time = std::chrono::high_resolution_clock::now();
    #pragma omp parallel for 
    for (int64_t i = 0; i < NI; ++i) {
        for (int64_t j = 0; j < NJ; ++j) {
            for (int64_t k = 0; k < NK; ++k) {
                c[i * NK + k] += a[i * NJ + j] * b[j * NK + k];
            }
        }
    }
    auto end_time = std::chrono::high_resolution_clock::now();
    double exe_time = std::chrono::duration_cast<std::chrono::microseconds>(end_time - start_time).count() / 1000000.0;
    printf("exe_time(s): %lf\n", exe_time);

    }
    printf("c[6]: %lf\n", c[6]);
    // double sum = 0;
    // for (auto e : c) {
    //     printf("%lf,", e);
    //     // sum += e;
    // }
    // printf("\nsum: %lf\n", sum);
}

int main(int argc, char *argv[]) {
    gemm();

    return 0;
}
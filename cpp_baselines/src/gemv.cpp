#include <iostream>
#include <stdio.h>
#include <vector>
#include <chrono>
#include <omp.h>

void gemv(int64_t NI, int64_t NJ) {
    // int64_t NI = 8;
    // int64_t NJ = 4;
    // int64_t NK = 2;
    // int64_t NI = 80000;
    // int64_t NJ = 16000;
    // int64_t NK = 200;
    std::cout << "Sizes:" << std::endl;
    std::cout << "NI: " << NI << " NJ: " << NJ << std::endl;

    std::vector<double> a(NI * NJ, 2.3);
    std::vector<double> b(NJ, 3.7);
    std::vector<double> c(NI, 0.0);

    // int num_threads = 8;
    // omp_set_num_threads(num_threads);
    // printf("num_threads: %d\n", num_threads);
    #pragma omp parallel
    {
        #pragma omp master
        printf("num_threads: %d\n", omp_get_num_threads());
    }

    int repeat = 100;
    for (int r_i = 0; r_i < repeat; ++r_i) {

    auto start_time = std::chrono::high_resolution_clock::now();
    #pragma omp parallel for 
    for (int64_t i = 0; i < NI; ++i) {
        for (int64_t j = 0; j < NJ; ++j) {
            c[i] += a[i * NJ + j] * b[j];
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
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <NI> <NJ> \nDescriptions: C[i,k] = A[i,j] * B[j]\n", argv[0]);
        return EXIT_FAILURE;
    }
    int64_t NI = strtoll(argv[1], nullptr, 0);
    int64_t NJ = strtoll(argv[2], nullptr, 0);

    gemv(NI, NJ);

    return 0;
}
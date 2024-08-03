#ifndef CPP_BASELINES_LIB_INCLUDE_SPARSE_H
#define CPP_BASELINES_LIB_INCLUDE_SPARSE_H

#include <iostream>
#include <vector>
#include "mmio.h"

/// CSR Matrix
struct CSRMatrix {
  int64_t num_rows_ = 0;
  int64_t num_cols_ = 0;
  int64_t nnz_ = 0;
  int64_t *row_offsets_ = nullptr;
  int64_t *col_ind_ = nullptr;
  double *values_ = nullptr;

  CSRMatrix() = default;
  CSRMatrix(int64_t num_rows,
            int64_t num_cols,
            int64_t nnz);
  CSRMatrix(const CSRMatrix &csr_matrix);
  virtual ~CSRMatrix();

  void alloc_row_offsets_(int64_t size);
  void alloc_col_ind(int64_t size);
  void alloc_values(int64_t size);
  void alloc_matrix(int64_t num_rows,
                    int64_t num_cols,
                    int64_t nnz);
};


/// Read Matrix Market file
int read_mm(const char *filename,
            MM_typecode &matcode,
            int &M, /// number of rows
            int &N, /// number of cols
            int &nz,  /// number of non-zeros
            std::vector< std::vector<std::pair<int, double> > > &edgelist);


/// Read CSR Matrix
void read_csr_matrix(const char *filename, CSRMatrix *csr_matrix);

void print_csr_matrix(const CSRMatrix *csr_matrix);


// /// 
// /// mmio
// typedef char MM_typecode[4];
// int mm_read_banner(FILE *f, MM_typecode *matcode);
// char *mm_typecode_to_str(MM_typecode matcode);

// /********************* MM_typecode query fucntions ***************************/

// #define mm_is_matrix(typecode)	((typecode)[0]=='M')

// #define mm_is_sparse(typecode)	((typecode)[1]=='C')
// #define mm_is_coordinate(typecode)((typecode)[1]=='C')
// #define mm_is_dense(typecode)	((typecode)[1]=='A')
// #define mm_is_array(typecode)	((typecode)[1]=='A')

// #define mm_is_complex(typecode)	((typecode)[2]=='C')
// #define mm_is_real(typecode)		((typecode)[2]=='R')
// #define mm_is_pattern(typecode)	((typecode)[2]=='P')
// #define mm_is_integer(typecode) ((typecode)[2]=='I')

// #define mm_is_symmetric(typecode)((typecode)[3]=='S')
// #define mm_is_general(typecode)	((typecode)[3]=='G')
// #define mm_is_skew(typecode)	((typecode)[3]=='K')
// #define mm_is_hermitian(typecode)((typecode)[3]=='H')


#endif /// CPP_BASELINES_LIB_INCLUDE_SPARSE_H
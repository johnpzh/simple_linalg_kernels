#include <algorithm>
#include "sparse.h"



/******* CSRMatrix **********/

void CSRMatrix::alloc_row_offsets_(int64_t size) {
  free(row_offsets_);
  row_offsets_ = (int64_t *) malloc(size * sizeof(*row_offsets_));
  if (row_offsets_ == nullptr) {
    fprintf(stderr, "Error: %s:%d CSRMatrix::alloc_row_b_offsets_() failed.\n", __FILE__, __LINE__);
    return;
  }
}

void CSRMatrix::alloc_col_ind(int64_t size) {
  free(col_ind_);
  col_ind_ = (int64_t *) malloc(size * sizeof(*col_ind_));
  if (col_ind_ == nullptr) {
    fprintf(stderr, "Error: %s:%d CSRMatrix::alloc_col_b_ind() failed.\n", __FILE__, __LINE__);
    return;
  }
}

void CSRMatrix::alloc_values(int64_t size) {
  free(values_);
  values_ = (double *) malloc(size * sizeof(*values_));
  if (values_ == nullptr) {
    fprintf(stderr, "Error: %s:%d CSRMatrix::alloc_values() failed.\n", __FILE__, __LINE__);
    return;
  }
}

void CSRMatrix::alloc_matrix(int64_t num_rows, int64_t num_cols, int64_t nnz) {
  num_rows_ = num_rows;
  num_cols_ = num_cols;
  nnz_ = nnz;
  alloc_row_offsets_(num_rows + 1);
  alloc_col_ind(nnz);
  alloc_values(nnz);
}

CSRMatrix::CSRMatrix(int64_t num_rows, int64_t num_cols, int64_t nnz) {
  alloc_matrix(num_rows, num_cols, nnz);
}

CSRMatrix::CSRMatrix(const CSRMatrix &csr_matrix) {
  alloc_matrix(csr_matrix.num_rows_,
               csr_matrix.num_cols_,
               csr_matrix.nnz_);
  
  std::copy(csr_matrix.row_offsets_, csr_matrix.row_offsets_ + num_rows_ + 1, row_offsets_);
  std::copy(csr_matrix.col_ind_, csr_matrix.col_ind_ + nnz_, col_ind_);
  std::copy(csr_matrix.values_, csr_matrix.values_ + nnz_, values_);
}

CSRMatrix::~CSRMatrix() {
  free(row_offsets_);
  free(col_ind_);
  free(values_);
}

/******* End CSRMatrix **********/


/// Read Matrix Market file
int read_mm(const char *filename,
                MM_typecode &matcode,
                int &M, /// number of rows
                int &N, /// number of cols
                int &nz,  /// number of non-zeros
                std::vector< std::vector< std::pair<int, double> > > &edgelist) {
  int ret_code;
//  MM_typecode matcode;
  FILE *f;

  if ((f = fopen(filename, "r")) == nullptr) {
    fprintf(stderr, "Error: can't open file %s .\n", filename);
    exit(1);
  }

  printf("\nLoading %s ...\n", filename);

  if (mm_read_banner(f, &matcode) != 0)
  {
    printf("Could not process Matrix Market banner.\n");
    exit(1);
  }


  /*  This is how one can screen matrix types if their application */
  /*  only supports a subset of the Matrix Market data types.      */

  if (mm_is_complex(matcode) && mm_is_matrix(matcode) &&
      mm_is_sparse(matcode) )
  {
    printf("Sorry, this application does not support ");
    printf("Market Market type: [%s]\n", mm_typecode_to_str(matcode));
    exit(1);
  }

//  /// Check if the matrix is symmetric
  bool is_symmetric = mm_is_symmetric(matcode);

  /* find out size of sparse matrix .... */
  if ((ret_code = mm_read_mtx_crd_size(f, &M, &N, &nz)) !=0)
    exit(ret_code);

  /* NOTE: when reading in doubles, ANSI C requires the use of the "l"  */
  /*   specifier as in "%lg", "%lf", "%le", otherwise errors will occur */
  /*  (ANSI C X3.159-1989, Sec. 4.9.6.2, p. 136 lines 13-15)            */

  mm_write_banner(stdout, matcode);
  mm_write_mtx_crd_size(stdout, M, N, nz);
  int num_symmetric_edge = 0;
  edgelist.resize(M);
//  for (int i = 0; i < nz; ++i) {
//    int from;
//    int to;
//    double v;
//    fscanf(f, "%d %d %lg\n", &from, &to, &v);
//    --from;  // adjust from 1-based to 0-based
//    --to;
////    printf("i: %d from: %d to: %d v: %lf\n", i, from+1, to+1, v);
////    edgelist[from].emplace_back(to, v);
//    edgelist[from].push_back(std::make_pair(to, v));  /// Notes: emplace_back would get errors for the shipset1 matrix.
//
//    if (is_symmetric && from != to) {
//      edgelist[to].emplace_back(from, v);
//      ++num_symmetric_edge;
//    }
//
//    if (i < 9) {
//      printf("%d %d %20.19g\n", from + 1, to + 1, v);
//    } else if (i == 9) {
//      printf("( ... )\n");
//    }
//  }

  char buffer[65536];
  int count = 0;
  while (fgets(buffer, sizeof(buffer), f) != nullptr) {
    int from;
    int to;
    double v;
    int num_nums = sscanf(buffer, "%d %d %lg\n", &from, &to, &v);
    if (num_nums == 2) {
      /// Some matrices do not contains values of edges.
      // v = 17.0;
      v = 1.0;
    } else if (num_nums != 3) {
      fprintf(stderr, "Error: %s:%d the line (%s) in the matrix (%s) is broken, does not contain 2 or 3 numbers.\n",
              __FILE__, __LINE__, buffer, filename);
      exit(EXIT_FAILURE);
    }
    --from;  // adjust from 1-based to 0-based
    --to;
//    edgelist[from].emplace_back(to, v);
    edgelist[from].push_back(std::make_pair(to, v));  /// Notes: emplace_back would get errors for the shipset1 matrix.

    if (is_symmetric && from != to) {
      edgelist[to].emplace_back(from, v);
      ++num_symmetric_edge;
    }

    if (count < 9) {
      printf("%d %d %20.19g\n", from + 1, to + 1, v);
    } else if (count == 9) {
      printf("( ... )\n");
    }

    ++count;
  }
  if (count != nz) {
    fprintf(stderr, "Error: %s:%d matrix %s only contains %d edges, not %d as claimed in the header.\n",
            __FILE__, __LINE__, filename, count, nz);
    exit(EXIT_FAILURE);
  }

  if (is_symmetric) {
    nz += num_symmetric_edge;
  }

  /// Sort the edges
  for (int row_ind = 0; row_ind < M; ++row_ind) {
    std::sort(edgelist[row_ind].begin(), edgelist[row_ind].end());
  }

  /// Close the file
  fclose(f);

  return ret_code;
}


/// Read CSR Matrix
void read_csr_matrix(const char *filename,
                         CSRMatrix *csr_matrix) {
  /// Read Matrix Market file
  MM_typecode matcode;
  int M;  // number of rows
  int N;  // number of columns
  int nz;  // number of non-zeros
//  std::vector< std::vector<int> > edgelist;
//  std::vector< std::vector<double> > value_list;
  std::vector< std::vector< std::pair<int, double> > > edgelist;
  read_mm(filename,
          matcode,
          M,
          N,
          nz,
          edgelist);

  // /// Out-of-memory check
  // {
  //   int64_t memory_size = nz * sizeof(*csr_matrix->values_) / 1000000000;
  //   if (memory_size > MAX_MEMORY_GB) {
  //     fprintf(stderr, "Error: %s:%d CSR matrix requires %lld GB memory, larger than the limit %lld BG.\n",
  //             __FILE__, __LINE__, memory_size, MAX_MEMORY_GB);
  //     return;
  //   }
  // }
  /// Allocate csr_matrix
  csr_matrix->alloc_matrix(M, N, nz);

  /// Copy edgelist to csr_matrix
  int offset = 0;
  for (int row = 0; row < M; ++row) {
    csr_matrix->row_offsets_[row] = offset;
    for (int col_i = 0; col_i < edgelist[row].size(); ++col_i) {
      int col = edgelist[row][col_i].first;
      double val = edgelist[row][col_i].second;
//      double val = value_list[row][col_i];
      csr_matrix->col_ind_[offset] = col;
      csr_matrix->values_[offset] = val;
      ++offset;
    }
  }
  csr_matrix->row_offsets_[M] = offset;

//  /************************/
//  /* now write out matrix */
//  /************************/
//
//  printf("\nPrinting CSR matrix...\n");
//  mm_write_banner(stdout, matcode);
//  mm_write_mtx_crd_size(stdout, M, N, nz);
//  int print_count = 0;
//  int print_limit = 9;
//  for (int64_t row = 0; row < csr_matrix->num_rows_ && print_count < print_limit; ++row) {
//    for (int64_t col_loc = csr_matrix->row_offsets_[row]; col_loc < csr_matrix->row_offsets_[row + 1]; ++col_loc) {
//      int64_t col = csr_matrix->col_ind_[col_loc];
//      double val = csr_matrix->values_[col_loc];
//      fprintf(stdout, "%lld %lld %20.19g\n",
//              row + 1,
//              col + 1,
//              val);
//      ++print_count;
//      if (print_count == print_limit) {
//        printf("( ... )\n");
//        break;
//      }
//    }
//  }
}


/// Print CSR Matrix
void print_csr_matrix(const CSRMatrix *csr_matrix) {
  printf("Printing CSR Matrix...\n");
  // printf("num_rows_: %lld\n", csr_matrix->num_rows_);
  // printf("num_cols_: %lld\n", csr_matrix->num_cols_);
  // printf("nnz_: %lld\n", csr_matrix->nnz_);
  std::cout << "num_rows_: " << csr_matrix->num_rows_ << std::endl;
  std::cout << "num_cols_: " << csr_matrix->num_cols_ << std::endl;
  std::cout << "nnz_: " << csr_matrix->nnz_ << std::endl;
  printf("row_offsets_:\n");
  for (int64_t i = 0; i < csr_matrix->num_rows_ + 1; ++i) {
    // printf("%lld ", csr_matrix->row_offsets_[i]);
    std::cout << csr_matrix->row_offsets_[i] << " ";
  }
  printf("\n");

  printf("col_ind_:\n");
  for (int64_t i = 0; i < csr_matrix->nnz_; ++i) {
    // printf("%lld ", csr_matrix->col_ind_[i]);
    std::cout << csr_matrix->col_ind_[i] << " ";
  }
  printf("\n");

  printf("values_:\n");
  for (int64_t i = 0; i < csr_matrix->nnz_; ++i) {
    // printf("%lf ", csr_matrix->values_[i]);
    std::cout << csr_matrix->values_[i] << " ";
  }
  printf("\n");
}


///
/// mmio


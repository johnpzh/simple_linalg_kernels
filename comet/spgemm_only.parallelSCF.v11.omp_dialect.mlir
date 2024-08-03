module  {
  
  ////////////////////////////////////////////////////////////////
  //// symbolic_phase function to do symbolic phase
  //// parameters are matched with those in the main function
  ////////////////////////////////////////////////////////////////
  func.func @symbolic_phase(
                %12 : memref<?xindex>,  // A.rowptr
                %14 : memref<?xindex>,  // A.col
                %16 : memref<?xf64>,  // A.val
                %30 : memref<?xindex>,  // B.rowptr
                %32 : memref<?xindex>,  // B.col
                %34 : memref<?xf64>,  // B.val
                %52 : index,  // num_rows
                %C_rowptr : memref<?xindex>,  // C.rowptr
                %C_size : memref<1xindex>)  // C.size
                // %ws_bitmaps : memref<24x?xi8>,  // ws.bitmaps
                // %ws_col_lists : memref<24x?xindex>,  // ws.col_lists
                // %ws_col_list_sizes : memref<24xindex>) // ws.col_list_sizes
                -> () {

    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0_i8 = arith.constant 0 : i8
    %c1_i8 = arith.constant 1 : i8
    %true = arith.constant true
    %false = arith.constant false

    omp.parallel {

    /// Private workspace data structure
    // %ws_bitmap = memref.alloc(%52) {alignment = 32 : i64} : memref<?xi1>
    // scf.for %arg = %c0 to %52 step %c1 {
    //   memref.store %false, %ws_bitmap[%arg] : memref<?xi1>
    // }
    %mark_array = memref.alloc(%52) {alignment = 32 : i64} : memref<?xindex>
    scf.for %arg = %c0 to %52 step %c1 {
      memref.store %c0, %mark_array[%arg] : memref<?xindex>
    }
    %ws_col_list_size = memref.alloc() : memref<1xindex>
    memref.store %c0, %ws_col_list_size[%c0] : memref<1xindex>
    %mark = memref.alloc() : memref<1xindex>
    memref.store %c0, %mark[%c0] : memref<1xindex>
    /// End Private workspace data structure

    // omp.wsloop schedule(static = %c1 : index) for (%arg0) : index = (%c0) to (%52) step (%c1) {
    omp.wsloop schedule(dynamic = %c1 : index) for (%arg0) : index = (%c0) to (%52) step (%c1) {
    // scf.for %arg0 = %c0 to %52 step %c1 {
    // scf.parallel (%arg0) = (%c0) to (%52) step (%c1) {

      /// Update mark += 2
      %old_mark = memref.load %mark[%c0] : memref<1xindex>
      %new_mark = arith.addi %old_mark, %c2 : index
      memref.store %new_mark, %mark[%c0] : memref<1xindex>

      %59 = arith.addi %arg0, %c1 : index
      %60 = memref.load %12[%arg0] : memref<?xindex>   // A.rowptr[%arg0]
      %61 = memref.load %12[%59] : memref<?xindex>
      scf.for %arg1 = %60 to %61 step %c1 {
        %69 = memref.load %14[%arg1] : memref<?xindex>  // A_col_id = A.col[%arg1]
        %70 = arith.addi %69, %c1 : index
        %71 = memref.load %30[%69] : memref<?xindex>  // B.rowptr[A_col_id]
        %72 = memref.load %30[%70] : memref<?xindex>
        scf.for %arg2 = %71 to %72 step %c1 {
          %73 = memref.load %32[%arg2] : memref<?xindex>  /// B_col_id = B.col[%arg2]
          %76 = memref.load %mark_array[%73] : memref<?xindex>
          // %76 = memref.load %ws_bitmap[%73] : memref<?xi1>
          %77 = arith.cmpi ne, %76, %new_mark : index
          // %77 = arith.cmpi eq, %76, %c0_i8 : i8
          scf.if %77 {  // if (mark_array[B_col_id] != mark)
            memref.store %new_mark, %mark_array[%73] : memref<?xindex>  // mark_array[B_col_id] = new_mark
            %81 = memref.load %ws_col_list_size[%c0] : memref<1xindex>  // %81 = ws_col_list_size
            %82 = arith.addi %81, %c1 : index  // %82 = ++%81
            memref.store %82, %ws_col_list_size[%c0] : memref<1xindex>  // ws_col_list_size = %82
          }
        }
      }

      
      /// C.rowptr[row_id] stores the size of C's row_id-th row
      %ws_size = memref.load %ws_col_list_size[%c0] : memref<1xindex> /// C.rowptr[A_row_id] = ws_sizes[tid];
      // %ws_size = memref.load %ws_col_list_sizes[%tid] : memref<24xindex> /// C.rowptr[A_row_id] = ws_sizes[tid];
      memref.store %ws_size, %C_rowptr[%arg0] : memref<?xindex>

      /// Reset
      memref.store %c0, %ws_col_list_size[%c0] : memref<1xindex>

      // scf.yield
      omp.yield
    }  /// End omp.wsloop for rows of A

    /// Free up
    memref.dealloc %mark_array : memref<?xindex>
    memref.dealloc %ws_col_list_size : memref<1xindex>


    // /// test
    // %C_rowptr_ptr = memref.cast %C_rowptr : memref<?xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%C_rowptr_ptr) : (memref<*xindex>) -> ()
    // /// end test

    omp.terminator
    }  /// End omp.parallel

    /// Reduce C.rowptr
    /// Could set %C_rowptr[%52] = 0 here
    /// memref.store %c0, %C_rowptr[%52] : memref<?xindex>
    %row_i_bound = arith.addi %52, %c1 : index
    memref.store %c0, %C_size[%c0] : memref<1xindex>
    scf.for %arg0 = %c0 to %row_i_bound step %c1 {
      %curr = memref.load %C_rowptr[%arg0] : memref<?xindex>
      %size = memref.load %C_size[%c0] : memref<1xindex>
      memref.store %size, %C_rowptr[%arg0] : memref<?xindex>
      %add_up = arith.addi %size, %curr : index
      memref.store %add_up, %C_size[%c0] : memref<1xindex>
    }

    // /// Parallel reduce
    // %row_i_bound = arith.addi %52, %c1 : index
    // scf.parallel (%arg0) = (%c0) to (%row_i_bound) step (%c1) {
    //   %red = scf.parallel (%arg1) = (%c0) to (%arg0) step (%c1) init (%c0) -> index {
    //     %elem_to_reduce = memref.load %C_rowptr[%arg1] : memref<?xindex>
    //     scf.reduce(%elem_to_reduce) : index {
    //       ^bb0(%lhs : index, %rhs: index):
    //       %res = arith.addi %lhs, %rhs : index
    //       scf.reduce.return %res : index
    //     }
    //   }
    //   %red_i64 = arith.index_cast %red : index to i64
    //   func.call @printI64(%red_i64) : (i64) -> ()
    //   func.call @printNewline() : () -> ()
    //   memref.store %red, %C_rowptr[%arg0] : memref<?xindex>
    // }

    // %last_one = memref.load %C_rowptr[%52] : memref<?xindex>
    // memref.store %last_one, %C_size[%c0] : memref<1xindex>
    // /// End Parallel reduce

    return
  } /// func.func @symbolic_phase
  ////////////////////////////////////////////////////////////////
  //// End symbolic_phase function to do symbolic phase
  ////////////////////////////////////////////////////////////////
  

  ////////////////////////////////////////////////////////////////
  //// numeric_phase function to do numeric phase
  ////////////////////////////////////////////////////////////////
  func.func @numeric_phase(
                %12 : memref<?xindex>,  // A.rowptr
                %14 : memref<?xindex>,  // A.col
                %16 : memref<?xf64>,  // A.val
                %30 : memref<?xindex>,  // B.rowptr
                %32 : memref<?xindex>,  // B.col
                %34 : memref<?xf64>,  // B.val
                %52 : index,  // num_rows
                %C_rowptr : memref<?xindex>,  // C.rowptr
                %C_col : memref<?xindex>,  // C.col
                %C_val : memref<?xf64>,  // C.val
                %C_size : memref<1xindex>)  // C.size
                // %ws_matrix : memref<24x?xf64>, // ws.matrix
                // %ws_bitmaps : memref<24x?xi8>,  // ws.bitmaps
                // %ws_col_lists : memref<24x?xindex>,  // ws.col_lists
                // %ws_col_list_sizes : memref<24xindex>) // ws.col_list_sizes
                -> () {
                  
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c0_i8 = arith.constant 0 : i8
    %c1_i8 = arith.constant 1 : i8
    %cst = arith.constant 0.000000e+00 : f64
    %true = arith.constant true
    %false = arith.constant false

    omp.parallel {

    /// Private workspace data structure
    %ws_data = memref.alloc(%52) : memref<?xf64>
    // scf.for %arg = %c0 to %52 step %c1 {
    //   memref.store %cst, %ws_data[%arg] : memref<?xf64>
    // }
    // %ws_bitmap = memref.alloc(%52) {alignment = 32 : i64} : memref<?xi1>
    // scf.for %arg = %c0 to %52 step %c1 {
    //   memref.store %false, %ws_bitmap[%arg] : memref<?xi1>
    // }
    %mark_array = memref.alloc(%52) {alignment = 32 : i64} : memref<?xindex>
    scf.for %arg = %c0 to %52 step %c1 {
      memref.store %c0, %mark_array[%arg] : memref<?xindex>
    }
    // %ws_col_list = memref.alloc(%52) {alignment = 32 : i64} : memref<?xindex>
    // %ws_col_list_size = memref.alloc() : memref<1xindex>
    // memref.store %c0, %ws_col_list_size[%c0] : memref<1xindex>
    %mark = memref.alloc() : memref<1xindex>
    memref.store %c0, %mark[%c0] : memref<1xindex>

    %rowptr = memref.alloc() : memref<1xindex>
    /// End Private workspace data structure

    // omp.wsloop schedule(static = %c1 : index) for (%arg0) : index = (%c0) to (%52) step (%c1) {
    omp.wsloop schedule(dynamic = %c1 : index) for (%arg0) : index = (%c0) to (%52) step (%c1) {
    // scf.for %arg0 = %c0 to %52 step %c1 {

    // scf.parallel (%arg0) = (%c0) to (%52) step (%c1) {  // for A_col_id = 0 to num_rows step 1

      /// Update mark += 2
      %old_mark = memref.load %mark[%c0] : memref<1xindex>
      %new_mark = arith.addi %old_mark, %c2 : index
      memref.store %new_mark, %mark[%c0] : memref<1xindex>

      /// Rowptr location
      %rowptr_start = memref.load %C_rowptr[%arg0] : memref<?xindex>
      memref.store %rowptr_start, %rowptr[%c0] : memref<1xindex>


      %59 = arith.addi %arg0, %c1 : index
      %60 = memref.load %12[%arg0] : memref<?xindex>   // A.rowptr[%arg0]
      %61 = memref.load %12[%59] : memref<?xindex>
      scf.for %arg1 = %60 to %61 step %c1 {
        %69 = memref.load %14[%arg1] : memref<?xindex>  // A_col_id = A.col[%arg1]
        %A_val = memref.load %16[%arg1] : memref<?xf64> // A_val = A.val[%arg1]
        %70 = arith.addi %69, %c1 : index
        %71 = memref.load %30[%69] : memref<?xindex>  // B.rowptr[A_col_id]
        %72 = memref.load %30[%70] : memref<?xindex>
        scf.for %arg2 = %71 to %72 step %c1 {
          %73 = memref.load %32[%arg2] : memref<?xindex>  /// B_col_id = B.col[%arg2]
          %B_val = memref.load %34[%arg2] : memref<?xf64> /// B_val = B.val[%arg2]
          %mul_val = arith.mulf %A_val, %B_val : f64

          %76 = memref.load %mark_array[%73] : memref<?xindex>
          %77 = arith.cmpi ne, %76, %new_mark : index
          scf.if %77 {
            memref.store %new_mark, %mark_array[%73] : memref<?xindex>  // mark_array[B_col_id] = mark
            %row = memref.load %rowptr[%c0] : memref<1xindex>  // row = rowptr
            memref.store %73, %C_col[%row] : memref<?xindex>  // C_col[row] = B_col_id
            %new_rowptr = arith.addi %row, %c1 : index // new_rowptr = ++row
            memref.store %new_rowptr, %rowptr[%c0] : memref<1xindex> //  rowptr = new_rowptr
            memref.store %mul_val, %ws_data[%73] : memref<?xf64>  // ws_data[B_col_id] = A_val * B_val
          } else {
            %old_val = memref.load %ws_data[%73] : memref<?xf64>  // old_val = ws_data[B_col_id]
            %new_val = arith.addf %old_val, %mul_val : f64 // new_val = old_val + mul_val
            memref.store %new_val, %ws_data[%73] : memref<?xf64> // ws_data[B_col_id] = new_val
          }
        }
      }

      %rowptr_bound = memref.load %rowptr[%c0] : memref<1xindex>
      /// sort C_col at [rowptr_start,  rowptr)
      %C_col_ptr = memref.cast %C_col : memref<?xindex> to memref<*xindex>
      func.call @comet_sort_index(%C_col_ptr, %rowptr_start, %rowptr_bound) : (memref<*xindex>, index, index) -> ()

      /// Store results from workspace to C
      // %rowptr_bound = memref.load %rowptr[%c0] : memref<1xindex>
      scf.for %ptr = %rowptr_start to %rowptr_bound step %c1 {
        %c_col_id = memref.load %C_col[%ptr] : memref<?xindex>  // c_col_id = C_col[ptr]
        %data = memref.load %ws_data[%c_col_id] : memref<?xf64>  // data = ws_data[c_col_id]
        memref.store %data, %C_val[%ptr] : memref<?xf64>  // C_val[ptr] = data
      }

      // scf.yield
      omp.yield
    }   /// End outermost for-loop

    /// Free up
    memref.dealloc %ws_data : memref<?xf64>
    memref.dealloc %mark_array : memref<?xindex>

    omp.terminator
    }   /// End omp.parallel

    return
  } /// func.func @numeric_phase()
  ////////////////////////////////////////////////////////////////
  //// numeric_phase function to do numeric phase
  ////////////////////////////////////////////////////////////////
  

  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %c5 = arith.constant 5 : index
    %c1_i32 = arith.constant 1 : i32
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c6 = arith.constant 6 : index
    %c24 = arith.constant 24 : index
    %cst = arith.constant 0.000000e+00 : f64
    %true = arith.constant true
    %false = arith.constant false
    %c0_i8 = arith.constant 0 : i8
    %c1_i8 = arith.constant 1 : i8
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = memref.alloc() : memref<7xindex>
    %1 = memref.cast %0 : memref<7xindex> to memref<*xindex>
    call @read_input_sizes_2D_f64(%c0_i32, %c0, %c1, %1) {filename = "SPARSE_FILE_NAME0"} : (i32, index, index, memref<*xindex>) -> ()
    %2 = memref.load %0[%c0] : memref<7xindex>
    %3 = memref.load %0[%c1] : memref<7xindex>
    %4 = memref.load %0[%c2] : memref<7xindex>
    %5 = memref.load %0[%c3] : memref<7xindex>
    %6 = memref.load %0[%c4] : memref<7xindex>
    %7 = memref.load %0[%c5] : memref<7xindex>  // num_rows
    %8 = memref.alloc(%2) : memref<?xindex>
    scf.for %arg0 = %c0 to %2 step %c1 {
      memref.store %c0, %8[%arg0] : memref<?xindex>
    }
    %9 = memref.cast %8 : memref<?xindex> to memref<*xindex>
    %10 = memref.alloc(%3) : memref<?xindex>
    scf.for %arg0 = %c0 to %3 step %c1 {
      memref.store %c0, %10[%arg0] : memref<?xindex>
    }
    %11 = memref.cast %10 : memref<?xindex> to memref<*xindex>
    %12 = memref.alloc(%4) : memref<?xindex>   // A.rowptr
    scf.for %arg0 = %c0 to %4 step %c1 {
      memref.store %c0, %12[%arg0] : memref<?xindex>
    }
    %13 = memref.cast %12 : memref<?xindex> to memref<*xindex>
    %14 = memref.alloc(%5) : memref<?xindex>   // A.col
    scf.for %arg0 = %c0 to %5 step %c1 {
      memref.store %c0, %14[%arg0] : memref<?xindex>
    }
    %15 = memref.cast %14 : memref<?xindex> to memref<*xindex>
    %16 = memref.alloc(%6) : memref<?xf64>   // A.val
    scf.for %arg0 = %c0 to %6 step %c1 {
      memref.store %cst, %16[%arg0] : memref<?xf64>
    }
    %17 = memref.cast %16 : memref<?xf64> to memref<*xf64>
    call @read_input_2D_f64(%c0_i32, %c0, %c1, %9, %11, %13, %15, %17) {filename = "SPARSE_FILE_NAME0"} : (i32, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>) -> ()
    %18 = memref.alloc() : memref<7xindex>
    %19 = memref.cast %18 : memref<7xindex> to memref<*xindex>
    call @read_input_sizes_2D_f64(%c1_i32, %c0, %c1, %19) {filename = "SPARSE_FILE_NAME1"} : (i32, index, index, memref<*xindex>) -> ()
    %20 = memref.load %18[%c0] : memref<7xindex>  // 1
    %21 = memref.load %18[%c1] : memref<7xindex>  // 1
    %22 = memref.load %18[%c2] : memref<7xindex>  // num_rows + 1
    %23 = memref.load %18[%c3] : memref<7xindex>  // num_non_zeros
    %24 = memref.load %18[%c4] : memref<7xindex>  // num_non_zeros
    %25 = memref.load %18[%c6] : memref<7xindex>  // num_cols
    %26 = memref.alloc(%20) : memref<?xindex>
    scf.for %arg0 = %c0 to %20 step %c1 {
      memref.store %c0, %26[%arg0] : memref<?xindex>
    }
    %27 = memref.cast %26 : memref<?xindex> to memref<*xindex>
    %28 = memref.alloc(%21) : memref<?xindex>
    scf.for %arg0 = %c0 to %21 step %c1 {
      memref.store %c0, %28[%arg0] : memref<?xindex>
    }
    %29 = memref.cast %28 : memref<?xindex> to memref<*xindex>
    %30 = memref.alloc(%22) : memref<?xindex>   /// B.rowptr
    scf.for %arg0 = %c0 to %22 step %c1 {
      memref.store %c0, %30[%arg0] : memref<?xindex>
    }
    %31 = memref.cast %30 : memref<?xindex> to memref<*xindex>
    %32 = memref.alloc(%23) : memref<?xindex>   // B.col
    scf.for %arg0 = %c0 to %23 step %c1 {
      memref.store %c0, %32[%arg0] : memref<?xindex>
    }
    %33 = memref.cast %32 : memref<?xindex> to memref<*xindex>
    %34 = memref.alloc(%24) : memref<?xf64>   // B.val
    scf.for %arg0 = %c0 to %24 step %c1 {
      memref.store %cst, %34[%arg0] : memref<?xf64>
    }
    %35 = memref.cast %34 : memref<?xf64> to memref<*xf64>
    call @read_input_2D_f64(%c1_i32, %c0, %c1, %27, %29, %31, %33, %35) {filename = "SPARSE_FILE_NAME1"} : (i32, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>) -> ()


    /// Allocate C_rowptr and C_size
    %40 = arith.addi %7, %c1 : index
    %C_rowptr = memref.alloc(%40) {alignment = 32 : i64} : memref<?xindex>
    // scf.for %arg0 = %c0 to %40 step %c1 {
    //   memref.store %c0, %C_rowptr[%arg0] : memref<?xindex>
    // }
    memref.store %c0, %C_rowptr[%7] : memref<?xindex>
    %C_size = memref.alloc() : memref<1xindex>


    //////////////////////////////
    /// Symbolic Phase
    //////////////////////////////
    %52 = memref.load %8[%c0] : memref<?xindex>   // num_row

    /// Run multiple times for measuring performance
    // %repeat = arith.constant 1 : index
    %repeat = arith.constant 11 : index
    // scf.for %run = %c0 to %repeat step %c1 {

    %time_start = func.call @getTime() : () -> f64

    // symbolic_phase()
    func.call @symbolic_phase(
              %12,  // A.rowptr
              %14,  // A.col
              %16,  // A.val
              %30,  // B.rowptr
              %32,  // B.col
              %34,  // B.val
              %52,  // num_rows
              %C_rowptr,
              %C_size) 
              : (
              // %ws_bitmaps,
              // %ws_col_lists,
              // %ws_col_list_sizes) : (

              memref<?xindex>,
              memref<?xindex>,
              memref<?xf64>,
              memref<?xindex>,
              memref<?xindex>,
              memref<?xf64>,
              index,
              memref<?xindex>,
              memref<1xindex>
              // memref<24x?xi8>,
              // memref<24x?xindex>,
              // memref<24xindex>
              ) -> ()

    // /// test
    // %C_rowptr_ptr = memref.cast %C_rowptr : memref<?xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%C_rowptr_ptr) : (memref<*xindex>) -> ()
    // %C_size_ptr = memref.cast %C_size : memref<1xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%C_size_ptr) : (memref<*xindex>) -> ()
    // /// end test

    //////////////////////////////
    /// End Symbolic Phase
    //////////////////////////////


    // %40 = arith.addi %7, %c1 : index
    // %41 = arith.muli %7, %25 : index  // %41 = num_rows * num_cols
    %41 = memref.load %C_size[%c0] : memref<1xindex> // C.size

    %C_col = memref.alloc(%41) : memref<?xindex>   /// C.col
    // scf.for %arg0 = %c0 to %41 step %c1 {
    //   memref.store %c0, %C_col[%arg0] : memref<?xindex>
    // }

    %C_val = memref.alloc(%41) : memref<?xf64>   /// C.val
    // scf.for %arg0 = %c0 to %41 step %c1 {
    //   memref.store %cst, %C_val[%arg0] : memref<?xf64>
    // }


    //////////////////////////////
    /// Numeric Phase
    //////////////////////////////

    func.call @numeric_phase(
                %12,  // A.rowptr
                %14,  // A.col
                %16,  // A.val
                %30,  // B.rowptr
                %32,  // B.col
                %34,  // B.val
                %52,  // num_rows
                %C_rowptr,  // C.rowptr
                %C_col,  // C.col
                %C_val,  // C.val
                %C_size  // C.size
                // %ws_matrix, // ws.matrix
                // %ws_bitmaps,  // ws.bitmaps
                // %ws_col_lists,  // ws.col_lists
                // %ws_col_list_sizes// ws.col_list_sizes 
              ) : ( 
                memref<?xindex>,
                memref<?xindex>,
                memref<?xf64>,
                memref<?xindex>,
                memref<?xindex>,
                memref<?xf64>,
                index,
                memref<?xindex>,
                memref<?xindex>,
                memref<?xf64>,
                memref<1xindex>
                // memref<24x?xf64>,
                // memref<24x?xi8>,
                // memref<24x?xindex>,
                // memref<24xindex>
              ) -> ()

    // /// Test
    // %C_val_ptr = memref.cast %C_val : memref<?xf64> to memref<*xf64>
    // func.call @comet_print_memref_f64(%C_val_ptr) : (memref<*xf64>) -> ()
    // /// End test

    //////////////////////////////
    /// End Numeric Phase
    //////////////////////////////

    %time_end = func.call @getTime() : () -> f64
    func.call @printElapsedTime(%time_start, %time_end) : (f64, f64) -> ()
    // %54 = memref.cast %42 : memref<?xindex> to memref<*xindex>
    // call @comet_print_memref_i64(%54) : (memref<*xindex>) -> ()
    // %55 = memref.cast %43 : memref<?xindex> to memref<*xindex>
    // call @comet_print_memref_i64(%55) : (memref<*xindex>) -> ()
    // %56 = memref.cast %44 : memref<?xindex> to memref<*xindex>
    // call @comet_print_memref_i64(%56) : (memref<*xindex>) -> ()
    // %57 = memref.cast %45 : memref<?xindex> to memref<*xindex>
    // call @comet_print_memref_i64(%57) : (memref<*xindex>) -> ()
    // %58 = memref.cast %46 : memref<?xf64> to memref<*xf64>
    // call @comet_print_memref_f64(%58) : (memref<*xf64>) -> ()

    // %C_col_ptr = memref.cast %C_col : memref<?xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%C_col_ptr) : (memref<*xindex>) -> ()
    // %C_val_ptr = memref.cast %C_val : memref<?xf64> to memref<*xf64>
    // func.call @comet_print_memref_f64(%C_val_ptr) : (memref<*xf64>) -> ()

    // %88 = memref.alloc() : memref<1xf64>
    // memref.store %cst, %88[%c0] : memref<1xf64>
    // %89 = memref.load %C_size[%c0] : memref<1xindex>  // value size = %51
    // scf.for %arg0 = %c0 to %89 step %c1 {
    //   %91 = memref.load %C_val[%arg0] : memref<?xf64>  // output.val = %46
    //   // %191 = arith.fptoui %91 : f64 to i64
    //   // %291 = arith.index_cast %191 : i64 to index
    //   %92 = memref.load %88[%c0] : memref<1xf64>
    //   %93 = arith.addf %91, %92 : f64
    //   memref.store %93, %88[%c0] : memref<1xf64>
    // }
    // %90 = memref.cast %88 : memref<1xf64> to memref<*xf64>
    // call @comet_print_memref_f64(%90) : (memref<*xf64>) -> ()

    %88 = memref.alloc() : memref<1xindex>
    memref.store %c0, %88[%c0] : memref<1xindex>
    %89 = memref.load %C_size[%c0] : memref<1xindex>  // value size = %51
    scf.for %arg0 = %c0 to %89 step %c1 {
      %91 = memref.load %C_val[%arg0] : memref<?xf64>  // output.val = %46
      %191 = arith.fptoui %91 : f64 to i64
      %291 = arith.index_cast %191 : i64 to index
      %92 = memref.load %88[%c0] : memref<1xindex>
      %93 = arith.addi %291, %92 : index
      memref.store %93, %88[%c0] : memref<1xindex>
    }
    %90 = memref.cast %88 : memref<1xindex> to memref<*xindex>
    func.call @comet_print_memref_i64(%90) : (memref<*xindex>) -> ()


    /// Free up
    memref.dealloc %C_col : memref<?xindex>
    memref.dealloc %C_val : memref<?xf64>
    memref.store %c0, %C_rowptr[%7] : memref<?xindex>
    // } /// End for-loop repeat

    
    return
  }
  func.func private @read_input_2D_f64(i32, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>)
  func.func private @read_input_sizes_2D_f64(i32, index, index, memref<*xindex>)
  func.func private @quick_sort(memref<*xindex>, index)
  func.func private @getTime() -> f64
  func.func private @printElapsedTime(f64, f64)
  func.func private @comet_print_memref_f64(memref<*xf64>)
  func.func private @comet_print_memref_i64(memref<*xindex>)
  func.func private @comet_sort_index(memref<*xindex>, index, index)
  // func.func private @mlirAsyncRuntimeGetThreadIdLite() -> i64
  // func.func private @mlirAsyncRuntimeGetThreadId() -> i64
  func.func private @printNewline()
  func.func private @printI64(i64)
}

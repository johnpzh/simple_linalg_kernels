module {
  func.func @main() {
    %true = arith.constant true
    %false = arith.constant false
    %cst = arith.constant 0.000000e+00 : f64
    %c10 = arith.constant 10 : index
    %c9 = arith.constant 9 : index
    %c8 = arith.constant 8 : index
    %c7 = arith.constant 7 : index
    %c6 = arith.constant 6 : index
    %c5 = arith.constant 5 : index
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c-1 = arith.constant -1 : index
    %alloc = memref.alloc() : memref<13xindex>
    %cast = memref.cast %alloc : memref<13xindex> to memref<*xindex>
    func.call @read_input_sizes_2D_f64(%c0_i32, %c0, %c-1, %c1, %c-1, %cast, %c1_i32) {filename = "SPARSE_FILE_NAME0"} : (i32, index, index, index, index, memref<*xindex>, i32) -> ()
    %0 = memref.load %alloc[%c0] : memref<13xindex>
    %1 = memref.load %alloc[%c1] : memref<13xindex>
    %2 = memref.load %alloc[%c2] : memref<13xindex>
    %3 = memref.load %alloc[%c3] : memref<13xindex>
    %4 = memref.load %alloc[%c4] : memref<13xindex>
    %5 = memref.load %alloc[%c5] : memref<13xindex>
    %6 = memref.load %alloc[%c6] : memref<13xindex>
    %7 = memref.load %alloc[%c7] : memref<13xindex>
    %8 = memref.load %alloc[%c8] : memref<13xindex>
    %9 = memref.load %alloc[%c9] : memref<13xindex>
    %alloc_0 = memref.alloc(%0) : memref<?xindex>
    scf.for %arg0 = %c0 to %0 step %c1 {
      memref.store %c0, %alloc_0[%arg0] : memref<?xindex>
    }
    %cast_1 = memref.cast %alloc_0 : memref<?xindex> to memref<*xindex>
    %alloc_2 = memref.alloc(%1) : memref<?xindex>
    scf.for %arg0 = %c0 to %1 step %c1 {
      memref.store %c0, %alloc_2[%arg0] : memref<?xindex>
    }
    %cast_3 = memref.cast %alloc_2 : memref<?xindex> to memref<*xindex>
    %alloc_4 = memref.alloc(%2) : memref<?xindex>
    scf.for %arg0 = %c0 to %2 step %c1 {
      memref.store %c0, %alloc_4[%arg0] : memref<?xindex>
    }
    %cast_5 = memref.cast %alloc_4 : memref<?xindex> to memref<*xindex>
    %alloc_6 = memref.alloc(%3) : memref<?xindex>
    scf.for %arg0 = %c0 to %3 step %c1 {
      memref.store %c0, %alloc_6[%arg0] : memref<?xindex>
    }
    %cast_7 = memref.cast %alloc_6 : memref<?xindex> to memref<*xindex>
    %alloc_8 = memref.alloc(%4) : memref<?xindex>
    scf.for %arg0 = %c0 to %4 step %c1 {
      memref.store %c0, %alloc_8[%arg0] : memref<?xindex>
    }
    %cast_9 = memref.cast %alloc_8 : memref<?xindex> to memref<*xindex>
    %alloc_10 = memref.alloc(%5) : memref<?xindex>
    scf.for %arg0 = %c0 to %5 step %c1 {
      memref.store %c0, %alloc_10[%arg0] : memref<?xindex>
    }
    %cast_11 = memref.cast %alloc_10 : memref<?xindex> to memref<*xindex>
    %alloc_12 = memref.alloc(%6) : memref<?xindex>
    scf.for %arg0 = %c0 to %6 step %c1 {
      memref.store %c0, %alloc_12[%arg0] : memref<?xindex>
    }
    %cast_13 = memref.cast %alloc_12 : memref<?xindex> to memref<*xindex>
    %alloc_14 = memref.alloc(%7) : memref<?xindex>
    scf.for %arg0 = %c0 to %7 step %c1 {
      memref.store %c0, %alloc_14[%arg0] : memref<?xindex>
    }
    %cast_15 = memref.cast %alloc_14 : memref<?xindex> to memref<*xindex>
    %alloc_16 = memref.alloc(%8) : memref<?xf64>
    scf.for %arg0 = %c0 to %8 step %c1 {
      memref.store %cst, %alloc_16[%arg0] : memref<?xf64>
    }
    %cast_17 = memref.cast %alloc_16 : memref<?xf64> to memref<*xf64>
    func.call @read_input_2D_f64(%c0_i32, %c0, %c-1, %c1, %c-1, %cast_1, %cast_3, %cast_5, %cast_7, %cast_9, %cast_11, %cast_13, %cast_15, %cast_17, %c1_i32) {filename = "SPARSE_FILE_NAME0"} : (i32, index, index, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>, i32) -> ()
    %alloc_18 = memref.alloc() : memref<13xindex>
    %cast_19 = memref.cast %alloc_18 : memref<13xindex> to memref<*xindex>
    func.call @read_input_sizes_2D_f64(%c1_i32, %c0, %c-1, %c1, %c-1, %cast_19, %c1_i32) {filename = "SPARSE_FILE_NAME1"} : (i32, index, index, index, index, memref<*xindex>, i32) -> ()
    %10 = memref.load %alloc_18[%c0] : memref<13xindex>
    %11 = memref.load %alloc_18[%c1] : memref<13xindex>
    %12 = memref.load %alloc_18[%c2] : memref<13xindex>
    %13 = memref.load %alloc_18[%c3] : memref<13xindex>
    %14 = memref.load %alloc_18[%c4] : memref<13xindex>
    %15 = memref.load %alloc_18[%c5] : memref<13xindex>
    %16 = memref.load %alloc_18[%c6] : memref<13xindex>
    %17 = memref.load %alloc_18[%c7] : memref<13xindex>
    %18 = memref.load %alloc_18[%c8] : memref<13xindex>
    %19 = memref.load %alloc_18[%c10] : memref<13xindex>
    %alloc_20 = memref.alloc(%10) : memref<?xindex>
    scf.for %arg0 = %c0 to %10 step %c1 {
      memref.store %c0, %alloc_20[%arg0] : memref<?xindex>
    }
    %cast_21 = memref.cast %alloc_20 : memref<?xindex> to memref<*xindex>
    %alloc_22 = memref.alloc(%11) : memref<?xindex>
    scf.for %arg0 = %c0 to %11 step %c1 {
      memref.store %c0, %alloc_22[%arg0] : memref<?xindex>
    }
    %cast_23 = memref.cast %alloc_22 : memref<?xindex> to memref<*xindex>
    %alloc_24 = memref.alloc(%12) : memref<?xindex>
    scf.for %arg0 = %c0 to %12 step %c1 {
      memref.store %c0, %alloc_24[%arg0] : memref<?xindex>
    }
    %cast_25 = memref.cast %alloc_24 : memref<?xindex> to memref<*xindex>
    %alloc_26 = memref.alloc(%13) : memref<?xindex>
    scf.for %arg0 = %c0 to %13 step %c1 {
      memref.store %c0, %alloc_26[%arg0] : memref<?xindex>
    }
    %cast_27 = memref.cast %alloc_26 : memref<?xindex> to memref<*xindex>
    %alloc_28 = memref.alloc(%14) : memref<?xindex>
    scf.for %arg0 = %c0 to %14 step %c1 {
      memref.store %c0, %alloc_28[%arg0] : memref<?xindex>
    }
    %cast_29 = memref.cast %alloc_28 : memref<?xindex> to memref<*xindex>
    %alloc_30 = memref.alloc(%15) : memref<?xindex>
    scf.for %arg0 = %c0 to %15 step %c1 {
      memref.store %c0, %alloc_30[%arg0] : memref<?xindex>
    }
    %cast_31 = memref.cast %alloc_30 : memref<?xindex> to memref<*xindex>
    %alloc_32 = memref.alloc(%16) : memref<?xindex>
    scf.for %arg0 = %c0 to %16 step %c1 {
      memref.store %c0, %alloc_32[%arg0] : memref<?xindex>
    }
    %cast_33 = memref.cast %alloc_32 : memref<?xindex> to memref<*xindex>
    %alloc_34 = memref.alloc(%17) : memref<?xindex>
    scf.for %arg0 = %c0 to %17 step %c1 {
      memref.store %c0, %alloc_34[%arg0] : memref<?xindex>
    }
    %cast_35 = memref.cast %alloc_34 : memref<?xindex> to memref<*xindex>
    %alloc_36 = memref.alloc(%18) : memref<?xf64>
    scf.for %arg0 = %c0 to %18 step %c1 {
      memref.store %cst, %alloc_36[%arg0] : memref<?xf64>
    }
    %cast_37 = memref.cast %alloc_36 : memref<?xf64> to memref<*xf64>
    func.call @read_input_2D_f64(%c1_i32, %c0, %c-1, %c1, %c-1, %cast_21, %cast_23, %cast_25, %cast_27, %cast_29, %cast_31, %cast_33, %cast_35, %cast_37, %c1_i32) {filename = "SPARSE_FILE_NAME1"} : (i32, index, index, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>, i32) -> ()
    

    %repeat = arith.constant 100 : index
    scf.for %r_i = %c0 to %repeat step %c1 {
      
    %20 = func.call @getTime() : () -> f64
    %21 = arith.addi %9, %c1 : index
    %alloc_38 = memref.alloc() : memref<1xindex>
    memref.store %c0, %alloc_38[%c0] : memref<1xindex>
    %alloc_39 = memref.alloc() : memref<1xindex>
    memref.store %c0, %alloc_39[%c0] : memref<1xindex>
    %alloc_40 = memref.alloc() : memref<0xindex>
    %alloc_41 = memref.alloc() : memref<0xindex>
    %alloc_42 = memref.alloc(%21) : memref<?xindex>
    scf.for %arg0 = %c0 to %21 step %c1 {
      memref.store %c0, %alloc_42[%arg0] : memref<?xindex>
    }
    %alloc_43 = memref.alloc() : memref<0xindex>
    %alloc_44 = memref.alloc() : memref<0xindex>
    memref.store %9, %alloc_38[%c0] : memref<1xindex>
    omp.parallel {
      %alloc_57 = memref.alloc() : memref<1xindex>
      %24 = memref.load %alloc_0[%c0] : memref<?xindex>
      %alloc_58 = memref.alloc(%19) {alignment = 8 : i64} : memref<?xindex>
      scf.for %arg0 = %c0 to %19 step %c1 {
        memref.store %c0, %alloc_58[%arg0] : memref<?xindex>
      }
      %alloc_59 = memref.alloc() : memref<1xindex>
      memref.store %c0, %alloc_59[%c0] : memref<1xindex>
      omp.wsloop for  (%arg0) : index = (%c0) to (%24) step (%c1) {
        %25 = memref.load %alloc_59[%c0] : memref<1xindex>
        %26 = arith.addi %25, %c2 : index
        memref.store %26, %alloc_59[%c0] : memref<1xindex>
        memref.store %c0, %alloc_57[%c0] : memref<1xindex>
        %27 = arith.addi %arg0, %c1 : index
        %28 = memref.load %alloc_8[%arg0] : memref<?xindex>
        %29 = memref.load %alloc_8[%27] : memref<?xindex>
        scf.for %arg1 = %28 to %29 step %c1 {
          %31 = memref.load %alloc_10[%arg1] : memref<?xindex>
          %32 = arith.addi %31, %c1 : index
          %33 = memref.load %alloc_28[%31] : memref<?xindex>
          %34 = memref.load %alloc_28[%32] : memref<?xindex>
          scf.for %arg2 = %33 to %34 step %c1 {
            %35 = memref.load %alloc_30[%arg2] : memref<?xindex>
            %36 = memref.load %alloc_58[%35] : memref<?xindex>
            %37 = arith.cmpi ne, %36, %26 : index
            scf.if %37 {
              memref.store %26, %alloc_58[%35] : memref<?xindex>
              %38 = memref.load %alloc_57[%c0] : memref<1xindex>
              %39 = arith.addi %38, %c1 : index
              memref.store %39, %alloc_57[%c0] : memref<1xindex>
            }
          }
        }
        %30 = memref.load %alloc_57[%c0] : memref<1xindex>
        memref.store %30, %alloc_42[%arg0] : memref<?xindex>
        omp.yield
      }
      memref.dealloc %alloc_58 : memref<?xindex>
      omp.terminator
    }
    memref.store %c0, %alloc_42[%9] : memref<?xindex>
    %alloc_45 = memref.alloc() : memref<1xindex>
    memref.store %c0, %alloc_45[%c0] : memref<1xindex>
    scf.for %arg0 = %c0 to %21 step %c1 {
      %24 = memref.load %alloc_42[%arg0] : memref<?xindex>
      %25 = memref.load %alloc_45[%c0] : memref<1xindex>
      memref.store %25, %alloc_42[%arg0] : memref<?xindex>
      %26 = arith.addi %24, %25 : index
      memref.store %26, %alloc_45[%c0] : memref<1xindex>
    }
    %22 = memref.load %alloc_45[%c0] : memref<1xindex>
    %alloc_46 = memref.alloc(%22) : memref<?xindex>
    %alloc_47 = memref.alloc(%22) : memref<?xf64>
    omp.parallel {
      %alloc_57 = memref.alloc() : memref<1xindex>
      %24 = memref.load %alloc_0[%c0] : memref<?xindex>
      %alloc_58 = memref.alloc(%19) {alignment = 8 : i64} : memref<?xi1>
      scf.for %arg0 = %c0 to %19 step %c1 {
        memref.store %false, %alloc_58[%arg0] : memref<?xi1>
      }
      %alloc_59 = memref.alloc(%19) {alignment = 8 : i64} : memref<?xf64>
      omp.wsloop for  (%arg0) : index = (%c0) to (%24) step (%c1) {
        %25 = memref.load %alloc_42[%arg0] : memref<?xindex>
        memref.store %25, %alloc_57[%c0] : memref<1xindex>
        %26 = arith.addi %arg0, %c1 : index
        %27 = memref.load %alloc_8[%arg0] : memref<?xindex>
        %28 = memref.load %alloc_8[%26] : memref<?xindex>
        scf.for %arg1 = %27 to %28 step %c1 {
          %31 = memref.load %alloc_10[%arg1] : memref<?xindex>
          %32 = arith.addi %31, %c1 : index
          %33 = memref.load %alloc_28[%31] : memref<?xindex>
          %34 = memref.load %alloc_28[%32] : memref<?xindex>
          scf.for %arg2 = %33 to %34 step %c1 {
            %35 = memref.load %alloc_30[%arg2] : memref<?xindex>
            %36 = memref.load %alloc_58[%35] : memref<?xi1>
            %37 = arith.cmpi eq, %36, %false : i1
            scf.if %37 {
              %38 = memref.load %alloc_16[%arg1] : memref<?xf64>
              %39 = memref.load %alloc_36[%arg2] : memref<?xf64>
              %40 = arith.mulf %38, %39 : f64
              memref.store %40, %alloc_59[%35] : memref<?xf64>
              memref.store %true, %alloc_58[%35] : memref<?xi1>
              %41 = memref.load %alloc_57[%c0] : memref<1xindex>
              memref.store %35, %alloc_46[%41] : memref<?xindex>
              %42 = arith.addi %41, %c1 : index
              memref.store %42, %alloc_57[%c0] : memref<1xindex>
            } else {
              %38 = memref.load %alloc_16[%arg1] : memref<?xf64>
              %39 = memref.load %alloc_36[%arg2] : memref<?xf64>
              %40 = memref.load %alloc_59[%35] : memref<?xf64>
              %41 = arith.mulf %38, %39 : f64
              %42 = arith.addf %40, %41 : f64
              memref.store %42, %alloc_59[%35] : memref<?xf64>
            }
          }
        }
        %29 = memref.load %alloc_42[%arg0] : memref<?xindex>
        %30 = memref.load %alloc_42[%26] : memref<?xindex>
        %cast_60 = memref.cast %alloc_46 : memref<?xindex> to memref<*xindex>
        func.call @comet_sort_index(%cast_60, %29, %30) : (memref<*xindex>, index, index) -> ()
        scf.for %arg1 = %29 to %30 step %c1 {
          %31 = memref.load %alloc_46[%arg1] : memref<?xindex>
          %32 = memref.load %alloc_59[%31] : memref<?xf64>
          memref.store %32, %alloc_47[%arg1] : memref<?xf64>
          memref.store %false, %alloc_58[%31] : memref<?xi1>
        }
        omp.yield
      }
      memref.dealloc %alloc_58 : memref<?xi1>
      memref.dealloc %alloc_59 : memref<?xf64>
      omp.terminator
    }
    %23 = func.call @getTime() : () -> f64
    func.call @printElapsedTime(%20, %23) : (f64, f64) -> ()
    // %cast_48 = memref.cast %alloc_38 : memref<1xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%cast_48) : (memref<*xindex>) -> ()
    // %cast_49 = memref.cast %alloc_39 : memref<1xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%cast_49) : (memref<*xindex>) -> ()
    // %cast_50 = memref.cast %alloc_40 : memref<0xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%cast_50) : (memref<*xindex>) -> ()
    // %cast_51 = memref.cast %alloc_41 : memref<0xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%cast_51) : (memref<*xindex>) -> ()
    // %cast_52 = memref.cast %alloc_42 : memref<?xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%cast_52) : (memref<*xindex>) -> ()
    // %cast_53 = memref.cast %alloc_46 : memref<?xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%cast_53) : (memref<*xindex>) -> ()
    // %cast_54 = memref.cast %alloc_43 : memref<0xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%cast_54) : (memref<*xindex>) -> ()
    // %cast_55 = memref.cast %alloc_44 : memref<0xindex> to memref<*xindex>
    // func.call @comet_print_memref_i64(%cast_55) : (memref<*xindex>) -> ()
    // %cast_56 = memref.cast %alloc_47 : memref<?xf64> to memref<*xf64>
    // func.call @comet_print_memref_f64(%cast_56) : (memref<*xf64>) -> ()

    }  /// repeat
    return
  }
  func.func private @read_input_2D_f64(i32, index, index, index, index, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xindex>, memref<*xf64>, i32)
  func.func private @read_input_sizes_2D_f64(i32, index, index, index, index, memref<*xindex>, i32)
  func.func private @comet_sort_index(memref<*xindex>, index, index)
  func.func private @getTime() -> f64
  func.func private @printElapsedTime(f64, f64)
  func.func private @comet_print_memref_f64(memref<*xf64>)
  func.func private @comet_print_memref_i64(memref<*xindex>)
}

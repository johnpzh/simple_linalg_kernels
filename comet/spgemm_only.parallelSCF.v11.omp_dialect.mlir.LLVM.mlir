module {
  llvm.func @free(!llvm.ptr)
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @symbolic_phase(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: !llvm.ptr, %arg11: !llvm.ptr, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: !llvm.ptr, %arg26: !llvm.ptr, %arg27: i64, %arg28: i64, %arg29: i64, %arg30: i64, %arg31: !llvm.ptr, %arg32: !llvm.ptr, %arg33: i64, %arg34: i64, %arg35: i64, %arg36: !llvm.ptr, %arg37: !llvm.ptr, %arg38: i64, %arg39: i64, %arg40: i64) {
    %0 = llvm.mlir.constant(32 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    omp.parallel {
      %13 = llvm.mlir.zero : !llvm.ptr
      %14 = llvm.getelementptr %13[%arg30] : (!llvm.ptr, i64) -> !llvm.ptr, i64
      %15 = llvm.ptrtoint %14 : !llvm.ptr to i64
      %16 = llvm.add %15, %0  : i64
      %17 = llvm.call @malloc(%16) : (i64) -> !llvm.ptr
      %18 = llvm.ptrtoint %17 : !llvm.ptr to i64
      %19 = llvm.sub %0, %2  : i64
      %20 = llvm.add %18, %19  : i64
      %21 = llvm.urem %20, %0  : i64
      %22 = llvm.sub %20, %21  : i64
      %23 = llvm.inttoptr %22 : i64 to !llvm.ptr
      llvm.br ^bb1(%3 : i64)
    ^bb1(%24: i64):  // 2 preds: ^bb0, ^bb2
      %25 = llvm.icmp "slt" %24, %arg30 : i64
      llvm.cond_br %25, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      %26 = llvm.getelementptr %23[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
      llvm.store %3, %26 : i64, !llvm.ptr
      %27 = llvm.add %24, %2  : i64
      llvm.br ^bb1(%27 : i64)
    ^bb3:  // pred: ^bb1
      %28 = llvm.mlir.zero : !llvm.ptr
      %29 = llvm.getelementptr %28[1] : (!llvm.ptr) -> !llvm.ptr, i64
      %30 = llvm.ptrtoint %29 : !llvm.ptr to i64
      %31 = llvm.call @malloc(%30) : (i64) -> !llvm.ptr
      llvm.store %3, %31 : i64, !llvm.ptr
      %32 = llvm.mlir.zero : !llvm.ptr
      %33 = llvm.getelementptr %32[1] : (!llvm.ptr) -> !llvm.ptr, i64
      %34 = llvm.ptrtoint %33 : !llvm.ptr to i64
      %35 = llvm.call @malloc(%34) : (i64) -> !llvm.ptr
      llvm.store %3, %35 : i64, !llvm.ptr
      omp.wsloop schedule(dynamic = %2 : i64) for  (%arg41) : i64 = (%3) to (%arg30) step (%2) {
        %36 = llvm.load %35 : !llvm.ptr -> i64
        %37 = llvm.add %36, %1  : i64
        llvm.store %37, %35 : i64, !llvm.ptr
        %38 = llvm.add %arg41, %2  : i64
        %39 = llvm.getelementptr %arg1[%arg41] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %40 = llvm.load %39 : !llvm.ptr -> i64
        %41 = llvm.getelementptr %arg1[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %42 = llvm.load %41 : !llvm.ptr -> i64
        llvm.br ^bb1(%40 : i64)
      ^bb1(%43: i64):  // 2 preds: ^bb0, ^bb7
        %44 = llvm.icmp "slt" %43, %42 : i64
        llvm.cond_br %44, ^bb2, ^bb8
      ^bb2:  // pred: ^bb1
        %45 = llvm.getelementptr %arg6[%43] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %46 = llvm.load %45 : !llvm.ptr -> i64
        %47 = llvm.add %46, %2  : i64
        %48 = llvm.getelementptr %arg16[%46] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %49 = llvm.load %48 : !llvm.ptr -> i64
        %50 = llvm.getelementptr %arg16[%47] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %51 = llvm.load %50 : !llvm.ptr -> i64
        llvm.br ^bb3(%49 : i64)
      ^bb3(%52: i64):  // 2 preds: ^bb2, ^bb6
        %53 = llvm.icmp "slt" %52, %51 : i64
        llvm.cond_br %53, ^bb4, ^bb7
      ^bb4:  // pred: ^bb3
        %54 = llvm.getelementptr %arg21[%52] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %55 = llvm.load %54 : !llvm.ptr -> i64
        %56 = llvm.getelementptr %23[%55] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %57 = llvm.load %56 : !llvm.ptr -> i64
        %58 = llvm.icmp "ne" %57, %37 : i64
        llvm.cond_br %58, ^bb5, ^bb6
      ^bb5:  // pred: ^bb4
        %59 = llvm.getelementptr %23[%55] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        llvm.store %37, %59 : i64, !llvm.ptr
        %60 = llvm.load %31 : !llvm.ptr -> i64
        %61 = llvm.add %60, %2  : i64
        llvm.store %61, %31 : i64, !llvm.ptr
        llvm.br ^bb6
      ^bb6:  // 2 preds: ^bb4, ^bb5
        %62 = llvm.add %52, %2  : i64
        llvm.br ^bb3(%62 : i64)
      ^bb7:  // pred: ^bb3
        %63 = llvm.add %43, %2  : i64
        llvm.br ^bb1(%63 : i64)
      ^bb8:  // pred: ^bb1
        %64 = llvm.load %31 : !llvm.ptr -> i64
        %65 = llvm.getelementptr %arg32[%arg41] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        llvm.store %64, %65 : i64, !llvm.ptr
        llvm.store %3, %31 : i64, !llvm.ptr
        omp.yield
      }
      llvm.call @free(%17) : (!llvm.ptr) -> ()
      llvm.call @free(%31) : (!llvm.ptr) -> ()
      omp.terminator
    }
    %4 = llvm.add %arg30, %2  : i64
    llvm.store %3, %arg37 : i64, !llvm.ptr
    llvm.br ^bb1(%3 : i64)
  ^bb1(%5: i64):  // 2 preds: ^bb0, ^bb2
    %6 = llvm.icmp "slt" %5, %4 : i64
    llvm.cond_br %6, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %7 = llvm.getelementptr %arg32[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %8 = llvm.load %7 : !llvm.ptr -> i64
    %9 = llvm.load %arg37 : !llvm.ptr -> i64
    %10 = llvm.getelementptr %arg32[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %9, %10 : i64, !llvm.ptr
    %11 = llvm.add %9, %8  : i64
    llvm.store %11, %arg37 : i64, !llvm.ptr
    %12 = llvm.add %5, %2  : i64
    llvm.br ^bb1(%12 : i64)
  ^bb3:  // pred: ^bb1
    llvm.return
  }
  llvm.func @numeric_phase(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: !llvm.ptr, %arg6: !llvm.ptr, %arg7: i64, %arg8: i64, %arg9: i64, %arg10: !llvm.ptr, %arg11: !llvm.ptr, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: !llvm.ptr, %arg26: !llvm.ptr, %arg27: i64, %arg28: i64, %arg29: i64, %arg30: i64, %arg31: !llvm.ptr, %arg32: !llvm.ptr, %arg33: i64, %arg34: i64, %arg35: i64, %arg36: !llvm.ptr, %arg37: !llvm.ptr, %arg38: i64, %arg39: i64, %arg40: i64, %arg41: !llvm.ptr, %arg42: !llvm.ptr, %arg43: i64, %arg44: i64, %arg45: i64, %arg46: !llvm.ptr, %arg47: !llvm.ptr, %arg48: i64, %arg49: i64, %arg50: i64) {
    %0 = llvm.mlir.constant(32 : index) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %5 = llvm.insertvalue %arg36, %4[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %6 = llvm.insertvalue %arg37, %5[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %7 = llvm.insertvalue %arg38, %6[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %8 = llvm.insertvalue %arg39, %7[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %9 = llvm.insertvalue %arg40, %8[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    omp.parallel {
      %10 = llvm.mlir.zero : !llvm.ptr
      %11 = llvm.getelementptr %10[%arg30] : (!llvm.ptr, i64) -> !llvm.ptr, f64
      %12 = llvm.ptrtoint %11 : !llvm.ptr to i64
      %13 = llvm.call @malloc(%12) : (i64) -> !llvm.ptr
      %14 = llvm.mlir.zero : !llvm.ptr
      %15 = llvm.getelementptr %14[%arg30] : (!llvm.ptr, i64) -> !llvm.ptr, i64
      %16 = llvm.ptrtoint %15 : !llvm.ptr to i64
      %17 = llvm.add %16, %0  : i64
      %18 = llvm.call @malloc(%17) : (i64) -> !llvm.ptr
      %19 = llvm.ptrtoint %18 : !llvm.ptr to i64
      %20 = llvm.sub %0, %2  : i64
      %21 = llvm.add %19, %20  : i64
      %22 = llvm.urem %21, %0  : i64
      %23 = llvm.sub %21, %22  : i64
      %24 = llvm.inttoptr %23 : i64 to !llvm.ptr
      llvm.br ^bb1(%3 : i64)
    ^bb1(%25: i64):  // 2 preds: ^bb0, ^bb2
      %26 = llvm.icmp "slt" %25, %arg30 : i64
      llvm.cond_br %26, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      %27 = llvm.getelementptr %24[%25] : (!llvm.ptr, i64) -> !llvm.ptr, i64
      llvm.store %3, %27 : i64, !llvm.ptr
      %28 = llvm.add %25, %2  : i64
      llvm.br ^bb1(%28 : i64)
    ^bb3:  // pred: ^bb1
      %29 = llvm.mlir.zero : !llvm.ptr
      %30 = llvm.getelementptr %29[1] : (!llvm.ptr) -> !llvm.ptr, i64
      %31 = llvm.ptrtoint %30 : !llvm.ptr to i64
      %32 = llvm.call @malloc(%31) : (i64) -> !llvm.ptr
      llvm.store %3, %32 : i64, !llvm.ptr
      %33 = llvm.mlir.zero : !llvm.ptr
      %34 = llvm.getelementptr %33[1] : (!llvm.ptr) -> !llvm.ptr, i64
      %35 = llvm.ptrtoint %34 : !llvm.ptr to i64
      %36 = llvm.call @malloc(%35) : (i64) -> !llvm.ptr
      omp.wsloop schedule(dynamic = %2 : i64) for  (%arg51) : i64 = (%3) to (%arg30) step (%2) {
        %37 = llvm.load %32 : !llvm.ptr -> i64
        %38 = llvm.add %37, %1  : i64
        llvm.store %38, %32 : i64, !llvm.ptr
        %39 = llvm.getelementptr %arg32[%arg51] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %40 = llvm.load %39 : !llvm.ptr -> i64
        llvm.store %40, %36 : i64, !llvm.ptr
        %41 = llvm.add %arg51, %2  : i64
        %42 = llvm.getelementptr %arg1[%arg51] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %43 = llvm.load %42 : !llvm.ptr -> i64
        %44 = llvm.getelementptr %arg1[%41] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %45 = llvm.load %44 : !llvm.ptr -> i64
        llvm.br ^bb1(%43 : i64)
      ^bb1(%46: i64):  // 2 preds: ^bb0, ^bb8
        %47 = llvm.icmp "slt" %46, %45 : i64
        llvm.cond_br %47, ^bb2, ^bb9
      ^bb2:  // pred: ^bb1
        %48 = llvm.getelementptr %arg6[%46] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %49 = llvm.load %48 : !llvm.ptr -> i64
        %50 = llvm.getelementptr %arg11[%46] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %51 = llvm.load %50 : !llvm.ptr -> f64
        %52 = llvm.add %49, %2  : i64
        %53 = llvm.getelementptr %arg16[%49] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %54 = llvm.load %53 : !llvm.ptr -> i64
        %55 = llvm.getelementptr %arg16[%52] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %56 = llvm.load %55 : !llvm.ptr -> i64
        llvm.br ^bb3(%54 : i64)
      ^bb3(%57: i64):  // 2 preds: ^bb2, ^bb7
        %58 = llvm.icmp "slt" %57, %56 : i64
        llvm.cond_br %58, ^bb4, ^bb8
      ^bb4:  // pred: ^bb3
        %59 = llvm.getelementptr %arg21[%57] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %60 = llvm.load %59 : !llvm.ptr -> i64
        %61 = llvm.getelementptr %arg26[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %62 = llvm.load %61 : !llvm.ptr -> f64
        %63 = llvm.fmul %51, %62  : f64
        %64 = llvm.getelementptr %24[%60] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %65 = llvm.load %64 : !llvm.ptr -> i64
        %66 = llvm.icmp "ne" %65, %38 : i64
        llvm.cond_br %66, ^bb5, ^bb6
      ^bb5:  // pred: ^bb4
        %67 = llvm.getelementptr %24[%60] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        llvm.store %38, %67 : i64, !llvm.ptr
        %68 = llvm.load %36 : !llvm.ptr -> i64
        %69 = llvm.getelementptr %arg37[%68] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        llvm.store %60, %69 : i64, !llvm.ptr
        %70 = llvm.add %68, %2  : i64
        llvm.store %70, %36 : i64, !llvm.ptr
        %71 = llvm.getelementptr %13[%60] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        llvm.store %63, %71 : f64, !llvm.ptr
        llvm.br ^bb7
      ^bb6:  // pred: ^bb4
        %72 = llvm.getelementptr %13[%60] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %73 = llvm.load %72 : !llvm.ptr -> f64
        %74 = llvm.fadd %73, %63  : f64
        %75 = llvm.getelementptr %13[%60] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        llvm.store %74, %75 : f64, !llvm.ptr
        llvm.br ^bb7
      ^bb7:  // 2 preds: ^bb5, ^bb6
        %76 = llvm.add %57, %2  : i64
        llvm.br ^bb3(%76 : i64)
      ^bb8:  // pred: ^bb3
        %77 = llvm.add %46, %2  : i64
        llvm.br ^bb1(%77 : i64)
      ^bb9:  // pred: ^bb1
        %78 = llvm.load %36 : !llvm.ptr -> i64
        %79 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
        llvm.store %9, %79 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
        llvm.call @comet_sort_index(%2, %79, %40, %78) : (i64, !llvm.ptr, i64, i64) -> ()
        llvm.br ^bb10(%40 : i64)
      ^bb10(%80: i64):  // 2 preds: ^bb9, ^bb11
        %81 = llvm.icmp "slt" %80, %78 : i64
        llvm.cond_br %81, ^bb11, ^bb12
      ^bb11:  // pred: ^bb10
        %82 = llvm.getelementptr %arg37[%80] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %83 = llvm.load %82 : !llvm.ptr -> i64
        %84 = llvm.getelementptr %13[%83] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %85 = llvm.load %84 : !llvm.ptr -> f64
        %86 = llvm.getelementptr %arg42[%80] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        llvm.store %85, %86 : f64, !llvm.ptr
        %87 = llvm.add %80, %2  : i64
        llvm.br ^bb10(%87 : i64)
      ^bb12:  // pred: ^bb10
        omp.yield
      }
      llvm.call @free(%13) : (!llvm.ptr) -> ()
      llvm.call @free(%18) : (!llvm.ptr) -> ()
      omp.terminator
    }
    llvm.return
  }
  llvm.func @main() {
    %0 = llvm.mlir.constant(32 : index) : i64
    %1 = llvm.mlir.constant(7 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(0 : index) : i64
    %4 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %5 = llvm.mlir.constant(1 : i32) : i32
    %6 = llvm.mlir.constant(0 : i32) : i32
    %7 = llvm.mlir.zero : !llvm.ptr
    %8 = llvm.getelementptr %7[7] : (!llvm.ptr) -> !llvm.ptr, i64
    %9 = llvm.ptrtoint %8 : !llvm.ptr to i64
    %10 = llvm.call @malloc(%9) : (i64) -> !llvm.ptr
    %11 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %12 = llvm.insertvalue %10, %11[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %13 = llvm.insertvalue %10, %12[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %14 = llvm.insertvalue %3, %13[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %15 = llvm.insertvalue %1, %14[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.insertvalue %2, %15[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %16, %17 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_sizes_2D_f64(%6, %3, %2, %2, %17) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, !llvm.ptr) -> ()
    %18 = llvm.load %10 : !llvm.ptr -> i64
    %19 = llvm.getelementptr %10[1] : (!llvm.ptr) -> !llvm.ptr, i64
    %20 = llvm.load %19 : !llvm.ptr -> i64
    %21 = llvm.getelementptr %10[2] : (!llvm.ptr) -> !llvm.ptr, i64
    %22 = llvm.load %21 : !llvm.ptr -> i64
    %23 = llvm.getelementptr %10[3] : (!llvm.ptr) -> !llvm.ptr, i64
    %24 = llvm.load %23 : !llvm.ptr -> i64
    %25 = llvm.getelementptr %10[4] : (!llvm.ptr) -> !llvm.ptr, i64
    %26 = llvm.load %25 : !llvm.ptr -> i64
    %27 = llvm.getelementptr %10[5] : (!llvm.ptr) -> !llvm.ptr, i64
    %28 = llvm.load %27 : !llvm.ptr -> i64
    %29 = llvm.mlir.zero : !llvm.ptr
    %30 = llvm.getelementptr %29[%18] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %31 = llvm.ptrtoint %30 : !llvm.ptr to i64
    %32 = llvm.call @malloc(%31) : (i64) -> !llvm.ptr
    %33 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %34 = llvm.insertvalue %32, %33[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %35 = llvm.insertvalue %32, %34[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %36 = llvm.insertvalue %3, %35[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %37 = llvm.insertvalue %18, %36[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %38 = llvm.insertvalue %2, %37[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%3 : i64)
  ^bb1(%39: i64):  // 2 preds: ^bb0, ^bb2
    %40 = llvm.icmp "slt" %39, %18 : i64
    llvm.cond_br %40, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %41 = llvm.getelementptr %32[%39] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %41 : i64, !llvm.ptr
    %42 = llvm.add %39, %2  : i64
    llvm.br ^bb1(%42 : i64)
  ^bb3:  // pred: ^bb1
    %43 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %38, %43 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %44 = llvm.mlir.zero : !llvm.ptr
    %45 = llvm.getelementptr %44[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %46 = llvm.ptrtoint %45 : !llvm.ptr to i64
    %47 = llvm.call @malloc(%46) : (i64) -> !llvm.ptr
    %48 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %49 = llvm.insertvalue %47, %48[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = llvm.insertvalue %47, %49[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %51 = llvm.insertvalue %3, %50[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %52 = llvm.insertvalue %20, %51[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %53 = llvm.insertvalue %2, %52[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb4(%3 : i64)
  ^bb4(%54: i64):  // 2 preds: ^bb3, ^bb5
    %55 = llvm.icmp "slt" %54, %20 : i64
    llvm.cond_br %55, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %56 = llvm.getelementptr %47[%54] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %56 : i64, !llvm.ptr
    %57 = llvm.add %54, %2  : i64
    llvm.br ^bb4(%57 : i64)
  ^bb6:  // pred: ^bb4
    %58 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %53, %58 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %59 = llvm.mlir.zero : !llvm.ptr
    %60 = llvm.getelementptr %59[%22] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %61 = llvm.ptrtoint %60 : !llvm.ptr to i64
    %62 = llvm.call @malloc(%61) : (i64) -> !llvm.ptr
    %63 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %64 = llvm.insertvalue %62, %63[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.insertvalue %62, %64[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.insertvalue %3, %65[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.insertvalue %22, %66[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %68 = llvm.insertvalue %2, %67[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb7(%3 : i64)
  ^bb7(%69: i64):  // 2 preds: ^bb6, ^bb8
    %70 = llvm.icmp "slt" %69, %22 : i64
    llvm.cond_br %70, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %71 = llvm.getelementptr %62[%69] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %71 : i64, !llvm.ptr
    %72 = llvm.add %69, %2  : i64
    llvm.br ^bb7(%72 : i64)
  ^bb9:  // pred: ^bb7
    %73 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %68, %73 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %74 = llvm.mlir.zero : !llvm.ptr
    %75 = llvm.getelementptr %74[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %76 = llvm.ptrtoint %75 : !llvm.ptr to i64
    %77 = llvm.call @malloc(%76) : (i64) -> !llvm.ptr
    %78 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %79 = llvm.insertvalue %77, %78[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %80 = llvm.insertvalue %77, %79[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %81 = llvm.insertvalue %3, %80[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %82 = llvm.insertvalue %24, %81[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.insertvalue %2, %82[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb10(%3 : i64)
  ^bb10(%84: i64):  // 2 preds: ^bb9, ^bb11
    %85 = llvm.icmp "slt" %84, %24 : i64
    llvm.cond_br %85, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %86 = llvm.getelementptr %77[%84] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %86 : i64, !llvm.ptr
    %87 = llvm.add %84, %2  : i64
    llvm.br ^bb10(%87 : i64)
  ^bb12:  // pred: ^bb10
    %88 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %83, %88 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %89 = llvm.mlir.zero : !llvm.ptr
    %90 = llvm.getelementptr %89[%26] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %91 = llvm.ptrtoint %90 : !llvm.ptr to i64
    %92 = llvm.call @malloc(%91) : (i64) -> !llvm.ptr
    %93 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %94 = llvm.insertvalue %92, %93[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %95 = llvm.insertvalue %92, %94[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %96 = llvm.insertvalue %3, %95[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %97 = llvm.insertvalue %26, %96[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %98 = llvm.insertvalue %2, %97[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb13(%3 : i64)
  ^bb13(%99: i64):  // 2 preds: ^bb12, ^bb14
    %100 = llvm.icmp "slt" %99, %26 : i64
    llvm.cond_br %100, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %101 = llvm.getelementptr %92[%99] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %101 : f64, !llvm.ptr
    %102 = llvm.add %99, %2  : i64
    llvm.br ^bb13(%102 : i64)
  ^bb15:  // pred: ^bb13
    %103 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %98, %103 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_2D_f64(%6, %3, %2, %2, %43, %2, %58, %2, %73, %2, %88, %2, %103) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr) -> ()
    %104 = llvm.mlir.zero : !llvm.ptr
    %105 = llvm.getelementptr %104[7] : (!llvm.ptr) -> !llvm.ptr, i64
    %106 = llvm.ptrtoint %105 : !llvm.ptr to i64
    %107 = llvm.call @malloc(%106) : (i64) -> !llvm.ptr
    %108 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %109 = llvm.insertvalue %107, %108[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %110 = llvm.insertvalue %107, %109[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %111 = llvm.insertvalue %3, %110[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %112 = llvm.insertvalue %1, %111[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %113 = llvm.insertvalue %2, %112[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %114 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %113, %114 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_sizes_2D_f64(%5, %3, %2, %2, %114) {filename = "SPARSE_FILE_NAME1"} : (i32, i64, i64, i64, !llvm.ptr) -> ()
    %115 = llvm.load %107 : !llvm.ptr -> i64
    %116 = llvm.getelementptr %107[1] : (!llvm.ptr) -> !llvm.ptr, i64
    %117 = llvm.load %116 : !llvm.ptr -> i64
    %118 = llvm.getelementptr %107[2] : (!llvm.ptr) -> !llvm.ptr, i64
    %119 = llvm.load %118 : !llvm.ptr -> i64
    %120 = llvm.getelementptr %107[3] : (!llvm.ptr) -> !llvm.ptr, i64
    %121 = llvm.load %120 : !llvm.ptr -> i64
    %122 = llvm.getelementptr %107[4] : (!llvm.ptr) -> !llvm.ptr, i64
    %123 = llvm.load %122 : !llvm.ptr -> i64
    %124 = llvm.mlir.zero : !llvm.ptr
    %125 = llvm.getelementptr %124[%115] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %126 = llvm.ptrtoint %125 : !llvm.ptr to i64
    %127 = llvm.call @malloc(%126) : (i64) -> !llvm.ptr
    %128 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %129 = llvm.insertvalue %127, %128[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %130 = llvm.insertvalue %127, %129[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %131 = llvm.insertvalue %3, %130[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %132 = llvm.insertvalue %115, %131[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %133 = llvm.insertvalue %2, %132[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb16(%3 : i64)
  ^bb16(%134: i64):  // 2 preds: ^bb15, ^bb17
    %135 = llvm.icmp "slt" %134, %115 : i64
    llvm.cond_br %135, ^bb17, ^bb18
  ^bb17:  // pred: ^bb16
    %136 = llvm.getelementptr %127[%134] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %136 : i64, !llvm.ptr
    %137 = llvm.add %134, %2  : i64
    llvm.br ^bb16(%137 : i64)
  ^bb18:  // pred: ^bb16
    %138 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %133, %138 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %139 = llvm.mlir.zero : !llvm.ptr
    %140 = llvm.getelementptr %139[%117] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %141 = llvm.ptrtoint %140 : !llvm.ptr to i64
    %142 = llvm.call @malloc(%141) : (i64) -> !llvm.ptr
    %143 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %144 = llvm.insertvalue %142, %143[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %145 = llvm.insertvalue %142, %144[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %146 = llvm.insertvalue %3, %145[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %147 = llvm.insertvalue %117, %146[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %148 = llvm.insertvalue %2, %147[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb19(%3 : i64)
  ^bb19(%149: i64):  // 2 preds: ^bb18, ^bb20
    %150 = llvm.icmp "slt" %149, %117 : i64
    llvm.cond_br %150, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %151 = llvm.getelementptr %142[%149] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %151 : i64, !llvm.ptr
    %152 = llvm.add %149, %2  : i64
    llvm.br ^bb19(%152 : i64)
  ^bb21:  // pred: ^bb19
    %153 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %148, %153 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %154 = llvm.mlir.zero : !llvm.ptr
    %155 = llvm.getelementptr %154[%119] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %156 = llvm.ptrtoint %155 : !llvm.ptr to i64
    %157 = llvm.call @malloc(%156) : (i64) -> !llvm.ptr
    %158 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %159 = llvm.insertvalue %157, %158[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %160 = llvm.insertvalue %157, %159[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %161 = llvm.insertvalue %3, %160[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %162 = llvm.insertvalue %119, %161[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %163 = llvm.insertvalue %2, %162[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb22(%3 : i64)
  ^bb22(%164: i64):  // 2 preds: ^bb21, ^bb23
    %165 = llvm.icmp "slt" %164, %119 : i64
    llvm.cond_br %165, ^bb23, ^bb24
  ^bb23:  // pred: ^bb22
    %166 = llvm.getelementptr %157[%164] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %166 : i64, !llvm.ptr
    %167 = llvm.add %164, %2  : i64
    llvm.br ^bb22(%167 : i64)
  ^bb24:  // pred: ^bb22
    %168 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %163, %168 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %169 = llvm.mlir.zero : !llvm.ptr
    %170 = llvm.getelementptr %169[%121] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %171 = llvm.ptrtoint %170 : !llvm.ptr to i64
    %172 = llvm.call @malloc(%171) : (i64) -> !llvm.ptr
    %173 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %174 = llvm.insertvalue %172, %173[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %175 = llvm.insertvalue %172, %174[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %176 = llvm.insertvalue %3, %175[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %177 = llvm.insertvalue %121, %176[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %178 = llvm.insertvalue %2, %177[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb25(%3 : i64)
  ^bb25(%179: i64):  // 2 preds: ^bb24, ^bb26
    %180 = llvm.icmp "slt" %179, %121 : i64
    llvm.cond_br %180, ^bb26, ^bb27
  ^bb26:  // pred: ^bb25
    %181 = llvm.getelementptr %172[%179] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %181 : i64, !llvm.ptr
    %182 = llvm.add %179, %2  : i64
    llvm.br ^bb25(%182 : i64)
  ^bb27:  // pred: ^bb25
    %183 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %178, %183 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %184 = llvm.mlir.zero : !llvm.ptr
    %185 = llvm.getelementptr %184[%123] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %186 = llvm.ptrtoint %185 : !llvm.ptr to i64
    %187 = llvm.call @malloc(%186) : (i64) -> !llvm.ptr
    %188 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %189 = llvm.insertvalue %187, %188[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %190 = llvm.insertvalue %187, %189[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %191 = llvm.insertvalue %3, %190[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %192 = llvm.insertvalue %123, %191[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %193 = llvm.insertvalue %2, %192[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb28(%3 : i64)
  ^bb28(%194: i64):  // 2 preds: ^bb27, ^bb29
    %195 = llvm.icmp "slt" %194, %123 : i64
    llvm.cond_br %195, ^bb29, ^bb30
  ^bb29:  // pred: ^bb28
    %196 = llvm.getelementptr %187[%194] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %196 : f64, !llvm.ptr
    %197 = llvm.add %194, %2  : i64
    llvm.br ^bb28(%197 : i64)
  ^bb30:  // pred: ^bb28
    %198 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %193, %198 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_2D_f64(%5, %3, %2, %2, %138, %2, %153, %2, %168, %2, %183, %2, %198) {filename = "SPARSE_FILE_NAME1"} : (i32, i64, i64, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr) -> ()
    %199 = llvm.add %28, %2  : i64
    %200 = llvm.mlir.zero : !llvm.ptr
    %201 = llvm.getelementptr %200[%199] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %202 = llvm.ptrtoint %201 : !llvm.ptr to i64
    %203 = llvm.add %202, %0  : i64
    %204 = llvm.call @malloc(%203) : (i64) -> !llvm.ptr
    %205 = llvm.ptrtoint %204 : !llvm.ptr to i64
    %206 = llvm.sub %0, %2  : i64
    %207 = llvm.add %205, %206  : i64
    %208 = llvm.urem %207, %0  : i64
    %209 = llvm.sub %207, %208  : i64
    %210 = llvm.inttoptr %209 : i64 to !llvm.ptr
    %211 = llvm.getelementptr %210[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %211 : i64, !llvm.ptr
    %212 = llvm.mlir.zero : !llvm.ptr
    %213 = llvm.getelementptr %212[1] : (!llvm.ptr) -> !llvm.ptr, i64
    %214 = llvm.ptrtoint %213 : !llvm.ptr to i64
    %215 = llvm.call @malloc(%214) : (i64) -> !llvm.ptr
    %216 = llvm.load %32 : !llvm.ptr -> i64
    %217 = llvm.call @getTime() : () -> f64
    llvm.call @symbolic_phase(%62, %62, %3, %22, %2, %77, %77, %3, %24, %2, %92, %92, %3, %26, %2, %157, %157, %3, %119, %2, %172, %172, %3, %121, %2, %187, %187, %3, %123, %2, %216, %204, %210, %3, %199, %2, %215, %215, %3, %2, %2) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> ()
    %218 = llvm.load %215 : !llvm.ptr -> i64
    %219 = llvm.mlir.zero : !llvm.ptr
    %220 = llvm.getelementptr %219[%218] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %221 = llvm.ptrtoint %220 : !llvm.ptr to i64
    %222 = llvm.call @malloc(%221) : (i64) -> !llvm.ptr
    %223 = llvm.mlir.zero : !llvm.ptr
    %224 = llvm.getelementptr %223[%218] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %225 = llvm.ptrtoint %224 : !llvm.ptr to i64
    %226 = llvm.call @malloc(%225) : (i64) -> !llvm.ptr
    llvm.call @numeric_phase(%62, %62, %3, %22, %2, %77, %77, %3, %24, %2, %92, %92, %3, %26, %2, %157, %157, %3, %119, %2, %172, %172, %3, %121, %2, %187, %187, %3, %123, %2, %216, %204, %210, %3, %199, %2, %222, %222, %3, %218, %2, %226, %226, %3, %218, %2, %215, %215, %3, %2, %2) : (!llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> ()
    %227 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%217, %227) : (f64, f64) -> ()
    %228 = llvm.mlir.zero : !llvm.ptr
    %229 = llvm.getelementptr %228[1] : (!llvm.ptr) -> !llvm.ptr, i64
    %230 = llvm.ptrtoint %229 : !llvm.ptr to i64
    %231 = llvm.call @malloc(%230) : (i64) -> !llvm.ptr
    %232 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %233 = llvm.insertvalue %231, %232[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %234 = llvm.insertvalue %231, %233[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %235 = llvm.insertvalue %3, %234[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %236 = llvm.insertvalue %2, %235[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %237 = llvm.insertvalue %2, %236[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.store %3, %231 : i64, !llvm.ptr
    %238 = llvm.load %215 : !llvm.ptr -> i64
    llvm.br ^bb31(%3 : i64)
  ^bb31(%239: i64):  // 2 preds: ^bb30, ^bb32
    %240 = llvm.icmp "slt" %239, %238 : i64
    llvm.cond_br %240, ^bb32, ^bb33
  ^bb32:  // pred: ^bb31
    %241 = llvm.getelementptr %226[%239] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %242 = llvm.load %241 : !llvm.ptr -> f64
    %243 = llvm.fptoui %242 : f64 to i64
    %244 = llvm.load %231 : !llvm.ptr -> i64
    %245 = llvm.add %243, %244  : i64
    llvm.store %245, %231 : i64, !llvm.ptr
    %246 = llvm.add %239, %2  : i64
    llvm.br ^bb31(%246 : i64)
  ^bb33:  // pred: ^bb31
    %247 = llvm.alloca %2 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %237, %247 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @comet_print_memref_i64(%2, %247) : (i64, !llvm.ptr) -> ()
    llvm.call @free(%222) : (!llvm.ptr) -> ()
    llvm.call @free(%226) : (!llvm.ptr) -> ()
    %248 = llvm.getelementptr %210[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %3, %248 : i64, !llvm.ptr
    llvm.return
  }
  llvm.func @read_input_2D_f64(i32, i64, i64, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @read_input_sizes_2D_f64(i32, i64, i64, i64, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @quick_sort(i64, !llvm.ptr, i64) attributes {sym_visibility = "private"}
  llvm.func @getTime() -> f64 attributes {sym_visibility = "private"}
  llvm.func @printElapsedTime(f64, f64) attributes {sym_visibility = "private"}
  llvm.func @comet_print_memref_f64(i64, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @comet_print_memref_i64(i64, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @comet_sort_index(i64, !llvm.ptr, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @printNewline() attributes {sym_visibility = "private"}
  llvm.func @printI64(i64) attributes {sym_visibility = "private"}
}


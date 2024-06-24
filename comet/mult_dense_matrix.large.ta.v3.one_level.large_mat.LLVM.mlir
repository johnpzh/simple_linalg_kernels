module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @main() {
    %0 = llvm.mlir.constant(32 : index) : i64
    %1 = llvm.mlir.constant(2.200000e+00 : f64) : f64
    %2 = llvm.mlir.constant(3.400000e+00 : f64) : f64
    %3 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %4 = llvm.mlir.constant(0 : index) : i64
    %5 = llvm.mlir.constant(1 : index) : i64
    %6 = llvm.mlir.constant(100 : index) : i64
    %7 = llvm.mlir.constant(2000 : index) : i64
    %8 = llvm.mlir.constant(4000 : index) : i64
    %9 = llvm.mlir.constant(8000 : index) : i64
    %10 = llvm.mlir.zero : !llvm.ptr
    %11 = llvm.getelementptr %10[32000000] : (!llvm.ptr) -> !llvm.ptr, f64
    %12 = llvm.ptrtoint %11 : !llvm.ptr to i64
    %13 = llvm.add %12, %0  : i64
    %14 = llvm.call @malloc(%13) : (i64) -> !llvm.ptr
    %15 = llvm.ptrtoint %14 : !llvm.ptr to i64
    %16 = llvm.sub %0, %5  : i64
    %17 = llvm.add %15, %16  : i64
    %18 = llvm.urem %17, %0  : i64
    %19 = llvm.sub %17, %18  : i64
    %20 = llvm.inttoptr %19 : i64 to !llvm.ptr
    %21 = llvm.mlir.zero : !llvm.ptr
    %22 = llvm.getelementptr %21[8000000] : (!llvm.ptr) -> !llvm.ptr, f64
    %23 = llvm.ptrtoint %22 : !llvm.ptr to i64
    %24 = llvm.add %23, %0  : i64
    %25 = llvm.call @malloc(%24) : (i64) -> !llvm.ptr
    %26 = llvm.ptrtoint %25 : !llvm.ptr to i64
    %27 = llvm.sub %0, %5  : i64
    %28 = llvm.add %26, %27  : i64
    %29 = llvm.urem %28, %0  : i64
    %30 = llvm.sub %28, %29  : i64
    %31 = llvm.inttoptr %30 : i64 to !llvm.ptr
    %32 = llvm.mlir.zero : !llvm.ptr
    %33 = llvm.getelementptr %32[16000000] : (!llvm.ptr) -> !llvm.ptr, f64
    %34 = llvm.ptrtoint %33 : !llvm.ptr to i64
    %35 = llvm.add %34, %0  : i64
    %36 = llvm.call @malloc(%35) : (i64) -> !llvm.ptr
    %37 = llvm.ptrtoint %36 : !llvm.ptr to i64
    %38 = llvm.sub %0, %5  : i64
    %39 = llvm.add %37, %38  : i64
    %40 = llvm.urem %39, %0  : i64
    %41 = llvm.sub %39, %40  : i64
    %42 = llvm.inttoptr %41 : i64 to !llvm.ptr
    llvm.br ^bb1(%4 : i64)
  ^bb1(%43: i64):  // 2 preds: ^bb0, ^bb5
    %44 = llvm.icmp "slt" %43, %9 : i64
    llvm.cond_br %44, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%4 : i64)
  ^bb3(%45: i64):  // 2 preds: ^bb2, ^bb4
    %46 = llvm.icmp "slt" %45, %8 : i64
    llvm.cond_br %46, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %47 = llvm.mul %43, %8  : i64
    %48 = llvm.add %47, %45  : i64
    %49 = llvm.getelementptr %20[%48] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %1, %49 : f64, !llvm.ptr
    %50 = llvm.add %45, %5  : i64
    llvm.br ^bb3(%50 : i64)
  ^bb5:  // pred: ^bb3
    %51 = llvm.add %43, %5  : i64
    llvm.br ^bb1(%51 : i64)
  ^bb6:  // pred: ^bb1
    llvm.br ^bb7(%4 : i64)
  ^bb7(%52: i64):  // 2 preds: ^bb6, ^bb11
    %53 = llvm.icmp "slt" %52, %8 : i64
    llvm.cond_br %53, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%4 : i64)
  ^bb9(%54: i64):  // 2 preds: ^bb8, ^bb10
    %55 = llvm.icmp "slt" %54, %7 : i64
    llvm.cond_br %55, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %56 = llvm.mul %52, %7  : i64
    %57 = llvm.add %56, %54  : i64
    %58 = llvm.getelementptr %31[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %2, %58 : f64, !llvm.ptr
    %59 = llvm.add %54, %5  : i64
    llvm.br ^bb9(%59 : i64)
  ^bb11:  // pred: ^bb9
    %60 = llvm.add %52, %5  : i64
    llvm.br ^bb7(%60 : i64)
  ^bb12:  // pred: ^bb7
    llvm.br ^bb13(%4 : i64)
  ^bb13(%61: i64):  // 2 preds: ^bb12, ^bb17
    %62 = llvm.icmp "slt" %61, %9 : i64
    llvm.cond_br %62, ^bb14, ^bb18
  ^bb14:  // pred: ^bb13
    llvm.br ^bb15(%4 : i64)
  ^bb15(%63: i64):  // 2 preds: ^bb14, ^bb16
    %64 = llvm.icmp "slt" %63, %7 : i64
    llvm.cond_br %64, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    %65 = llvm.mul %61, %7  : i64
    %66 = llvm.add %65, %63  : i64
    %67 = llvm.getelementptr %42[%66] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %3, %67 : f64, !llvm.ptr
    %68 = llvm.add %63, %5  : i64
    llvm.br ^bb15(%68 : i64)
  ^bb17:  // pred: ^bb15
    %69 = llvm.add %61, %5  : i64
    llvm.br ^bb13(%69 : i64)
  ^bb18:  // pred: ^bb13
    llvm.br ^bb19(%4 : i64)
  ^bb19(%70: i64):  // 2 preds: ^bb18, ^bb20
    %71 = llvm.icmp "slt" %70, %6 : i64
    llvm.cond_br %71, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %72 = llvm.call @getTime() : () -> f64
    omp.parallel {
      omp.wsloop for  (%arg0) : i64 = (%4) to (%9) step (%5) {
        %75 = llvm.intr.stacksave : !llvm.ptr
        llvm.br ^bb1
      ^bb1:  // pred: ^bb0
        llvm.br ^bb2(%4 : i64)
      ^bb2(%76: i64):  // 2 preds: ^bb1, ^bb6
        %77 = llvm.icmp "slt" %76, %8 : i64
        llvm.cond_br %77, ^bb3, ^bb7
      ^bb3:  // pred: ^bb2
        llvm.br ^bb4(%4 : i64)
      ^bb4(%78: i64):  // 2 preds: ^bb3, ^bb5
        %79 = llvm.icmp "slt" %78, %7 : i64
        llvm.cond_br %79, ^bb5, ^bb6
      ^bb5:  // pred: ^bb4
        %80 = llvm.mul %arg0, %8  : i64
        %81 = llvm.add %80, %76  : i64
        %82 = llvm.getelementptr %20[%81] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %83 = llvm.load %82 : !llvm.ptr -> f64
        %84 = llvm.mul %76, %7  : i64
        %85 = llvm.add %84, %78  : i64
        %86 = llvm.getelementptr %31[%85] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %87 = llvm.load %86 : !llvm.ptr -> f64
        %88 = llvm.mul %arg0, %7  : i64
        %89 = llvm.add %88, %78  : i64
        %90 = llvm.getelementptr %42[%89] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %91 = llvm.load %90 : !llvm.ptr -> f64
        %92 = llvm.fmul %83, %87  : f64
        %93 = llvm.fadd %91, %92  : f64
        %94 = llvm.mul %arg0, %7  : i64
        %95 = llvm.add %94, %78  : i64
        %96 = llvm.getelementptr %42[%95] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        llvm.store %93, %96 : f64, !llvm.ptr
        %97 = llvm.add %78, %5  : i64
        llvm.br ^bb4(%97 : i64)
      ^bb6:  // pred: ^bb4
        %98 = llvm.add %76, %5  : i64
        llvm.br ^bb2(%98 : i64)
      ^bb7:  // pred: ^bb2
        llvm.intr.stackrestore %75 : !llvm.ptr
        llvm.br ^bb8
      ^bb8:  // pred: ^bb7
        omp.yield
      }
      omp.terminator
    }
    %73 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%72, %73) : (f64, f64) -> ()
    %74 = llvm.add %70, %5  : i64
    llvm.br ^bb19(%74 : i64)
  ^bb21:  // pred: ^bb19
    llvm.return
  }
  llvm.func @comet_sort_index(i64, !llvm.ptr, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @getTime() -> f64 attributes {sym_visibility = "private"}
  llvm.func @printElapsedTime(f64, f64) attributes {sym_visibility = "private"}
}


module {
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @main() {
    %0 = llvm.mlir.constant(13 : index) : i64
    %1 = llvm.mlir.constant(-1 : index) : i64
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = llvm.mlir.constant(1 : index) : i64
    %4 = llvm.mlir.constant(0 : i32) : i32
    %5 = llvm.mlir.constant(1 : i32) : i32
    %6 = llvm.mlir.constant(2 : index) : i64
    %7 = llvm.mlir.constant(32 : index) : i64
    %8 = llvm.mlir.constant(1.700000e+00 : f64) : f64
    %9 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %10 = llvm.mlir.zero : !llvm.ptr
    %11 = llvm.getelementptr %10[13] : (!llvm.ptr) -> !llvm.ptr, i64
    %12 = llvm.ptrtoint %11 : !llvm.ptr to i64
    %13 = llvm.call @malloc(%12) : (i64) -> !llvm.ptr
    %14 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %15 = llvm.insertvalue %13, %14[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %16 = llvm.insertvalue %13, %15[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %17 = llvm.insertvalue %2, %16[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %18 = llvm.insertvalue %0, %17[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %19 = llvm.insertvalue %3, %18[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %19, %20 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_sizes_2D_f64(%4, %2, %1, %3, %1, %3, %20, %5) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr, i32) -> ()
    %21 = llvm.load %13 : !llvm.ptr -> i64
    %22 = llvm.getelementptr %13[1] : (!llvm.ptr) -> !llvm.ptr, i64
    %23 = llvm.load %22 : !llvm.ptr -> i64
    %24 = llvm.getelementptr %13[2] : (!llvm.ptr) -> !llvm.ptr, i64
    %25 = llvm.load %24 : !llvm.ptr -> i64
    %26 = llvm.getelementptr %13[3] : (!llvm.ptr) -> !llvm.ptr, i64
    %27 = llvm.load %26 : !llvm.ptr -> i64
    %28 = llvm.getelementptr %13[4] : (!llvm.ptr) -> !llvm.ptr, i64
    %29 = llvm.load %28 : !llvm.ptr -> i64
    %30 = llvm.getelementptr %13[5] : (!llvm.ptr) -> !llvm.ptr, i64
    %31 = llvm.load %30 : !llvm.ptr -> i64
    %32 = llvm.getelementptr %13[6] : (!llvm.ptr) -> !llvm.ptr, i64
    %33 = llvm.load %32 : !llvm.ptr -> i64
    %34 = llvm.getelementptr %13[7] : (!llvm.ptr) -> !llvm.ptr, i64
    %35 = llvm.load %34 : !llvm.ptr -> i64
    %36 = llvm.getelementptr %13[8] : (!llvm.ptr) -> !llvm.ptr, i64
    %37 = llvm.load %36 : !llvm.ptr -> i64
    %38 = llvm.getelementptr %13[9] : (!llvm.ptr) -> !llvm.ptr, i64
    %39 = llvm.load %38 : !llvm.ptr -> i64
    %40 = llvm.getelementptr %13[10] : (!llvm.ptr) -> !llvm.ptr, i64
    %41 = llvm.load %40 : !llvm.ptr -> i64
    %42 = llvm.mlir.zero : !llvm.ptr
    %43 = llvm.getelementptr %42[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %44 = llvm.ptrtoint %43 : !llvm.ptr to i64
    %45 = llvm.call @malloc(%44) : (i64) -> !llvm.ptr
    %46 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %47 = llvm.insertvalue %45, %46[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %48 = llvm.insertvalue %45, %47[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %49 = llvm.insertvalue %2, %48[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %50 = llvm.insertvalue %21, %49[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %51 = llvm.insertvalue %3, %50[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%2 : i64)
  ^bb1(%52: i64):  // 2 preds: ^bb0, ^bb2
    %53 = llvm.icmp "slt" %52, %21 : i64
    llvm.cond_br %53, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %54 = llvm.getelementptr %45[%52] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %2, %54 : i64, !llvm.ptr
    %55 = llvm.add %52, %3  : i64
    llvm.br ^bb1(%55 : i64)
  ^bb3:  // pred: ^bb1
    %56 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %51, %56 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %57 = llvm.mlir.zero : !llvm.ptr
    %58 = llvm.getelementptr %57[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %59 = llvm.ptrtoint %58 : !llvm.ptr to i64
    %60 = llvm.call @malloc(%59) : (i64) -> !llvm.ptr
    %61 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %62 = llvm.insertvalue %60, %61[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %63 = llvm.insertvalue %60, %62[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %64 = llvm.insertvalue %2, %63[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %65 = llvm.insertvalue %23, %64[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %66 = llvm.insertvalue %3, %65[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb4(%2 : i64)
  ^bb4(%67: i64):  // 2 preds: ^bb3, ^bb5
    %68 = llvm.icmp "slt" %67, %23 : i64
    llvm.cond_br %68, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %69 = llvm.getelementptr %60[%67] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %2, %69 : i64, !llvm.ptr
    %70 = llvm.add %67, %3  : i64
    llvm.br ^bb4(%70 : i64)
  ^bb6:  // pred: ^bb4
    %71 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %66, %71 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %72 = llvm.mlir.zero : !llvm.ptr
    %73 = llvm.getelementptr %72[%25] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %74 = llvm.ptrtoint %73 : !llvm.ptr to i64
    %75 = llvm.call @malloc(%74) : (i64) -> !llvm.ptr
    %76 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %77 = llvm.insertvalue %75, %76[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %78 = llvm.insertvalue %75, %77[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %79 = llvm.insertvalue %2, %78[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %80 = llvm.insertvalue %25, %79[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %81 = llvm.insertvalue %3, %80[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb7(%2 : i64)
  ^bb7(%82: i64):  // 2 preds: ^bb6, ^bb8
    %83 = llvm.icmp "slt" %82, %25 : i64
    llvm.cond_br %83, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %84 = llvm.getelementptr %75[%82] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %2, %84 : i64, !llvm.ptr
    %85 = llvm.add %82, %3  : i64
    llvm.br ^bb7(%85 : i64)
  ^bb9:  // pred: ^bb7
    %86 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %81, %86 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %87 = llvm.mlir.zero : !llvm.ptr
    %88 = llvm.getelementptr %87[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %89 = llvm.ptrtoint %88 : !llvm.ptr to i64
    %90 = llvm.call @malloc(%89) : (i64) -> !llvm.ptr
    %91 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %92 = llvm.insertvalue %90, %91[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %93 = llvm.insertvalue %90, %92[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %94 = llvm.insertvalue %2, %93[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %95 = llvm.insertvalue %27, %94[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %96 = llvm.insertvalue %3, %95[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb10(%2 : i64)
  ^bb10(%97: i64):  // 2 preds: ^bb9, ^bb11
    %98 = llvm.icmp "slt" %97, %27 : i64
    llvm.cond_br %98, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %99 = llvm.getelementptr %90[%97] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %2, %99 : i64, !llvm.ptr
    %100 = llvm.add %97, %3  : i64
    llvm.br ^bb10(%100 : i64)
  ^bb12:  // pred: ^bb10
    %101 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %96, %101 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %102 = llvm.mlir.zero : !llvm.ptr
    %103 = llvm.getelementptr %102[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %104 = llvm.ptrtoint %103 : !llvm.ptr to i64
    %105 = llvm.call @malloc(%104) : (i64) -> !llvm.ptr
    %106 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %107 = llvm.insertvalue %105, %106[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %108 = llvm.insertvalue %105, %107[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %109 = llvm.insertvalue %2, %108[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %110 = llvm.insertvalue %29, %109[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %111 = llvm.insertvalue %3, %110[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb13(%2 : i64)
  ^bb13(%112: i64):  // 2 preds: ^bb12, ^bb14
    %113 = llvm.icmp "slt" %112, %29 : i64
    llvm.cond_br %113, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %114 = llvm.getelementptr %105[%112] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %2, %114 : i64, !llvm.ptr
    %115 = llvm.add %112, %3  : i64
    llvm.br ^bb13(%115 : i64)
  ^bb15:  // pred: ^bb13
    %116 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %111, %116 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %117 = llvm.mlir.zero : !llvm.ptr
    %118 = llvm.getelementptr %117[%31] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %119 = llvm.ptrtoint %118 : !llvm.ptr to i64
    %120 = llvm.call @malloc(%119) : (i64) -> !llvm.ptr
    %121 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %122 = llvm.insertvalue %120, %121[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %123 = llvm.insertvalue %120, %122[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %124 = llvm.insertvalue %2, %123[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %125 = llvm.insertvalue %31, %124[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %126 = llvm.insertvalue %3, %125[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb16(%2 : i64)
  ^bb16(%127: i64):  // 2 preds: ^bb15, ^bb17
    %128 = llvm.icmp "slt" %127, %31 : i64
    llvm.cond_br %128, ^bb17, ^bb18
  ^bb17:  // pred: ^bb16
    %129 = llvm.getelementptr %120[%127] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %2, %129 : i64, !llvm.ptr
    %130 = llvm.add %127, %3  : i64
    llvm.br ^bb16(%130 : i64)
  ^bb18:  // pred: ^bb16
    %131 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %126, %131 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %132 = llvm.mlir.zero : !llvm.ptr
    %133 = llvm.getelementptr %132[%33] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %134 = llvm.ptrtoint %133 : !llvm.ptr to i64
    %135 = llvm.call @malloc(%134) : (i64) -> !llvm.ptr
    %136 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %137 = llvm.insertvalue %135, %136[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %138 = llvm.insertvalue %135, %137[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %139 = llvm.insertvalue %2, %138[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %140 = llvm.insertvalue %33, %139[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %141 = llvm.insertvalue %3, %140[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb19(%2 : i64)
  ^bb19(%142: i64):  // 2 preds: ^bb18, ^bb20
    %143 = llvm.icmp "slt" %142, %33 : i64
    llvm.cond_br %143, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %144 = llvm.getelementptr %135[%142] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %2, %144 : i64, !llvm.ptr
    %145 = llvm.add %142, %3  : i64
    llvm.br ^bb19(%145 : i64)
  ^bb21:  // pred: ^bb19
    %146 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %141, %146 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %147 = llvm.mlir.zero : !llvm.ptr
    %148 = llvm.getelementptr %147[%35] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %149 = llvm.ptrtoint %148 : !llvm.ptr to i64
    %150 = llvm.call @malloc(%149) : (i64) -> !llvm.ptr
    %151 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %152 = llvm.insertvalue %150, %151[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %153 = llvm.insertvalue %150, %152[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %154 = llvm.insertvalue %2, %153[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %155 = llvm.insertvalue %35, %154[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %156 = llvm.insertvalue %3, %155[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb22(%2 : i64)
  ^bb22(%157: i64):  // 2 preds: ^bb21, ^bb23
    %158 = llvm.icmp "slt" %157, %35 : i64
    llvm.cond_br %158, ^bb23, ^bb24
  ^bb23:  // pred: ^bb22
    %159 = llvm.getelementptr %150[%157] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %2, %159 : i64, !llvm.ptr
    %160 = llvm.add %157, %3  : i64
    llvm.br ^bb22(%160 : i64)
  ^bb24:  // pred: ^bb22
    %161 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %156, %161 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %162 = llvm.mlir.zero : !llvm.ptr
    %163 = llvm.getelementptr %162[%37] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %164 = llvm.ptrtoint %163 : !llvm.ptr to i64
    %165 = llvm.call @malloc(%164) : (i64) -> !llvm.ptr
    %166 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %167 = llvm.insertvalue %165, %166[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %168 = llvm.insertvalue %165, %167[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %169 = llvm.insertvalue %2, %168[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %170 = llvm.insertvalue %37, %169[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %171 = llvm.insertvalue %3, %170[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb25(%2 : i64)
  ^bb25(%172: i64):  // 2 preds: ^bb24, ^bb26
    %173 = llvm.icmp "slt" %172, %37 : i64
    llvm.cond_br %173, ^bb26, ^bb27
  ^bb26:  // pred: ^bb25
    %174 = llvm.getelementptr %165[%172] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %9, %174 : f64, !llvm.ptr
    %175 = llvm.add %172, %3  : i64
    llvm.br ^bb25(%175 : i64)
  ^bb27:  // pred: ^bb25
    %176 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %171, %176 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_2D_f64(%4, %2, %1, %3, %1, %3, %56, %3, %71, %3, %86, %3, %101, %3, %116, %3, %131, %3, %146, %3, %161, %3, %176, %5) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i32) -> ()
    %177 = llvm.mul %41, %7  : i64
    %178 = llvm.mlir.zero : !llvm.ptr
    %179 = llvm.getelementptr %178[%177] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %180 = llvm.ptrtoint %179 : !llvm.ptr to i64
    %181 = llvm.add %180, %7  : i64
    %182 = llvm.call @malloc(%181) : (i64) -> !llvm.ptr
    %183 = llvm.ptrtoint %182 : !llvm.ptr to i64
    %184 = llvm.sub %7, %3  : i64
    %185 = llvm.add %183, %184  : i64
    %186 = llvm.urem %185, %7  : i64
    %187 = llvm.sub %185, %186  : i64
    %188 = llvm.inttoptr %187 : i64 to !llvm.ptr
    %189 = llvm.mul %39, %7  : i64
    %190 = llvm.mlir.zero : !llvm.ptr
    %191 = llvm.getelementptr %190[%189] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %192 = llvm.ptrtoint %191 : !llvm.ptr to i64
    %193 = llvm.add %192, %7  : i64
    %194 = llvm.call @malloc(%193) : (i64) -> !llvm.ptr
    %195 = llvm.ptrtoint %194 : !llvm.ptr to i64
    %196 = llvm.sub %7, %3  : i64
    %197 = llvm.add %195, %196  : i64
    %198 = llvm.urem %197, %7  : i64
    %199 = llvm.sub %197, %198  : i64
    %200 = llvm.inttoptr %199 : i64 to !llvm.ptr
    %201 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>
    %202 = llvm.insertvalue %194, %201[0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %203 = llvm.insertvalue %200, %202[1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %204 = llvm.insertvalue %2, %203[2] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %205 = llvm.insertvalue %39, %204[3, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %206 = llvm.insertvalue %7, %205[3, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %207 = llvm.insertvalue %7, %206[4, 0] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    %208 = llvm.insertvalue %3, %207[4, 1] : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> 
    llvm.br ^bb28(%2 : i64)
  ^bb28(%209: i64):  // 2 preds: ^bb27, ^bb32
    %210 = llvm.icmp "slt" %209, %41 : i64
    llvm.cond_br %210, ^bb29, ^bb33
  ^bb29:  // pred: ^bb28
    llvm.br ^bb30(%2 : i64)
  ^bb30(%211: i64):  // 2 preds: ^bb29, ^bb31
    %212 = llvm.icmp "slt" %211, %7 : i64
    llvm.cond_br %212, ^bb31, ^bb32
  ^bb31:  // pred: ^bb30
    %213 = llvm.mul %209, %7  : i64
    %214 = llvm.add %213, %211  : i64
    %215 = llvm.getelementptr %188[%214] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %8, %215 : f64, !llvm.ptr
    %216 = llvm.add %211, %3  : i64
    llvm.br ^bb30(%216 : i64)
  ^bb32:  // pred: ^bb30
    %217 = llvm.add %209, %3  : i64
    llvm.br ^bb28(%217 : i64)
  ^bb33:  // pred: ^bb28
    llvm.br ^bb34(%2 : i64)
  ^bb34(%218: i64):  // 2 preds: ^bb33, ^bb38
    %219 = llvm.icmp "slt" %218, %39 : i64
    llvm.cond_br %219, ^bb35, ^bb39
  ^bb35:  // pred: ^bb34
    llvm.br ^bb36(%2 : i64)
  ^bb36(%220: i64):  // 2 preds: ^bb35, ^bb37
    %221 = llvm.icmp "slt" %220, %7 : i64
    llvm.cond_br %221, ^bb37, ^bb38
  ^bb37:  // pred: ^bb36
    %222 = llvm.mul %218, %7  : i64
    %223 = llvm.add %222, %220  : i64
    %224 = llvm.getelementptr %200[%223] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %9, %224 : f64, !llvm.ptr
    %225 = llvm.add %220, %3  : i64
    llvm.br ^bb36(%225 : i64)
  ^bb38:  // pred: ^bb36
    %226 = llvm.add %218, %3  : i64
    llvm.br ^bb34(%226 : i64)
  ^bb39:  // pred: ^bb34
    %227 = llvm.call @getTime() : () -> f64
    %228 = llvm.load %45 : !llvm.ptr -> i64
    omp.parallel {
      omp.wsloop for  (%arg0) : i64 = (%2) to (%228) step (%3) {
        %231 = llvm.intr.stacksave : !llvm.ptr
        llvm.br ^bb1
      ^bb1:  // pred: ^bb0
        %232 = llvm.add %arg0, %3  : i64
        %233 = llvm.getelementptr %105[%arg0] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %234 = llvm.load %233 : !llvm.ptr -> i64
        %235 = llvm.getelementptr %105[%232] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %236 = llvm.load %235 : !llvm.ptr -> i64
        llvm.br ^bb2(%234 : i64)
      ^bb2(%237: i64):  // 2 preds: ^bb1, ^bb6
        %238 = llvm.icmp "slt" %237, %236 : i64
        llvm.cond_br %238, ^bb3, ^bb7
      ^bb3:  // pred: ^bb2
        %239 = llvm.getelementptr %120[%237] : (!llvm.ptr, i64) -> !llvm.ptr, i64
        %240 = llvm.load %239 : !llvm.ptr -> i64
        llvm.br ^bb4(%2 : i64)
      ^bb4(%241: i64):  // 2 preds: ^bb3, ^bb5
        %242 = llvm.icmp "slt" %241, %7 : i64
        llvm.cond_br %242, ^bb5, ^bb6
      ^bb5:  // pred: ^bb4
        %243 = llvm.getelementptr %165[%237] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %244 = llvm.load %243 : !llvm.ptr -> f64
        %245 = llvm.mul %240, %7  : i64
        %246 = llvm.add %245, %241  : i64
        %247 = llvm.getelementptr %188[%246] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %248 = llvm.load %247 : !llvm.ptr -> f64
        %249 = llvm.mul %arg0, %7  : i64
        %250 = llvm.add %249, %241  : i64
        %251 = llvm.getelementptr %200[%250] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        %252 = llvm.load %251 : !llvm.ptr -> f64
        %253 = llvm.fmul %244, %248  : f64
        %254 = llvm.fadd %252, %253  : f64
        %255 = llvm.mul %arg0, %7  : i64
        %256 = llvm.add %255, %241  : i64
        %257 = llvm.getelementptr %200[%256] : (!llvm.ptr, i64) -> !llvm.ptr, f64
        llvm.store %254, %257 : f64, !llvm.ptr
        %258 = llvm.add %241, %3  : i64
        llvm.br ^bb4(%258 : i64)
      ^bb6:  // pred: ^bb4
        %259 = llvm.add %237, %3  : i64
        llvm.br ^bb2(%259 : i64)
      ^bb7:  // pred: ^bb2
        llvm.intr.stackrestore %231 : !llvm.ptr
        llvm.br ^bb8
      ^bb8:  // pred: ^bb7
        omp.yield
      }
      omp.terminator
    }
    %229 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%227, %229) : (f64, f64) -> ()
    %230 = llvm.alloca %3 x !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %208, %230 : !llvm.struct<(ptr, ptr, i64, array<2 x i64>, array<2 x i64>)>, !llvm.ptr
    llvm.call @comet_print_memref_f64(%6, %230) : (i64, !llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @read_input_2D_f64(i32, i64, i64, i64, i64, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i32) attributes {sym_visibility = "private"}
  llvm.func @read_input_sizes_2D_f64(i32, i64, i64, i64, i64, i64, !llvm.ptr, i32) attributes {sym_visibility = "private"}
  llvm.func @comet_sort_index(i64, !llvm.ptr, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @getTime() -> f64 attributes {sym_visibility = "private"}
  llvm.func @printElapsedTime(f64, f64) attributes {sym_visibility = "private"}
  llvm.func @comet_print_memref_f64(i64, !llvm.ptr) attributes {sym_visibility = "private"}
}


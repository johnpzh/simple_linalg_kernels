module {
  llvm.func @abort()
  llvm.func @puts(!llvm.ptr)
  llvm.mlir.global private constant @assert_msg(dense<[65, 119, 97, 105, 116, 101, 100, 32, 97, 115, 121, 110, 99, 32, 111, 112, 101, 114, 97, 110, 100, 32, 105, 115, 32, 105, 110, 32, 101, 114, 114, 111, 114, 32, 115, 116, 97, 116, 101, 0]> : tensor<40xi8>) {addr_space = 0 : i32} : !llvm.array<40 x i8>
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @free(!llvm.ptr)
  llvm.func @aligned_alloc(i64, i64) -> !llvm.ptr
  llvm.func @main() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(true) : i1
    %3 = llvm.mlir.constant(13 : index) : i64
    %4 = llvm.mlir.constant(-1 : index) : i64
    %5 = llvm.mlir.constant(0 : index) : i64
    %6 = llvm.mlir.constant(1 : index) : i64
    %7 = llvm.mlir.constant(0 : i32) : i32
    %8 = llvm.mlir.constant(1 : i32) : i32
    %9 = llvm.mlir.constant(1000 : index) : i64
    %10 = llvm.mlir.constant(100 : index) : i64
    %11 = llvm.mlir.constant(32 : index) : i64
    %12 = llvm.mlir.constant(1.700000e+00 : f64) : f64
    %13 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %14 = llvm.mlir.zero : !llvm.ptr
    %15 = llvm.getelementptr %14[13] : (!llvm.ptr) -> !llvm.ptr, i64
    %16 = llvm.ptrtoint %15 : !llvm.ptr to i64
    %17 = llvm.call @malloc(%16) : (i64) -> !llvm.ptr
    %18 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %19 = llvm.insertvalue %17, %18[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %20 = llvm.insertvalue %17, %19[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %5, %20[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.insertvalue %3, %21[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.insertvalue %6, %22[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %23, %24 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_sizes_2D_f64(%7, %5, %4, %6, %4, %6, %24, %8) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr, i32) -> ()
    %25 = llvm.load %17 : !llvm.ptr -> i64
    %26 = llvm.getelementptr %17[1] : (!llvm.ptr) -> !llvm.ptr, i64
    %27 = llvm.load %26 : !llvm.ptr -> i64
    %28 = llvm.getelementptr %17[2] : (!llvm.ptr) -> !llvm.ptr, i64
    %29 = llvm.load %28 : !llvm.ptr -> i64
    %30 = llvm.getelementptr %17[3] : (!llvm.ptr) -> !llvm.ptr, i64
    %31 = llvm.load %30 : !llvm.ptr -> i64
    %32 = llvm.getelementptr %17[4] : (!llvm.ptr) -> !llvm.ptr, i64
    %33 = llvm.load %32 : !llvm.ptr -> i64
    %34 = llvm.getelementptr %17[5] : (!llvm.ptr) -> !llvm.ptr, i64
    %35 = llvm.load %34 : !llvm.ptr -> i64
    %36 = llvm.getelementptr %17[6] : (!llvm.ptr) -> !llvm.ptr, i64
    %37 = llvm.load %36 : !llvm.ptr -> i64
    %38 = llvm.getelementptr %17[7] : (!llvm.ptr) -> !llvm.ptr, i64
    %39 = llvm.load %38 : !llvm.ptr -> i64
    %40 = llvm.getelementptr %17[8] : (!llvm.ptr) -> !llvm.ptr, i64
    %41 = llvm.load %40 : !llvm.ptr -> i64
    %42 = llvm.getelementptr %17[9] : (!llvm.ptr) -> !llvm.ptr, i64
    %43 = llvm.load %42 : !llvm.ptr -> i64
    %44 = llvm.getelementptr %17[10] : (!llvm.ptr) -> !llvm.ptr, i64
    %45 = llvm.load %44 : !llvm.ptr -> i64
    %46 = llvm.mlir.zero : !llvm.ptr
    %47 = llvm.getelementptr %46[%25] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %48 = llvm.ptrtoint %47 : !llvm.ptr to i64
    %49 = llvm.call @malloc(%48) : (i64) -> !llvm.ptr
    %50 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %51 = llvm.insertvalue %49, %50[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %52 = llvm.insertvalue %49, %51[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %53 = llvm.insertvalue %5, %52[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %54 = llvm.insertvalue %25, %53[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %55 = llvm.insertvalue %6, %54[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%5 : i64)
  ^bb1(%56: i64):  // 2 preds: ^bb0, ^bb2
    %57 = llvm.icmp "slt" %56, %25 : i64
    llvm.cond_br %57, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %58 = llvm.getelementptr %49[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %58 : i64, !llvm.ptr
    %59 = llvm.add %56, %6  : i64
    llvm.br ^bb1(%59 : i64)
  ^bb3:  // pred: ^bb1
    %60 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %55, %60 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %61 = llvm.mlir.zero : !llvm.ptr
    %62 = llvm.getelementptr %61[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %63 = llvm.ptrtoint %62 : !llvm.ptr to i64
    %64 = llvm.call @malloc(%63) : (i64) -> !llvm.ptr
    %65 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %66 = llvm.insertvalue %64, %65[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %67 = llvm.insertvalue %64, %66[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %68 = llvm.insertvalue %5, %67[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %69 = llvm.insertvalue %27, %68[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %70 = llvm.insertvalue %6, %69[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb4(%5 : i64)
  ^bb4(%71: i64):  // 2 preds: ^bb3, ^bb5
    %72 = llvm.icmp "slt" %71, %27 : i64
    llvm.cond_br %72, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %73 = llvm.getelementptr %64[%71] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %73 : i64, !llvm.ptr
    %74 = llvm.add %71, %6  : i64
    llvm.br ^bb4(%74 : i64)
  ^bb6:  // pred: ^bb4
    %75 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %70, %75 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %76 = llvm.mlir.zero : !llvm.ptr
    %77 = llvm.getelementptr %76[%29] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %78 = llvm.ptrtoint %77 : !llvm.ptr to i64
    %79 = llvm.call @malloc(%78) : (i64) -> !llvm.ptr
    %80 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %81 = llvm.insertvalue %79, %80[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %82 = llvm.insertvalue %79, %81[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.insertvalue %5, %82[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %84 = llvm.insertvalue %29, %83[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %85 = llvm.insertvalue %6, %84[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb7(%5 : i64)
  ^bb7(%86: i64):  // 2 preds: ^bb6, ^bb8
    %87 = llvm.icmp "slt" %86, %29 : i64
    llvm.cond_br %87, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %88 = llvm.getelementptr %79[%86] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %88 : i64, !llvm.ptr
    %89 = llvm.add %86, %6  : i64
    llvm.br ^bb7(%89 : i64)
  ^bb9:  // pred: ^bb7
    %90 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %85, %90 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %91 = llvm.mlir.zero : !llvm.ptr
    %92 = llvm.getelementptr %91[%31] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %93 = llvm.ptrtoint %92 : !llvm.ptr to i64
    %94 = llvm.call @malloc(%93) : (i64) -> !llvm.ptr
    %95 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %96 = llvm.insertvalue %94, %95[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %97 = llvm.insertvalue %94, %96[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %98 = llvm.insertvalue %5, %97[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %99 = llvm.insertvalue %31, %98[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %100 = llvm.insertvalue %6, %99[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb10(%5 : i64)
  ^bb10(%101: i64):  // 2 preds: ^bb9, ^bb11
    %102 = llvm.icmp "slt" %101, %31 : i64
    llvm.cond_br %102, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %103 = llvm.getelementptr %94[%101] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %103 : i64, !llvm.ptr
    %104 = llvm.add %101, %6  : i64
    llvm.br ^bb10(%104 : i64)
  ^bb12:  // pred: ^bb10
    %105 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %100, %105 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %106 = llvm.mlir.zero : !llvm.ptr
    %107 = llvm.getelementptr %106[%33] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %108 = llvm.ptrtoint %107 : !llvm.ptr to i64
    %109 = llvm.call @malloc(%108) : (i64) -> !llvm.ptr
    %110 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %111 = llvm.insertvalue %109, %110[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %112 = llvm.insertvalue %109, %111[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %113 = llvm.insertvalue %5, %112[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %114 = llvm.insertvalue %33, %113[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %115 = llvm.insertvalue %6, %114[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb13(%5 : i64)
  ^bb13(%116: i64):  // 2 preds: ^bb12, ^bb14
    %117 = llvm.icmp "slt" %116, %33 : i64
    llvm.cond_br %117, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %118 = llvm.getelementptr %109[%116] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %118 : i64, !llvm.ptr
    %119 = llvm.add %116, %6  : i64
    llvm.br ^bb13(%119 : i64)
  ^bb15:  // pred: ^bb13
    %120 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %115, %120 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %121 = llvm.mlir.zero : !llvm.ptr
    %122 = llvm.getelementptr %121[%35] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %123 = llvm.ptrtoint %122 : !llvm.ptr to i64
    %124 = llvm.call @malloc(%123) : (i64) -> !llvm.ptr
    %125 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %126 = llvm.insertvalue %124, %125[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %127 = llvm.insertvalue %124, %126[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %128 = llvm.insertvalue %5, %127[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %129 = llvm.insertvalue %35, %128[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %130 = llvm.insertvalue %6, %129[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb16(%5 : i64)
  ^bb16(%131: i64):  // 2 preds: ^bb15, ^bb17
    %132 = llvm.icmp "slt" %131, %35 : i64
    llvm.cond_br %132, ^bb17, ^bb18
  ^bb17:  // pred: ^bb16
    %133 = llvm.getelementptr %124[%131] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %133 : i64, !llvm.ptr
    %134 = llvm.add %131, %6  : i64
    llvm.br ^bb16(%134 : i64)
  ^bb18:  // pred: ^bb16
    %135 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %130, %135 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %136 = llvm.mlir.zero : !llvm.ptr
    %137 = llvm.getelementptr %136[%37] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %138 = llvm.ptrtoint %137 : !llvm.ptr to i64
    %139 = llvm.call @malloc(%138) : (i64) -> !llvm.ptr
    %140 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %141 = llvm.insertvalue %139, %140[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %142 = llvm.insertvalue %139, %141[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %143 = llvm.insertvalue %5, %142[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %144 = llvm.insertvalue %37, %143[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %145 = llvm.insertvalue %6, %144[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb19(%5 : i64)
  ^bb19(%146: i64):  // 2 preds: ^bb18, ^bb20
    %147 = llvm.icmp "slt" %146, %37 : i64
    llvm.cond_br %147, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %148 = llvm.getelementptr %139[%146] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %148 : i64, !llvm.ptr
    %149 = llvm.add %146, %6  : i64
    llvm.br ^bb19(%149 : i64)
  ^bb21:  // pred: ^bb19
    %150 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %145, %150 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %151 = llvm.mlir.zero : !llvm.ptr
    %152 = llvm.getelementptr %151[%39] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %153 = llvm.ptrtoint %152 : !llvm.ptr to i64
    %154 = llvm.call @malloc(%153) : (i64) -> !llvm.ptr
    %155 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %156 = llvm.insertvalue %154, %155[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %157 = llvm.insertvalue %154, %156[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %158 = llvm.insertvalue %5, %157[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %159 = llvm.insertvalue %39, %158[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %160 = llvm.insertvalue %6, %159[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb22(%5 : i64)
  ^bb22(%161: i64):  // 2 preds: ^bb21, ^bb23
    %162 = llvm.icmp "slt" %161, %39 : i64
    llvm.cond_br %162, ^bb23, ^bb24
  ^bb23:  // pred: ^bb22
    %163 = llvm.getelementptr %154[%161] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %163 : i64, !llvm.ptr
    %164 = llvm.add %161, %6  : i64
    llvm.br ^bb22(%164 : i64)
  ^bb24:  // pred: ^bb22
    %165 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %160, %165 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %166 = llvm.mlir.zero : !llvm.ptr
    %167 = llvm.getelementptr %166[%41] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %168 = llvm.ptrtoint %167 : !llvm.ptr to i64
    %169 = llvm.call @malloc(%168) : (i64) -> !llvm.ptr
    %170 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %171 = llvm.insertvalue %169, %170[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %172 = llvm.insertvalue %169, %171[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %173 = llvm.insertvalue %5, %172[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %174 = llvm.insertvalue %41, %173[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %175 = llvm.insertvalue %6, %174[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb25(%5 : i64)
  ^bb25(%176: i64):  // 2 preds: ^bb24, ^bb26
    %177 = llvm.icmp "slt" %176, %41 : i64
    llvm.cond_br %177, ^bb26, ^bb27
  ^bb26:  // pred: ^bb25
    %178 = llvm.getelementptr %169[%176] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %13, %178 : f64, !llvm.ptr
    %179 = llvm.add %176, %6  : i64
    llvm.br ^bb25(%179 : i64)
  ^bb27:  // pred: ^bb25
    %180 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %175, %180 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_2D_f64(%7, %5, %4, %6, %4, %6, %60, %6, %75, %6, %90, %6, %105, %6, %120, %6, %135, %6, %150, %6, %165, %6, %180, %8) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i32) -> ()
    %181 = llvm.mul %45, %11  : i64
    %182 = llvm.mlir.zero : !llvm.ptr
    %183 = llvm.getelementptr %182[%181] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %184 = llvm.ptrtoint %183 : !llvm.ptr to i64
    %185 = llvm.add %184, %11  : i64
    %186 = llvm.call @malloc(%185) : (i64) -> !llvm.ptr
    %187 = llvm.ptrtoint %186 : !llvm.ptr to i64
    %188 = llvm.sub %11, %6  : i64
    %189 = llvm.add %187, %188  : i64
    %190 = llvm.urem %189, %11  : i64
    %191 = llvm.sub %189, %190  : i64
    %192 = llvm.inttoptr %191 : i64 to !llvm.ptr
    %193 = llvm.mul %43, %11  : i64
    %194 = llvm.mlir.zero : !llvm.ptr
    %195 = llvm.getelementptr %194[%193] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %196 = llvm.ptrtoint %195 : !llvm.ptr to i64
    %197 = llvm.add %196, %11  : i64
    %198 = llvm.call @malloc(%197) : (i64) -> !llvm.ptr
    %199 = llvm.ptrtoint %198 : !llvm.ptr to i64
    %200 = llvm.sub %11, %6  : i64
    %201 = llvm.add %199, %200  : i64
    %202 = llvm.urem %201, %11  : i64
    %203 = llvm.sub %201, %202  : i64
    %204 = llvm.inttoptr %203 : i64 to !llvm.ptr
    llvm.br ^bb28(%5 : i64)
  ^bb28(%205: i64):  // 2 preds: ^bb27, ^bb32
    %206 = llvm.icmp "slt" %205, %45 : i64
    llvm.cond_br %206, ^bb29, ^bb33
  ^bb29:  // pred: ^bb28
    llvm.br ^bb30(%5 : i64)
  ^bb30(%207: i64):  // 2 preds: ^bb29, ^bb31
    %208 = llvm.icmp "slt" %207, %11 : i64
    llvm.cond_br %208, ^bb31, ^bb32
  ^bb31:  // pred: ^bb30
    %209 = llvm.mul %205, %11  : i64
    %210 = llvm.add %209, %207  : i64
    %211 = llvm.getelementptr %192[%210] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %12, %211 : f64, !llvm.ptr
    %212 = llvm.add %207, %6  : i64
    llvm.br ^bb30(%212 : i64)
  ^bb32:  // pred: ^bb30
    %213 = llvm.add %205, %6  : i64
    llvm.br ^bb28(%213 : i64)
  ^bb33:  // pred: ^bb28
    llvm.br ^bb34(%5 : i64)
  ^bb34(%214: i64):  // 2 preds: ^bb33, ^bb38
    %215 = llvm.icmp "slt" %214, %43 : i64
    llvm.cond_br %215, ^bb35, ^bb39
  ^bb35:  // pred: ^bb34
    llvm.br ^bb36(%5 : i64)
  ^bb36(%216: i64):  // 2 preds: ^bb35, ^bb37
    %217 = llvm.icmp "slt" %216, %11 : i64
    llvm.cond_br %217, ^bb37, ^bb38
  ^bb37:  // pred: ^bb36
    %218 = llvm.mul %214, %11  : i64
    %219 = llvm.add %218, %216  : i64
    %220 = llvm.getelementptr %204[%219] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %13, %220 : f64, !llvm.ptr
    %221 = llvm.add %216, %6  : i64
    llvm.br ^bb36(%221 : i64)
  ^bb38:  // pred: ^bb36
    %222 = llvm.add %214, %6  : i64
    llvm.br ^bb34(%222 : i64)
  ^bb39:  // pred: ^bb34
    llvm.br ^bb40(%5 : i64)
  ^bb40(%223: i64):  // 2 preds: ^bb39, ^bb47
    %224 = llvm.icmp "slt" %223, %10 : i64
    llvm.cond_br %224, ^bb41, ^bb48
  ^bb41:  // pred: ^bb40
    %225 = llvm.call @getTime() : () -> f64
    %226 = llvm.load %49 : !llvm.ptr -> i64
    %227 = llvm.icmp "eq" %226, %5 : i64
    llvm.cond_br %227, ^bb42, ^bb43
  ^bb42:  // 3 preds: ^bb41, ^bb44, ^bb46
    llvm.br ^bb47
  ^bb43:  // pred: ^bb41
    %228 = llvm.select %2, %4, %6 : i1, i64
    %229 = llvm.add %228, %226  : i64
    %230 = llvm.sdiv %229, %11  : i64
    %231 = llvm.add %230, %6  : i64
    %232 = llvm.sub %5, %226  : i64
    %233 = llvm.sdiv %232, %11  : i64
    %234 = llvm.sub %5, %233  : i64
    %235 = llvm.icmp "slt" %226, %5 : i64
    %236 = llvm.icmp "sgt" %226, %5 : i64
    %237 = llvm.and %235, %1  : i1
    %238 = llvm.and %236, %2  : i1
    %239 = llvm.or %237, %238  : i1
    %240 = llvm.select %239, %231, %234 : i1, i64
    %241 = llvm.intr.smax(%240, %9)  : (i64, i64) -> i64
    %242 = llvm.intr.smin(%226, %241)  : (i64, i64) -> i64
    %243 = llvm.icmp "sgt" %242, %5 : i64
    %244 = llvm.select %243, %4, %6 : i1, i64
    %245 = llvm.add %244, %226  : i64
    %246 = llvm.sdiv %245, %242  : i64
    %247 = llvm.add %246, %6  : i64
    %248 = llvm.sub %5, %226  : i64
    %249 = llvm.sdiv %248, %242  : i64
    %250 = llvm.sub %5, %249  : i64
    %251 = llvm.icmp "slt" %226, %5 : i64
    %252 = llvm.icmp "sgt" %226, %5 : i64
    %253 = llvm.icmp "slt" %242, %5 : i64
    %254 = llvm.icmp "sgt" %242, %5 : i64
    %255 = llvm.and %251, %253  : i1
    %256 = llvm.and %252, %254  : i1
    %257 = llvm.or %255, %256  : i1
    %258 = llvm.select %257, %247, %250 : i1, i64
    %259 = llvm.icmp "eq" %258, %6 : i64
    llvm.cond_br %259, ^bb44, ^bb45
  ^bb44:  // pred: ^bb43
    llvm.call @parallel_compute_fn(%5, %242, %226, %5, %226, %6, %109, %109, %5, %33, %6, %124, %124, %5, %35, %6, %169, %169, %5, %41, %6, %186, %192, %5, %45, %11, %11, %6, %198, %204, %5, %43, %11, %11, %6) : (i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.br ^bb42
  ^bb45:  // pred: ^bb43
    %260 = llvm.sub %258, %6  : i64
    %261 = llvm.call @mlirAsyncRuntimeCreateGroup(%260) : (i64) -> !llvm.ptr
    llvm.call @mlirAsyncRuntimeAddRef(%261, %0) : (!llvm.ptr, i64) -> ()
    llvm.call @async_dispatch_fn(%261, %5, %258, %242, %226, %5, %226, %6, %109, %109, %5, %33, %6, %124, %124, %5, %35, %6, %169, %169, %5, %41, %6, %186, %192, %5, %45, %11, %11, %6, %198, %204, %5, %43, %11, %11, %6) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.call @mlirAsyncRuntimeAwaitAllInGroup(%261) : (!llvm.ptr) -> ()
    %262 = llvm.call @mlirAsyncRuntimeIsGroupError(%261) : (!llvm.ptr) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%261, %0) : (!llvm.ptr, i64) -> ()
    %263 = llvm.xor %262, %2  : i1
    llvm.cond_br %263, ^bb46, ^bb49
  ^bb46:  // pred: ^bb45
    llvm.br ^bb42
  ^bb47:  // pred: ^bb42
    %264 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%225, %264) : (f64, f64) -> ()
    %265 = llvm.add %223, %6  : i64
    llvm.br ^bb40(%265 : i64)
  ^bb48:  // pred: ^bb40
    llvm.return
  ^bb49:  // pred: ^bb45
    %266 = llvm.mlir.addressof @assert_msg : !llvm.ptr
    llvm.call @puts(%266) : (!llvm.ptr) -> ()
    llvm.call @abort() : () -> ()
    llvm.unreachable
  }
  llvm.func @read_input_2D_f64(i32, i64, i64, i64, i64, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i32) attributes {sym_visibility = "private"}
  llvm.func @read_input_sizes_2D_f64(i32, i64, i64, i64, i64, i64, !llvm.ptr, i32) attributes {sym_visibility = "private"}
  llvm.func @comet_sort_index(i64, !llvm.ptr, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @getTime() -> f64 attributes {sym_visibility = "private"}
  llvm.func @printElapsedTime(f64, f64) attributes {sym_visibility = "private"}
  llvm.func @parallel_compute_fn(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: !llvm.ptr, %arg12: !llvm.ptr, %arg13: i64, %arg14: i64, %arg15: i64, %arg16: !llvm.ptr, %arg17: !llvm.ptr, %arg18: i64, %arg19: i64, %arg20: i64, %arg21: !llvm.ptr, %arg22: !llvm.ptr, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: i64, %arg27: i64, %arg28: !llvm.ptr, %arg29: !llvm.ptr, %arg30: i64, %arg31: i64, %arg32: i64, %arg33: i64, %arg34: i64) attributes {sym_visibility = "private"} {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(32 : index) : i64
    %3 = llvm.mul %arg0, %arg1  : i64
    %4 = llvm.add %3, %arg1  : i64
    %5 = llvm.intr.smin(%4, %arg2)  : (i64, i64) -> i64
    %6 = llvm.sub %5, %1  : i64
    %7 = llvm.srem %3, %arg2  : i64
    %8 = llvm.srem %6, %arg2  : i64
    %9 = llvm.add %8, %1  : i64
    llvm.br ^bb1(%7 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb8
    %11 = llvm.icmp "slt" %10, %9 : i64
    llvm.cond_br %11, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    %12 = llvm.add %10, %1  : i64
    %13 = llvm.getelementptr %arg7[%10] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %14 = llvm.load %13 : !llvm.ptr -> i64
    %15 = llvm.getelementptr %arg7[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %16 = llvm.load %15 : !llvm.ptr -> i64
    llvm.br ^bb3(%14 : i64)
  ^bb3(%17: i64):  // 2 preds: ^bb2, ^bb7
    %18 = llvm.icmp "slt" %17, %16 : i64
    llvm.cond_br %18, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    %19 = llvm.getelementptr %arg12[%17] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %20 = llvm.load %19 : !llvm.ptr -> i64
    %21 = llvm.getelementptr %arg17[%17] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %22 = llvm.load %21 : !llvm.ptr -> f64
    llvm.br ^bb5(%0 : i64)
  ^bb5(%23: i64):  // 2 preds: ^bb4, ^bb6
    %24 = llvm.icmp "slt" %23, %2 : i64
    llvm.cond_br %24, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %25 = llvm.mul %20, %2  : i64
    %26 = llvm.add %25, %23  : i64
    %27 = llvm.getelementptr %arg22[%26] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %28 = llvm.load %27 : !llvm.ptr -> f64
    %29 = llvm.mul %10, %2  : i64
    %30 = llvm.add %29, %23  : i64
    %31 = llvm.getelementptr %arg29[%30] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %32 = llvm.load %31 : !llvm.ptr -> f64
    %33 = llvm.fmul %22, %28  : f64
    %34 = llvm.fadd %32, %33  : f64
    %35 = llvm.mul %10, %2  : i64
    %36 = llvm.add %35, %23  : i64
    %37 = llvm.getelementptr %arg29[%36] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %34, %37 : f64, !llvm.ptr
    %38 = llvm.add %23, %1  : i64
    llvm.br ^bb5(%38 : i64)
  ^bb7:  // pred: ^bb5
    %39 = llvm.add %17, %1  : i64
    llvm.br ^bb3(%39 : i64)
  ^bb8:  // pred: ^bb3
    %40 = llvm.add %10, %1  : i64
    llvm.br ^bb1(%40 : i64)
  ^bb9:  // pred: ^bb1
    llvm.return
  }
  llvm.func @async_dispatch_fn(%arg0: !llvm.ptr, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: !llvm.ptr, %arg19: !llvm.ptr, %arg20: i64, %arg21: i64, %arg22: i64, %arg23: !llvm.ptr, %arg24: !llvm.ptr, %arg25: i64, %arg26: i64, %arg27: i64, %arg28: i64, %arg29: i64, %arg30: !llvm.ptr, %arg31: !llvm.ptr, %arg32: i64, %arg33: i64, %arg34: i64, %arg35: i64, %arg36: i64) attributes {sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(2 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%arg1, %arg2 : i64, i64)
  ^bb1(%3: i64, %4: i64):  // 2 preds: ^bb0, ^bb2
    %5 = llvm.sub %4, %3  : i64
    %6 = llvm.icmp "sgt" %5, %2 : i64
    llvm.cond_br %6, ^bb2(%3, %4 : i64, i64), ^bb3
  ^bb2(%7: i64, %8: i64):  // pred: ^bb1
    %9 = llvm.sub %8, %7  : i64
    %10 = llvm.sdiv %9, %1  : i64
    %11 = llvm.add %7, %10  : i64
    llvm.call @mlirAsyncRuntimeAddRef(%arg0, %0) : (!llvm.ptr, i64) -> ()
    %12 = llvm.call @async_execute_fn(%arg0, %11, %8, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31, %arg32, %arg33, %arg34, %arg35, %arg36) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.ptr
    %13 = llvm.call @mlirAsyncRuntimeAddTokenToGroup(%12, %arg0) : (!llvm.ptr, !llvm.ptr) -> i64
    llvm.call @mlirAsyncRuntimeDropRef(%12, %0) : (!llvm.ptr, i64) -> ()
    llvm.br ^bb1(%7, %11 : i64, i64)
  ^bb3:  // pred: ^bb1
    llvm.call @mlirAsyncRuntimeDropRef(%arg0, %0) : (!llvm.ptr, i64) -> ()
    llvm.call @parallel_compute_fn(%arg1, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31, %arg32, %arg33, %arg34, %arg35, %arg36) : (i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
  llvm.func @async_execute_fn(%arg0: !llvm.ptr, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: !llvm.ptr, %arg19: !llvm.ptr, %arg20: i64, %arg21: i64, %arg22: i64, %arg23: !llvm.ptr, %arg24: !llvm.ptr, %arg25: i64, %arg26: i64, %arg27: i64, %arg28: i64, %arg29: i64, %arg30: !llvm.ptr, %arg31: !llvm.ptr, %arg32: i64, %arg33: i64, %arg34: i64, %arg35: i64, %arg36: i64) -> !llvm.ptr attributes {passthrough = ["presplitcoroutine"], sym_visibility = "private"} {
    %0 = llvm.mlir.constant(false) : i1
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(0 : i32) : i32
    %4 = llvm.call @mlirAsyncRuntimeCreateToken() : () -> !llvm.ptr
    %5 = llvm.mlir.zero : !llvm.ptr
    %6 = llvm.intr.coro.id %3, %5, %5, %5 : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.token
    %7 = llvm.intr.coro.size : i64
    %8 = llvm.intr.coro.align : i64
    %9 = llvm.add %7, %8  : i64
    %10 = llvm.sub %9, %2  : i64
    %11 = llvm.sub %1, %8  : i64
    %12 = llvm.and %10, %11  : i64
    %13 = llvm.call @aligned_alloc(%8, %12) : (i64, i64) -> !llvm.ptr
    %14 = llvm.intr.coro.begin %6, %13 : (!llvm.token, !llvm.ptr) -> !llvm.ptr
    %15 = llvm.intr.coro.save %14 : (!llvm.ptr) -> !llvm.token
    %16 = llvm.mlir.addressof @__resume : !llvm.ptr
    llvm.call @mlirAsyncRuntimeExecute(%14, %16) : (!llvm.ptr, !llvm.ptr) -> ()
    %17 = llvm.intr.coro.suspend %15, %0 : i8
    %18 = llvm.sext %17 : i8 to i32
    llvm.switch %18 : i32, ^bb3 [
      0: ^bb1,
      1: ^bb2
    ]
  ^bb1:  // pred: ^bb0
    llvm.call @async_dispatch_fn(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31, %arg32, %arg33, %arg34, %arg35, %arg36) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.call @mlirAsyncRuntimeEmplaceToken(%4) : (!llvm.ptr) -> ()
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %19 = llvm.intr.coro.free %6, %14 : (!llvm.token, !llvm.ptr) -> !llvm.ptr
    llvm.call @free(%19) : (!llvm.ptr) -> ()
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb0, ^bb2
    %20 = llvm.mlir.none : !llvm.token
    %21 = llvm.intr.coro.end %14, %0, %20 : (!llvm.ptr, i1, !llvm.token) -> i1
    llvm.return %4 : !llvm.ptr
  }
  llvm.func @mlirAsyncRuntimeAddRef(!llvm.ptr, i64) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeDropRef(!llvm.ptr, i64) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeCreateToken() -> !llvm.ptr attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeCreateValue(i64) -> !llvm.ptr attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeCreateGroup(i64) -> !llvm.ptr attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeEmplaceToken(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeEmplaceValue(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeSetTokenError(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeSetValueError(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeIsTokenError(!llvm.ptr) -> i1 attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeIsValueError(!llvm.ptr) -> i1 attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeIsGroupError(!llvm.ptr) -> i1 attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitToken(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitValue(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitAllInGroup(!llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeExecute(!llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeGetValueStorage(!llvm.ptr) -> !llvm.ptr attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAddTokenToGroup(!llvm.ptr, !llvm.ptr) -> i64 attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitTokenAndExecute(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitValueAndExecute(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimeAwaitAllInGroupAndExecute(!llvm.ptr, !llvm.ptr, !llvm.ptr) attributes {sym_visibility = "private"}
  llvm.func @mlirAsyncRuntimGetNumWorkerThreads() -> i64 attributes {sym_visibility = "private"}
  llvm.func @__resume(%arg0: !llvm.ptr) attributes {sym_visibility = "private"} {
    llvm.intr.coro.resume %arg0 : !llvm.ptr
    llvm.return
  }
}


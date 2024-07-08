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
    %9 = llvm.mlir.constant(32 : index) : i64
    %10 = llvm.mlir.constant(1000 : index) : i64
    %11 = llvm.mlir.constant(100 : index) : i64
    %12 = llvm.mlir.constant(512 : index) : i64
    %13 = llvm.mlir.constant(1.700000e+00 : f64) : f64
    %14 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %15 = llvm.mlir.zero : !llvm.ptr
    %16 = llvm.getelementptr %15[13] : (!llvm.ptr) -> !llvm.ptr, i64
    %17 = llvm.ptrtoint %16 : !llvm.ptr to i64
    %18 = llvm.call @malloc(%17) : (i64) -> !llvm.ptr
    %19 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %20 = llvm.insertvalue %18, %19[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %21 = llvm.insertvalue %18, %20[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %22 = llvm.insertvalue %5, %21[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %23 = llvm.insertvalue %3, %22[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %24 = llvm.insertvalue %6, %23[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %25 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %24, %25 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_sizes_2D_f64(%7, %5, %4, %6, %4, %6, %25, %8) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr, i32) -> ()
    %26 = llvm.load %18 : !llvm.ptr -> i64
    %27 = llvm.getelementptr %18[1] : (!llvm.ptr) -> !llvm.ptr, i64
    %28 = llvm.load %27 : !llvm.ptr -> i64
    %29 = llvm.getelementptr %18[2] : (!llvm.ptr) -> !llvm.ptr, i64
    %30 = llvm.load %29 : !llvm.ptr -> i64
    %31 = llvm.getelementptr %18[3] : (!llvm.ptr) -> !llvm.ptr, i64
    %32 = llvm.load %31 : !llvm.ptr -> i64
    %33 = llvm.getelementptr %18[4] : (!llvm.ptr) -> !llvm.ptr, i64
    %34 = llvm.load %33 : !llvm.ptr -> i64
    %35 = llvm.getelementptr %18[5] : (!llvm.ptr) -> !llvm.ptr, i64
    %36 = llvm.load %35 : !llvm.ptr -> i64
    %37 = llvm.getelementptr %18[6] : (!llvm.ptr) -> !llvm.ptr, i64
    %38 = llvm.load %37 : !llvm.ptr -> i64
    %39 = llvm.getelementptr %18[7] : (!llvm.ptr) -> !llvm.ptr, i64
    %40 = llvm.load %39 : !llvm.ptr -> i64
    %41 = llvm.getelementptr %18[8] : (!llvm.ptr) -> !llvm.ptr, i64
    %42 = llvm.load %41 : !llvm.ptr -> i64
    %43 = llvm.getelementptr %18[9] : (!llvm.ptr) -> !llvm.ptr, i64
    %44 = llvm.load %43 : !llvm.ptr -> i64
    %45 = llvm.getelementptr %18[10] : (!llvm.ptr) -> !llvm.ptr, i64
    %46 = llvm.load %45 : !llvm.ptr -> i64
    %47 = llvm.mlir.zero : !llvm.ptr
    %48 = llvm.getelementptr %47[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %49 = llvm.ptrtoint %48 : !llvm.ptr to i64
    %50 = llvm.call @malloc(%49) : (i64) -> !llvm.ptr
    %51 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %52 = llvm.insertvalue %50, %51[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %53 = llvm.insertvalue %50, %52[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %54 = llvm.insertvalue %5, %53[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %55 = llvm.insertvalue %26, %54[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %56 = llvm.insertvalue %6, %55[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb1(%5 : i64)
  ^bb1(%57: i64):  // 2 preds: ^bb0, ^bb2
    %58 = llvm.icmp "slt" %57, %26 : i64
    llvm.cond_br %58, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %59 = llvm.getelementptr %50[%57] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %59 : i64, !llvm.ptr
    %60 = llvm.add %57, %6  : i64
    llvm.br ^bb1(%60 : i64)
  ^bb3:  // pred: ^bb1
    %61 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %56, %61 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %62 = llvm.mlir.zero : !llvm.ptr
    %63 = llvm.getelementptr %62[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %64 = llvm.ptrtoint %63 : !llvm.ptr to i64
    %65 = llvm.call @malloc(%64) : (i64) -> !llvm.ptr
    %66 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %67 = llvm.insertvalue %65, %66[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %68 = llvm.insertvalue %65, %67[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %69 = llvm.insertvalue %5, %68[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %70 = llvm.insertvalue %28, %69[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %71 = llvm.insertvalue %6, %70[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb4(%5 : i64)
  ^bb4(%72: i64):  // 2 preds: ^bb3, ^bb5
    %73 = llvm.icmp "slt" %72, %28 : i64
    llvm.cond_br %73, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    %74 = llvm.getelementptr %65[%72] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %74 : i64, !llvm.ptr
    %75 = llvm.add %72, %6  : i64
    llvm.br ^bb4(%75 : i64)
  ^bb6:  // pred: ^bb4
    %76 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %71, %76 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %77 = llvm.mlir.zero : !llvm.ptr
    %78 = llvm.getelementptr %77[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %79 = llvm.ptrtoint %78 : !llvm.ptr to i64
    %80 = llvm.call @malloc(%79) : (i64) -> !llvm.ptr
    %81 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %82 = llvm.insertvalue %80, %81[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %83 = llvm.insertvalue %80, %82[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %84 = llvm.insertvalue %5, %83[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %85 = llvm.insertvalue %30, %84[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %86 = llvm.insertvalue %6, %85[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb7(%5 : i64)
  ^bb7(%87: i64):  // 2 preds: ^bb6, ^bb8
    %88 = llvm.icmp "slt" %87, %30 : i64
    llvm.cond_br %88, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %89 = llvm.getelementptr %80[%87] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %89 : i64, !llvm.ptr
    %90 = llvm.add %87, %6  : i64
    llvm.br ^bb7(%90 : i64)
  ^bb9:  // pred: ^bb7
    %91 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %86, %91 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %92 = llvm.mlir.zero : !llvm.ptr
    %93 = llvm.getelementptr %92[%32] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %94 = llvm.ptrtoint %93 : !llvm.ptr to i64
    %95 = llvm.call @malloc(%94) : (i64) -> !llvm.ptr
    %96 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %97 = llvm.insertvalue %95, %96[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %98 = llvm.insertvalue %95, %97[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %99 = llvm.insertvalue %5, %98[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %100 = llvm.insertvalue %32, %99[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %101 = llvm.insertvalue %6, %100[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb10(%5 : i64)
  ^bb10(%102: i64):  // 2 preds: ^bb9, ^bb11
    %103 = llvm.icmp "slt" %102, %32 : i64
    llvm.cond_br %103, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %104 = llvm.getelementptr %95[%102] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %104 : i64, !llvm.ptr
    %105 = llvm.add %102, %6  : i64
    llvm.br ^bb10(%105 : i64)
  ^bb12:  // pred: ^bb10
    %106 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %101, %106 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %107 = llvm.mlir.zero : !llvm.ptr
    %108 = llvm.getelementptr %107[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %109 = llvm.ptrtoint %108 : !llvm.ptr to i64
    %110 = llvm.call @malloc(%109) : (i64) -> !llvm.ptr
    %111 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %112 = llvm.insertvalue %110, %111[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %113 = llvm.insertvalue %110, %112[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %114 = llvm.insertvalue %5, %113[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %115 = llvm.insertvalue %34, %114[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %116 = llvm.insertvalue %6, %115[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb13(%5 : i64)
  ^bb13(%117: i64):  // 2 preds: ^bb12, ^bb14
    %118 = llvm.icmp "slt" %117, %34 : i64
    llvm.cond_br %118, ^bb14, ^bb15
  ^bb14:  // pred: ^bb13
    %119 = llvm.getelementptr %110[%117] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %119 : i64, !llvm.ptr
    %120 = llvm.add %117, %6  : i64
    llvm.br ^bb13(%120 : i64)
  ^bb15:  // pred: ^bb13
    %121 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %116, %121 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %122 = llvm.mlir.zero : !llvm.ptr
    %123 = llvm.getelementptr %122[%36] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %124 = llvm.ptrtoint %123 : !llvm.ptr to i64
    %125 = llvm.call @malloc(%124) : (i64) -> !llvm.ptr
    %126 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %127 = llvm.insertvalue %125, %126[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %128 = llvm.insertvalue %125, %127[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %129 = llvm.insertvalue %5, %128[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %130 = llvm.insertvalue %36, %129[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %131 = llvm.insertvalue %6, %130[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb16(%5 : i64)
  ^bb16(%132: i64):  // 2 preds: ^bb15, ^bb17
    %133 = llvm.icmp "slt" %132, %36 : i64
    llvm.cond_br %133, ^bb17, ^bb18
  ^bb17:  // pred: ^bb16
    %134 = llvm.getelementptr %125[%132] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %134 : i64, !llvm.ptr
    %135 = llvm.add %132, %6  : i64
    llvm.br ^bb16(%135 : i64)
  ^bb18:  // pred: ^bb16
    %136 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %131, %136 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %137 = llvm.mlir.zero : !llvm.ptr
    %138 = llvm.getelementptr %137[%38] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %139 = llvm.ptrtoint %138 : !llvm.ptr to i64
    %140 = llvm.call @malloc(%139) : (i64) -> !llvm.ptr
    %141 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %142 = llvm.insertvalue %140, %141[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %143 = llvm.insertvalue %140, %142[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %144 = llvm.insertvalue %5, %143[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %145 = llvm.insertvalue %38, %144[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %146 = llvm.insertvalue %6, %145[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb19(%5 : i64)
  ^bb19(%147: i64):  // 2 preds: ^bb18, ^bb20
    %148 = llvm.icmp "slt" %147, %38 : i64
    llvm.cond_br %148, ^bb20, ^bb21
  ^bb20:  // pred: ^bb19
    %149 = llvm.getelementptr %140[%147] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %149 : i64, !llvm.ptr
    %150 = llvm.add %147, %6  : i64
    llvm.br ^bb19(%150 : i64)
  ^bb21:  // pred: ^bb19
    %151 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %146, %151 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %152 = llvm.mlir.zero : !llvm.ptr
    %153 = llvm.getelementptr %152[%40] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    %154 = llvm.ptrtoint %153 : !llvm.ptr to i64
    %155 = llvm.call @malloc(%154) : (i64) -> !llvm.ptr
    %156 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %157 = llvm.insertvalue %155, %156[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %158 = llvm.insertvalue %155, %157[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %159 = llvm.insertvalue %5, %158[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %160 = llvm.insertvalue %40, %159[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %161 = llvm.insertvalue %6, %160[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb22(%5 : i64)
  ^bb22(%162: i64):  // 2 preds: ^bb21, ^bb23
    %163 = llvm.icmp "slt" %162, %40 : i64
    llvm.cond_br %163, ^bb23, ^bb24
  ^bb23:  // pred: ^bb22
    %164 = llvm.getelementptr %155[%162] : (!llvm.ptr, i64) -> !llvm.ptr, i64
    llvm.store %5, %164 : i64, !llvm.ptr
    %165 = llvm.add %162, %6  : i64
    llvm.br ^bb22(%165 : i64)
  ^bb24:  // pred: ^bb22
    %166 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %161, %166 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    %167 = llvm.mlir.zero : !llvm.ptr
    %168 = llvm.getelementptr %167[%42] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %169 = llvm.ptrtoint %168 : !llvm.ptr to i64
    %170 = llvm.call @malloc(%169) : (i64) -> !llvm.ptr
    %171 = llvm.mlir.undef : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>
    %172 = llvm.insertvalue %170, %171[0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %173 = llvm.insertvalue %170, %172[1] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %174 = llvm.insertvalue %5, %173[2] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %175 = llvm.insertvalue %42, %174[3, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    %176 = llvm.insertvalue %6, %175[4, 0] : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> 
    llvm.br ^bb25(%5 : i64)
  ^bb25(%177: i64):  // 2 preds: ^bb24, ^bb26
    %178 = llvm.icmp "slt" %177, %42 : i64
    llvm.cond_br %178, ^bb26, ^bb27
  ^bb26:  // pred: ^bb25
    %179 = llvm.getelementptr %170[%177] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %14, %179 : f64, !llvm.ptr
    %180 = llvm.add %177, %6  : i64
    llvm.br ^bb25(%180 : i64)
  ^bb27:  // pred: ^bb25
    %181 = llvm.alloca %6 x !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)> : (i64) -> !llvm.ptr
    llvm.store %176, %181 : !llvm.struct<(ptr, ptr, i64, array<1 x i64>, array<1 x i64>)>, !llvm.ptr
    llvm.call @read_input_2D_f64(%7, %5, %4, %6, %4, %6, %61, %6, %76, %6, %91, %6, %106, %6, %121, %6, %136, %6, %151, %6, %166, %6, %181, %8) {filename = "SPARSE_FILE_NAME0"} : (i32, i64, i64, i64, i64, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i64, !llvm.ptr, i32) -> ()
    %182 = llvm.mul %46, %12  : i64
    %183 = llvm.mlir.zero : !llvm.ptr
    %184 = llvm.getelementptr %183[%182] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %185 = llvm.ptrtoint %184 : !llvm.ptr to i64
    %186 = llvm.add %185, %9  : i64
    %187 = llvm.call @malloc(%186) : (i64) -> !llvm.ptr
    %188 = llvm.ptrtoint %187 : !llvm.ptr to i64
    %189 = llvm.sub %9, %6  : i64
    %190 = llvm.add %188, %189  : i64
    %191 = llvm.urem %190, %9  : i64
    %192 = llvm.sub %190, %191  : i64
    %193 = llvm.inttoptr %192 : i64 to !llvm.ptr
    %194 = llvm.mul %44, %12  : i64
    %195 = llvm.mlir.zero : !llvm.ptr
    %196 = llvm.getelementptr %195[%194] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %197 = llvm.ptrtoint %196 : !llvm.ptr to i64
    %198 = llvm.add %197, %9  : i64
    %199 = llvm.call @malloc(%198) : (i64) -> !llvm.ptr
    %200 = llvm.ptrtoint %199 : !llvm.ptr to i64
    %201 = llvm.sub %9, %6  : i64
    %202 = llvm.add %200, %201  : i64
    %203 = llvm.urem %202, %9  : i64
    %204 = llvm.sub %202, %203  : i64
    %205 = llvm.inttoptr %204 : i64 to !llvm.ptr
    llvm.br ^bb28(%5 : i64)
  ^bb28(%206: i64):  // 2 preds: ^bb27, ^bb32
    %207 = llvm.icmp "slt" %206, %46 : i64
    llvm.cond_br %207, ^bb29, ^bb33
  ^bb29:  // pred: ^bb28
    llvm.br ^bb30(%5 : i64)
  ^bb30(%208: i64):  // 2 preds: ^bb29, ^bb31
    %209 = llvm.icmp "slt" %208, %12 : i64
    llvm.cond_br %209, ^bb31, ^bb32
  ^bb31:  // pred: ^bb30
    %210 = llvm.mul %206, %12  : i64
    %211 = llvm.add %210, %208  : i64
    %212 = llvm.getelementptr %193[%211] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %13, %212 : f64, !llvm.ptr
    %213 = llvm.add %208, %6  : i64
    llvm.br ^bb30(%213 : i64)
  ^bb32:  // pred: ^bb30
    %214 = llvm.add %206, %6  : i64
    llvm.br ^bb28(%214 : i64)
  ^bb33:  // pred: ^bb28
    llvm.br ^bb34(%5 : i64)
  ^bb34(%215: i64):  // 2 preds: ^bb33, ^bb38
    %216 = llvm.icmp "slt" %215, %44 : i64
    llvm.cond_br %216, ^bb35, ^bb39
  ^bb35:  // pred: ^bb34
    llvm.br ^bb36(%5 : i64)
  ^bb36(%217: i64):  // 2 preds: ^bb35, ^bb37
    %218 = llvm.icmp "slt" %217, %12 : i64
    llvm.cond_br %218, ^bb37, ^bb38
  ^bb37:  // pred: ^bb36
    %219 = llvm.mul %215, %12  : i64
    %220 = llvm.add %219, %217  : i64
    %221 = llvm.getelementptr %205[%220] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %14, %221 : f64, !llvm.ptr
    %222 = llvm.add %217, %6  : i64
    llvm.br ^bb36(%222 : i64)
  ^bb38:  // pred: ^bb36
    %223 = llvm.add %215, %6  : i64
    llvm.br ^bb34(%223 : i64)
  ^bb39:  // pred: ^bb34
    llvm.br ^bb40(%5 : i64)
  ^bb40(%224: i64):  // 2 preds: ^bb39, ^bb47
    %225 = llvm.icmp "slt" %224, %11 : i64
    llvm.cond_br %225, ^bb41, ^bb48
  ^bb41:  // pred: ^bb40
    %226 = llvm.call @getTime() : () -> f64
    %227 = llvm.load %50 : !llvm.ptr -> i64
    %228 = llvm.icmp "eq" %227, %5 : i64
    llvm.cond_br %228, ^bb42, ^bb43
  ^bb42:  // 3 preds: ^bb41, ^bb44, ^bb46
    llvm.br ^bb47
  ^bb43:  // pred: ^bb41
    %229 = llvm.select %2, %4, %6 : i1, i64
    %230 = llvm.add %229, %227  : i64
    %231 = llvm.sdiv %230, %9  : i64
    %232 = llvm.add %231, %6  : i64
    %233 = llvm.sub %5, %227  : i64
    %234 = llvm.sdiv %233, %9  : i64
    %235 = llvm.sub %5, %234  : i64
    %236 = llvm.icmp "slt" %227, %5 : i64
    %237 = llvm.icmp "sgt" %227, %5 : i64
    %238 = llvm.and %236, %1  : i1
    %239 = llvm.and %237, %2  : i1
    %240 = llvm.or %238, %239  : i1
    %241 = llvm.select %240, %232, %235 : i1, i64
    %242 = llvm.intr.smax(%241, %10)  : (i64, i64) -> i64
    %243 = llvm.intr.smin(%227, %242)  : (i64, i64) -> i64
    %244 = llvm.icmp "sgt" %243, %5 : i64
    %245 = llvm.select %244, %4, %6 : i1, i64
    %246 = llvm.add %245, %227  : i64
    %247 = llvm.sdiv %246, %243  : i64
    %248 = llvm.add %247, %6  : i64
    %249 = llvm.sub %5, %227  : i64
    %250 = llvm.sdiv %249, %243  : i64
    %251 = llvm.sub %5, %250  : i64
    %252 = llvm.icmp "slt" %227, %5 : i64
    %253 = llvm.icmp "sgt" %227, %5 : i64
    %254 = llvm.icmp "slt" %243, %5 : i64
    %255 = llvm.icmp "sgt" %243, %5 : i64
    %256 = llvm.and %252, %254  : i1
    %257 = llvm.and %253, %255  : i1
    %258 = llvm.or %256, %257  : i1
    %259 = llvm.select %258, %248, %251 : i1, i64
    %260 = llvm.icmp "eq" %259, %6 : i64
    llvm.cond_br %260, ^bb44, ^bb45
  ^bb44:  // pred: ^bb43
    llvm.call @parallel_compute_fn(%5, %243, %227, %5, %227, %6, %110, %110, %5, %34, %6, %125, %125, %5, %36, %6, %170, %170, %5, %42, %6, %187, %193, %5, %46, %12, %12, %6, %199, %205, %5, %44, %12, %12, %6) : (i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.br ^bb42
  ^bb45:  // pred: ^bb43
    %261 = llvm.sub %259, %6  : i64
    %262 = llvm.call @mlirAsyncRuntimeCreateGroup(%261) : (i64) -> !llvm.ptr
    llvm.call @mlirAsyncRuntimeAddRef(%262, %0) : (!llvm.ptr, i64) -> ()
    llvm.call @async_dispatch_fn(%262, %5, %259, %243, %227, %5, %227, %6, %110, %110, %5, %34, %6, %125, %125, %5, %36, %6, %170, %170, %5, %42, %6, %187, %193, %5, %46, %12, %12, %6, %199, %205, %5, %44, %12, %12, %6) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.call @mlirAsyncRuntimeAwaitAllInGroup(%262) : (!llvm.ptr) -> ()
    %263 = llvm.call @mlirAsyncRuntimeIsGroupError(%262) : (!llvm.ptr) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%262, %0) : (!llvm.ptr, i64) -> ()
    %264 = llvm.xor %263, %2  : i1
    llvm.cond_br %264, ^bb46, ^bb49
  ^bb46:  // pred: ^bb45
    llvm.br ^bb42
  ^bb47:  // pred: ^bb42
    %265 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%226, %265) : (f64, f64) -> ()
    %266 = llvm.add %224, %6  : i64
    llvm.br ^bb40(%266 : i64)
  ^bb48:  // pred: ^bb40
    llvm.return
  ^bb49:  // pred: ^bb45
    %267 = llvm.mlir.addressof @assert_msg : !llvm.ptr
    llvm.call @puts(%267) : (!llvm.ptr) -> ()
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
    %2 = llvm.mlir.constant(512 : index) : i64
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


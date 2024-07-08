module {
  llvm.func @abort()
  llvm.func @puts(!llvm.ptr)
  llvm.mlir.global private constant @assert_msg(dense<[65, 119, 97, 105, 116, 101, 100, 32, 97, 115, 121, 110, 99, 32, 111, 112, 101, 114, 97, 110, 100, 32, 105, 115, 32, 105, 110, 32, 101, 114, 114, 111, 114, 32, 115, 116, 97, 116, 101, 0]> : tensor<40xi8>) {addr_space = 0 : i32} : !llvm.array<40 x i8>
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @free(!llvm.ptr)
  llvm.func @aligned_alloc(i64, i64) -> !llvm.ptr
  llvm.func @main() {
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(32 : index) : i64
    %3 = llvm.mlir.constant(2.200000e+00 : f64) : f64
    %4 = llvm.mlir.constant(3.400000e+00 : f64) : f64
    %5 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %6 = llvm.mlir.constant(0 : index) : i64
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.mlir.constant(8000 : index) : i64
    %9 = llvm.mlir.constant(4000 : index) : i64
    %10 = llvm.mlir.constant(200 : index) : i64
    %11 = llvm.mlir.constant(100 : index) : i64
    %12 = llvm.mlir.constant(false) : i1
    %13 = llvm.mlir.constant(1000 : index) : i64
    %14 = llvm.mlir.constant(8 : index) : i64
    %15 = llvm.mlir.constant(7 : index) : i64
    %16 = llvm.mlir.zero : !llvm.ptr
    %17 = llvm.getelementptr %16[32000000] : (!llvm.ptr) -> !llvm.ptr, f64
    %18 = llvm.ptrtoint %17 : !llvm.ptr to i64
    %19 = llvm.add %18, %2  : i64
    %20 = llvm.call @malloc(%19) : (i64) -> !llvm.ptr
    %21 = llvm.ptrtoint %20 : !llvm.ptr to i64
    %22 = llvm.sub %2, %7  : i64
    %23 = llvm.add %21, %22  : i64
    %24 = llvm.urem %23, %2  : i64
    %25 = llvm.sub %23, %24  : i64
    %26 = llvm.inttoptr %25 : i64 to !llvm.ptr
    %27 = llvm.mlir.zero : !llvm.ptr
    %28 = llvm.getelementptr %27[800000] : (!llvm.ptr) -> !llvm.ptr, f64
    %29 = llvm.ptrtoint %28 : !llvm.ptr to i64
    %30 = llvm.add %29, %2  : i64
    %31 = llvm.call @malloc(%30) : (i64) -> !llvm.ptr
    %32 = llvm.ptrtoint %31 : !llvm.ptr to i64
    %33 = llvm.sub %2, %7  : i64
    %34 = llvm.add %32, %33  : i64
    %35 = llvm.urem %34, %2  : i64
    %36 = llvm.sub %34, %35  : i64
    %37 = llvm.inttoptr %36 : i64 to !llvm.ptr
    %38 = llvm.mlir.zero : !llvm.ptr
    %39 = llvm.getelementptr %38[1600000] : (!llvm.ptr) -> !llvm.ptr, f64
    %40 = llvm.ptrtoint %39 : !llvm.ptr to i64
    %41 = llvm.add %40, %2  : i64
    %42 = llvm.call @malloc(%41) : (i64) -> !llvm.ptr
    %43 = llvm.ptrtoint %42 : !llvm.ptr to i64
    %44 = llvm.sub %2, %7  : i64
    %45 = llvm.add %43, %44  : i64
    %46 = llvm.urem %45, %2  : i64
    %47 = llvm.sub %45, %46  : i64
    %48 = llvm.inttoptr %47 : i64 to !llvm.ptr
    llvm.br ^bb1(%6 : i64)
  ^bb1(%49: i64):  // 2 preds: ^bb0, ^bb5
    %50 = llvm.icmp "slt" %49, %8 : i64
    llvm.cond_br %50, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%6 : i64)
  ^bb3(%51: i64):  // 2 preds: ^bb2, ^bb4
    %52 = llvm.icmp "slt" %51, %9 : i64
    llvm.cond_br %52, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %53 = llvm.mul %49, %9  : i64
    %54 = llvm.add %53, %51  : i64
    %55 = llvm.getelementptr %26[%54] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %3, %55 : f64, !llvm.ptr
    %56 = llvm.add %51, %7  : i64
    llvm.br ^bb3(%56 : i64)
  ^bb5:  // pred: ^bb3
    %57 = llvm.add %49, %7  : i64
    llvm.br ^bb1(%57 : i64)
  ^bb6:  // pred: ^bb1
    llvm.br ^bb7(%6 : i64)
  ^bb7(%58: i64):  // 2 preds: ^bb6, ^bb11
    %59 = llvm.icmp "slt" %58, %9 : i64
    llvm.cond_br %59, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%6 : i64)
  ^bb9(%60: i64):  // 2 preds: ^bb8, ^bb10
    %61 = llvm.icmp "slt" %60, %10 : i64
    llvm.cond_br %61, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %62 = llvm.mul %58, %10  : i64
    %63 = llvm.add %62, %60  : i64
    %64 = llvm.getelementptr %37[%63] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %64 : f64, !llvm.ptr
    %65 = llvm.add %60, %7  : i64
    llvm.br ^bb9(%65 : i64)
  ^bb11:  // pred: ^bb9
    %66 = llvm.add %58, %7  : i64
    llvm.br ^bb7(%66 : i64)
  ^bb12:  // pred: ^bb7
    llvm.br ^bb13(%6 : i64)
  ^bb13(%67: i64):  // 2 preds: ^bb12, ^bb17
    %68 = llvm.icmp "slt" %67, %8 : i64
    llvm.cond_br %68, ^bb14, ^bb18
  ^bb14:  // pred: ^bb13
    llvm.br ^bb15(%6 : i64)
  ^bb15(%69: i64):  // 2 preds: ^bb14, ^bb16
    %70 = llvm.icmp "slt" %69, %10 : i64
    llvm.cond_br %70, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    %71 = llvm.mul %67, %10  : i64
    %72 = llvm.add %71, %69  : i64
    %73 = llvm.getelementptr %48[%72] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %5, %73 : f64, !llvm.ptr
    %74 = llvm.add %69, %7  : i64
    llvm.br ^bb15(%74 : i64)
  ^bb17:  // pred: ^bb15
    %75 = llvm.add %67, %7  : i64
    llvm.br ^bb13(%75 : i64)
  ^bb18:  // pred: ^bb13
    llvm.br ^bb19(%6 : i64)
  ^bb19(%76: i64):  // 2 preds: ^bb18, ^bb26
    %77 = llvm.icmp "slt" %76, %11 : i64
    llvm.cond_br %77, ^bb20, ^bb27
  ^bb20:  // pred: ^bb19
    %78 = llvm.call @getTime() : () -> f64
    llvm.cond_br %12, ^bb21, ^bb22
  ^bb21:  // 3 preds: ^bb20, ^bb23, ^bb25
    llvm.br ^bb26
  ^bb22:  // pred: ^bb20
    llvm.cond_br %12, ^bb23, ^bb24
  ^bb23:  // pred: ^bb22
    llvm.call @parallel_compute_fn(%6, %13, %8, %6, %8, %7, %20, %26, %6, %8, %9, %9, %7, %31, %37, %6, %9, %10, %10, %7, %42, %48, %6, %8, %10, %10, %7) : (i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.br ^bb21
  ^bb24:  // pred: ^bb22
    %79 = llvm.call @mlirAsyncRuntimeCreateGroup(%15) : (i64) -> !llvm.ptr
    llvm.call @mlirAsyncRuntimeAddRef(%79, %1) : (!llvm.ptr, i64) -> ()
    llvm.call @async_dispatch_fn(%79, %6, %14, %13, %8, %6, %8, %7, %20, %26, %6, %8, %9, %9, %7, %31, %37, %6, %9, %10, %10, %7, %42, %48, %6, %8, %10, %10, %7) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.call @mlirAsyncRuntimeAwaitAllInGroup(%79) : (!llvm.ptr) -> ()
    %80 = llvm.call @mlirAsyncRuntimeIsGroupError(%79) : (!llvm.ptr) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%79, %1) : (!llvm.ptr, i64) -> ()
    %81 = llvm.xor %80, %0  : i1
    llvm.cond_br %81, ^bb25, ^bb28
  ^bb25:  // pred: ^bb24
    llvm.br ^bb21
  ^bb26:  // pred: ^bb21
    %82 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%78, %82) : (f64, f64) -> ()
    %83 = llvm.add %76, %7  : i64
    llvm.br ^bb19(%83 : i64)
  ^bb27:  // pred: ^bb19
    llvm.return
  ^bb28:  // pred: ^bb24
    %84 = llvm.mlir.addressof @assert_msg : !llvm.ptr
    llvm.call @puts(%84) : (!llvm.ptr) -> ()
    llvm.call @abort() : () -> ()
    llvm.unreachable
  }
  llvm.func @comet_sort_index(i64, !llvm.ptr, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @getTime() -> f64 attributes {sym_visibility = "private"}
  llvm.func @printElapsedTime(f64, f64) attributes {sym_visibility = "private"}
  llvm.func @parallel_compute_fn(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64, %arg25: i64, %arg26: i64) attributes {sym_visibility = "private"} {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(8000 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(200 : index) : i64
    %4 = llvm.mlir.constant(4000 : index) : i64
    %5 = llvm.mul %arg0, %arg1  : i64
    %6 = llvm.add %5, %arg1  : i64
    %7 = llvm.intr.smin(%6, %1)  : (i64, i64) -> i64
    %8 = llvm.sub %7, %2  : i64
    %9 = llvm.srem %5, %1  : i64
    %10 = llvm.srem %8, %1  : i64
    %11 = llvm.add %10, %2  : i64
    llvm.br ^bb1(%9 : i64)
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb8
    %13 = llvm.icmp "slt" %12, %11 : i64
    llvm.cond_br %13, ^bb2, ^bb9
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%0 : i64)
  ^bb3(%14: i64):  // 2 preds: ^bb2, ^bb7
    %15 = llvm.icmp "slt" %14, %4 : i64
    llvm.cond_br %15, ^bb4, ^bb8
  ^bb4:  // pred: ^bb3
    llvm.br ^bb5(%0 : i64)
  ^bb5(%16: i64):  // 2 preds: ^bb4, ^bb6
    %17 = llvm.icmp "slt" %16, %3 : i64
    llvm.cond_br %17, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    %18 = llvm.mul %12, %4  : i64
    %19 = llvm.add %18, %14  : i64
    %20 = llvm.getelementptr %arg7[%19] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %21 = llvm.load %20 : !llvm.ptr -> f64
    %22 = llvm.mul %14, %3  : i64
    %23 = llvm.add %22, %16  : i64
    %24 = llvm.getelementptr %arg14[%23] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %25 = llvm.load %24 : !llvm.ptr -> f64
    %26 = llvm.mul %12, %3  : i64
    %27 = llvm.add %26, %16  : i64
    %28 = llvm.getelementptr %arg21[%27] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %29 = llvm.load %28 : !llvm.ptr -> f64
    %30 = llvm.fmul %21, %25  : f64
    %31 = llvm.fadd %29, %30  : f64
    %32 = llvm.mul %12, %3  : i64
    %33 = llvm.add %32, %16  : i64
    %34 = llvm.getelementptr %arg21[%33] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %31, %34 : f64, !llvm.ptr
    %35 = llvm.add %16, %2  : i64
    llvm.br ^bb5(%35 : i64)
  ^bb7:  // pred: ^bb5
    %36 = llvm.add %14, %2  : i64
    llvm.br ^bb3(%36 : i64)
  ^bb8:  // pred: ^bb3
    %37 = llvm.add %12, %2  : i64
    llvm.br ^bb1(%37 : i64)
  ^bb9:  // pred: ^bb1
    llvm.return
  }
  llvm.func @async_dispatch_fn(%arg0: !llvm.ptr, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: i64, %arg21: i64, %arg22: !llvm.ptr, %arg23: !llvm.ptr, %arg24: i64, %arg25: i64, %arg26: i64, %arg27: i64, %arg28: i64) attributes {sym_visibility = "private"} {
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
    %12 = llvm.call @async_execute_fn(%arg0, %11, %8, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25, %arg26, %arg27, %arg28) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> !llvm.ptr
    %13 = llvm.call @mlirAsyncRuntimeAddTokenToGroup(%12, %arg0) : (!llvm.ptr, !llvm.ptr) -> i64
    llvm.call @mlirAsyncRuntimeDropRef(%12, %0) : (!llvm.ptr, i64) -> ()
    llvm.br ^bb1(%7, %11 : i64, i64)
  ^bb3:  // pred: ^bb1
    llvm.call @mlirAsyncRuntimeDropRef(%arg0, %0) : (!llvm.ptr, i64) -> ()
    llvm.call @parallel_compute_fn(%arg1, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25, %arg26, %arg27, %arg28) : (i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.return
  }
  llvm.func @async_execute_fn(%arg0: !llvm.ptr, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: i64, %arg21: i64, %arg22: !llvm.ptr, %arg23: !llvm.ptr, %arg24: i64, %arg25: i64, %arg26: i64, %arg27: i64, %arg28: i64) -> !llvm.ptr attributes {passthrough = ["presplitcoroutine"], sym_visibility = "private"} {
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
    llvm.call @async_dispatch_fn(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25, %arg26, %arg27, %arg28) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
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


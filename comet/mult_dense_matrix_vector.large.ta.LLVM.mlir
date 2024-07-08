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
    %2 = llvm.mlir.constant(1280000000 : index) : i64
    %3 = llvm.mlir.constant(2.300000e+00 : f64) : f64
    %4 = llvm.mlir.constant(3.700000e+00 : f64) : f64
    %5 = llvm.mlir.constant(0.000000e+00 : f64) : f64
    %6 = llvm.mlir.constant(0 : index) : i64
    %7 = llvm.mlir.constant(1 : index) : i64
    %8 = llvm.mlir.constant(80000 : index) : i64
    %9 = llvm.mlir.constant(16000 : index) : i64
    %10 = llvm.mlir.constant(100 : index) : i64
    %11 = llvm.mlir.constant(false) : i1
    %12 = llvm.mlir.constant(2500 : index) : i64
    %13 = llvm.mlir.constant(32 : index) : i64
    %14 = llvm.mlir.constant(31 : index) : i64
    %15 = llvm.mlir.zero : !llvm.ptr
    %16 = llvm.getelementptr %15[%2] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %17 = llvm.ptrtoint %16 : !llvm.ptr to i64
    %18 = llvm.add %17, %13  : i64
    %19 = llvm.call @malloc(%18) : (i64) -> !llvm.ptr
    %20 = llvm.ptrtoint %19 : !llvm.ptr to i64
    %21 = llvm.sub %13, %7  : i64
    %22 = llvm.add %20, %21  : i64
    %23 = llvm.urem %22, %13  : i64
    %24 = llvm.sub %22, %23  : i64
    %25 = llvm.inttoptr %24 : i64 to !llvm.ptr
    %26 = llvm.mlir.zero : !llvm.ptr
    %27 = llvm.getelementptr %26[16000] : (!llvm.ptr) -> !llvm.ptr, f64
    %28 = llvm.ptrtoint %27 : !llvm.ptr to i64
    %29 = llvm.add %28, %13  : i64
    %30 = llvm.call @malloc(%29) : (i64) -> !llvm.ptr
    %31 = llvm.ptrtoint %30 : !llvm.ptr to i64
    %32 = llvm.sub %13, %7  : i64
    %33 = llvm.add %31, %32  : i64
    %34 = llvm.urem %33, %13  : i64
    %35 = llvm.sub %33, %34  : i64
    %36 = llvm.inttoptr %35 : i64 to !llvm.ptr
    %37 = llvm.mlir.zero : !llvm.ptr
    %38 = llvm.getelementptr %37[80000] : (!llvm.ptr) -> !llvm.ptr, f64
    %39 = llvm.ptrtoint %38 : !llvm.ptr to i64
    %40 = llvm.add %39, %13  : i64
    %41 = llvm.call @malloc(%40) : (i64) -> !llvm.ptr
    %42 = llvm.ptrtoint %41 : !llvm.ptr to i64
    %43 = llvm.sub %13, %7  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.urem %44, %13  : i64
    %46 = llvm.sub %44, %45  : i64
    %47 = llvm.inttoptr %46 : i64 to !llvm.ptr
    llvm.br ^bb1(%6 : i64)
  ^bb1(%48: i64):  // 2 preds: ^bb0, ^bb5
    %49 = llvm.icmp "slt" %48, %8 : i64
    llvm.cond_br %49, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%6 : i64)
  ^bb3(%50: i64):  // 2 preds: ^bb2, ^bb4
    %51 = llvm.icmp "slt" %50, %9 : i64
    llvm.cond_br %51, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %52 = llvm.mul %48, %9  : i64
    %53 = llvm.add %52, %50  : i64
    %54 = llvm.getelementptr %25[%53] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %3, %54 : f64, !llvm.ptr
    %55 = llvm.add %50, %7  : i64
    llvm.br ^bb3(%55 : i64)
  ^bb5:  // pred: ^bb3
    %56 = llvm.add %48, %7  : i64
    llvm.br ^bb1(%56 : i64)
  ^bb6:  // pred: ^bb1
    llvm.br ^bb7(%6 : i64)
  ^bb7(%57: i64):  // 2 preds: ^bb6, ^bb8
    %58 = llvm.icmp "slt" %57, %9 : i64
    llvm.cond_br %58, ^bb8, ^bb9
  ^bb8:  // pred: ^bb7
    %59 = llvm.getelementptr %36[%57] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %59 : f64, !llvm.ptr
    %60 = llvm.add %57, %7  : i64
    llvm.br ^bb7(%60 : i64)
  ^bb9:  // pred: ^bb7
    llvm.br ^bb10(%6 : i64)
  ^bb10(%61: i64):  // 2 preds: ^bb9, ^bb11
    %62 = llvm.icmp "slt" %61, %8 : i64
    llvm.cond_br %62, ^bb11, ^bb12
  ^bb11:  // pred: ^bb10
    %63 = llvm.getelementptr %47[%61] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %5, %63 : f64, !llvm.ptr
    %64 = llvm.add %61, %7  : i64
    llvm.br ^bb10(%64 : i64)
  ^bb12:  // pred: ^bb10
    llvm.br ^bb13(%6 : i64)
  ^bb13(%65: i64):  // 2 preds: ^bb12, ^bb20
    %66 = llvm.icmp "slt" %65, %10 : i64
    llvm.cond_br %66, ^bb14, ^bb21
  ^bb14:  // pred: ^bb13
    %67 = llvm.call @getTime() : () -> f64
    llvm.cond_br %11, ^bb15, ^bb16
  ^bb15:  // 3 preds: ^bb14, ^bb17, ^bb19
    llvm.br ^bb20
  ^bb16:  // pred: ^bb14
    llvm.cond_br %11, ^bb17, ^bb18
  ^bb17:  // pred: ^bb16
    llvm.call @parallel_compute_fn(%6, %12, %8, %6, %8, %7, %19, %25, %6, %8, %9, %9, %7, %30, %36, %6, %9, %7, %41, %47, %6, %8, %7) : (i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> ()
    llvm.br ^bb15
  ^bb18:  // pred: ^bb16
    %68 = llvm.call @mlirAsyncRuntimeCreateGroup(%14) : (i64) -> !llvm.ptr
    llvm.call @mlirAsyncRuntimeAddRef(%68, %1) : (!llvm.ptr, i64) -> ()
    llvm.call @async_dispatch_fn(%68, %6, %13, %12, %8, %6, %8, %7, %19, %25, %6, %8, %9, %9, %7, %30, %36, %6, %9, %7, %41, %47, %6, %8, %7) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> ()
    llvm.call @mlirAsyncRuntimeAwaitAllInGroup(%68) : (!llvm.ptr) -> ()
    %69 = llvm.call @mlirAsyncRuntimeIsGroupError(%68) : (!llvm.ptr) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%68, %1) : (!llvm.ptr, i64) -> ()
    %70 = llvm.xor %69, %0  : i1
    llvm.cond_br %70, ^bb19, ^bb22
  ^bb19:  // pred: ^bb18
    llvm.br ^bb15
  ^bb20:  // pred: ^bb15
    %71 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%67, %71) : (f64, f64) -> ()
    %72 = llvm.add %65, %7  : i64
    llvm.br ^bb13(%72 : i64)
  ^bb21:  // pred: ^bb13
    llvm.return
  ^bb22:  // pred: ^bb18
    %73 = llvm.mlir.addressof @assert_msg : !llvm.ptr
    llvm.call @puts(%73) : (!llvm.ptr) -> ()
    llvm.call @abort() : () -> ()
    llvm.unreachable
  }
  llvm.func @comet_sort_index(i64, !llvm.ptr, i64, i64) attributes {sym_visibility = "private"}
  llvm.func @getTime() -> f64 attributes {sym_visibility = "private"}
  llvm.func @printElapsedTime(f64, f64) attributes {sym_visibility = "private"}
  llvm.func @parallel_compute_fn(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: !llvm.ptr, %arg7: !llvm.ptr, %arg8: i64, %arg9: i64, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: !llvm.ptr, %arg14: !llvm.ptr, %arg15: i64, %arg16: i64, %arg17: i64, %arg18: !llvm.ptr, %arg19: !llvm.ptr, %arg20: i64, %arg21: i64, %arg22: i64) attributes {sym_visibility = "private"} {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(80000 : index) : i64
    %2 = llvm.mlir.constant(1 : index) : i64
    %3 = llvm.mlir.constant(16000 : index) : i64
    %4 = llvm.mul %arg0, %arg1  : i64
    %5 = llvm.add %4, %arg1  : i64
    %6 = llvm.intr.smin(%5, %1)  : (i64, i64) -> i64
    %7 = llvm.sub %6, %2  : i64
    %8 = llvm.srem %4, %1  : i64
    %9 = llvm.srem %7, %1  : i64
    %10 = llvm.add %9, %2  : i64
    llvm.br ^bb1(%8 : i64)
  ^bb1(%11: i64):  // 2 preds: ^bb0, ^bb5
    %12 = llvm.icmp "slt" %11, %10 : i64
    llvm.cond_br %12, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%0 : i64)
  ^bb3(%13: i64):  // 2 preds: ^bb2, ^bb4
    %14 = llvm.icmp "slt" %13, %3 : i64
    llvm.cond_br %14, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %15 = llvm.mul %11, %3  : i64
    %16 = llvm.add %15, %13  : i64
    %17 = llvm.getelementptr %arg7[%16] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %18 = llvm.load %17 : !llvm.ptr -> f64
    %19 = llvm.getelementptr %arg14[%13] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %20 = llvm.load %19 : !llvm.ptr -> f64
    %21 = llvm.getelementptr %arg19[%11] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    %22 = llvm.load %21 : !llvm.ptr -> f64
    %23 = llvm.fmul %18, %20  : f64
    %24 = llvm.fadd %22, %23  : f64
    %25 = llvm.getelementptr %arg19[%11] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %24, %25 : f64, !llvm.ptr
    %26 = llvm.add %13, %2  : i64
    llvm.br ^bb3(%26 : i64)
  ^bb5:  // pred: ^bb3
    %27 = llvm.add %11, %2  : i64
    llvm.br ^bb1(%27 : i64)
  ^bb6:  // pred: ^bb1
    llvm.return
  }
  llvm.func @async_dispatch_fn(%arg0: !llvm.ptr, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64) attributes {sym_visibility = "private"} {
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
    %12 = llvm.call @async_execute_fn(%arg0, %11, %8, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> !llvm.ptr
    %13 = llvm.call @mlirAsyncRuntimeAddTokenToGroup(%12, %arg0) : (!llvm.ptr, !llvm.ptr) -> i64
    llvm.call @mlirAsyncRuntimeDropRef(%12, %0) : (!llvm.ptr, i64) -> ()
    llvm.br ^bb1(%7, %11 : i64, i64)
  ^bb3:  // pred: ^bb1
    llvm.call @mlirAsyncRuntimeDropRef(%arg0, %0) : (!llvm.ptr, i64) -> ()
    llvm.call @parallel_compute_fn(%arg1, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) : (i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> ()
    llvm.return
  }
  llvm.func @async_execute_fn(%arg0: !llvm.ptr, %arg1: i64, %arg2: i64, %arg3: i64, %arg4: i64, %arg5: i64, %arg6: i64, %arg7: i64, %arg8: !llvm.ptr, %arg9: !llvm.ptr, %arg10: i64, %arg11: i64, %arg12: i64, %arg13: i64, %arg14: i64, %arg15: !llvm.ptr, %arg16: !llvm.ptr, %arg17: i64, %arg18: i64, %arg19: i64, %arg20: !llvm.ptr, %arg21: !llvm.ptr, %arg22: i64, %arg23: i64, %arg24: i64) -> !llvm.ptr attributes {passthrough = ["presplitcoroutine"], sym_visibility = "private"} {
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
    llvm.call @async_dispatch_fn(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> ()
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


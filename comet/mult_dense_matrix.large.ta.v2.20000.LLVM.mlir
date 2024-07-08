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
    %10 = llvm.mlir.constant(20000 : index) : i64
    %11 = llvm.mlir.constant(false) : i1
    %12 = llvm.mlir.constant(1000 : index) : i64
    %13 = llvm.mlir.constant(8 : index) : i64
    %14 = llvm.mlir.constant(7 : index) : i64
    %15 = llvm.mlir.zero : !llvm.ptr
    %16 = llvm.getelementptr %15[32000000] : (!llvm.ptr) -> !llvm.ptr, f64
    %17 = llvm.ptrtoint %16 : !llvm.ptr to i64
    %18 = llvm.add %17, %2  : i64
    %19 = llvm.call @malloc(%18) : (i64) -> !llvm.ptr
    %20 = llvm.ptrtoint %19 : !llvm.ptr to i64
    %21 = llvm.sub %2, %7  : i64
    %22 = llvm.add %20, %21  : i64
    %23 = llvm.urem %22, %2  : i64
    %24 = llvm.sub %22, %23  : i64
    %25 = llvm.inttoptr %24 : i64 to !llvm.ptr
    %26 = llvm.mlir.zero : !llvm.ptr
    %27 = llvm.getelementptr %26[80000000] : (!llvm.ptr) -> !llvm.ptr, f64
    %28 = llvm.ptrtoint %27 : !llvm.ptr to i64
    %29 = llvm.add %28, %2  : i64
    %30 = llvm.call @malloc(%29) : (i64) -> !llvm.ptr
    %31 = llvm.ptrtoint %30 : !llvm.ptr to i64
    %32 = llvm.sub %2, %7  : i64
    %33 = llvm.add %31, %32  : i64
    %34 = llvm.urem %33, %2  : i64
    %35 = llvm.sub %33, %34  : i64
    %36 = llvm.inttoptr %35 : i64 to !llvm.ptr
    %37 = llvm.mlir.zero : !llvm.ptr
    %38 = llvm.getelementptr %37[160000000] : (!llvm.ptr) -> !llvm.ptr, f64
    %39 = llvm.ptrtoint %38 : !llvm.ptr to i64
    %40 = llvm.add %39, %2  : i64
    %41 = llvm.call @malloc(%40) : (i64) -> !llvm.ptr
    %42 = llvm.ptrtoint %41 : !llvm.ptr to i64
    %43 = llvm.sub %2, %7  : i64
    %44 = llvm.add %42, %43  : i64
    %45 = llvm.urem %44, %2  : i64
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
  ^bb7(%57: i64):  // 2 preds: ^bb6, ^bb11
    %58 = llvm.icmp "slt" %57, %9 : i64
    llvm.cond_br %58, ^bb8, ^bb12
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9(%6 : i64)
  ^bb9(%59: i64):  // 2 preds: ^bb8, ^bb10
    %60 = llvm.icmp "slt" %59, %10 : i64
    llvm.cond_br %60, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    %61 = llvm.mul %57, %10  : i64
    %62 = llvm.add %61, %59  : i64
    %63 = llvm.getelementptr %36[%62] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %4, %63 : f64, !llvm.ptr
    %64 = llvm.add %59, %7  : i64
    llvm.br ^bb9(%64 : i64)
  ^bb11:  // pred: ^bb9
    %65 = llvm.add %57, %7  : i64
    llvm.br ^bb7(%65 : i64)
  ^bb12:  // pred: ^bb7
    llvm.br ^bb13(%6 : i64)
  ^bb13(%66: i64):  // 2 preds: ^bb12, ^bb17
    %67 = llvm.icmp "slt" %66, %8 : i64
    llvm.cond_br %67, ^bb14, ^bb18
  ^bb14:  // pred: ^bb13
    llvm.br ^bb15(%6 : i64)
  ^bb15(%68: i64):  // 2 preds: ^bb14, ^bb16
    %69 = llvm.icmp "slt" %68, %10 : i64
    llvm.cond_br %69, ^bb16, ^bb17
  ^bb16:  // pred: ^bb15
    %70 = llvm.mul %66, %10  : i64
    %71 = llvm.add %70, %68  : i64
    %72 = llvm.getelementptr %47[%71] : (!llvm.ptr, i64) -> !llvm.ptr, f64
    llvm.store %5, %72 : f64, !llvm.ptr
    %73 = llvm.add %68, %7  : i64
    llvm.br ^bb15(%73 : i64)
  ^bb17:  // pred: ^bb15
    %74 = llvm.add %66, %7  : i64
    llvm.br ^bb13(%74 : i64)
  ^bb18:  // pred: ^bb13
    %75 = llvm.call @getTime() : () -> f64
    llvm.cond_br %11, ^bb19, ^bb20
  ^bb19:  // 3 preds: ^bb18, ^bb21, ^bb23
    llvm.br ^bb24
  ^bb20:  // pred: ^bb18
    llvm.cond_br %11, ^bb21, ^bb22
  ^bb21:  // pred: ^bb20
    llvm.call @parallel_compute_fn(%6, %12, %8, %6, %8, %7, %19, %25, %6, %8, %9, %9, %7, %30, %36, %6, %9, %10, %10, %7, %41, %47, %6, %8, %10, %10, %7) : (i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.br ^bb19
  ^bb22:  // pred: ^bb20
    %76 = llvm.call @mlirAsyncRuntimeCreateGroup(%14) : (i64) -> !llvm.ptr
    llvm.call @mlirAsyncRuntimeAddRef(%76, %1) : (!llvm.ptr, i64) -> ()
    llvm.call @async_dispatch_fn(%76, %6, %13, %12, %8, %6, %8, %7, %19, %25, %6, %8, %9, %9, %7, %30, %36, %6, %9, %10, %10, %7, %41, %47, %6, %8, %10, %10, %7) : (!llvm.ptr, i64, i64, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64, !llvm.ptr, !llvm.ptr, i64, i64, i64, i64, i64) -> ()
    llvm.call @mlirAsyncRuntimeAwaitAllInGroup(%76) : (!llvm.ptr) -> ()
    %77 = llvm.call @mlirAsyncRuntimeIsGroupError(%76) : (!llvm.ptr) -> i1
    llvm.call @mlirAsyncRuntimeDropRef(%76, %1) : (!llvm.ptr, i64) -> ()
    %78 = llvm.xor %77, %0  : i1
    llvm.cond_br %78, ^bb23, ^bb25
  ^bb23:  // pred: ^bb22
    llvm.br ^bb19
  ^bb24:  // pred: ^bb19
    %79 = llvm.call @getTime() : () -> f64
    llvm.call @printElapsedTime(%75, %79) : (f64, f64) -> ()
    llvm.return
  ^bb25:  // pred: ^bb22
    %80 = llvm.mlir.addressof @assert_msg : !llvm.ptr
    llvm.call @puts(%80) : (!llvm.ptr) -> ()
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
    %3 = llvm.mlir.constant(20000 : index) : i64
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


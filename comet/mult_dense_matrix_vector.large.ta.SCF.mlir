module {
  func.func @main() {
    %c16000 = arith.constant 16000 : index
    %c80000 = arith.constant 80000 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 3.700000e+00 : f64
    %cst_1 = arith.constant 2.300000e+00 : f64
    %alloc = memref.alloc() {alignment = 32 : i64} : memref<80000x16000xf64>
    %alloc_2 = memref.alloc() {alignment = 32 : i64} : memref<16000xf64>
    %alloc_3 = memref.alloc() {alignment = 32 : i64} : memref<80000xf64>
    linalg.fill ins(%cst_1 : f64) outs(%alloc : memref<80000x16000xf64>)
    linalg.fill ins(%cst_0 : f64) outs(%alloc_2 : memref<16000xf64>)
    linalg.fill ins(%cst : f64) outs(%alloc_3 : memref<80000xf64>)

    %repeat = arith.constant 100 : index
    scf.for %r_i = %c0 to %repeat step %c1 {

    %0 = func.call @getTime() : () -> f64
    scf.parallel (%arg0) = (%c0) to (%c80000) step (%c1) {
      scf.for %arg1 = %c0 to %c16000 step %c1 {
        %2 = memref.load %alloc[%arg0, %arg1] : memref<80000x16000xf64>
        %3 = memref.load %alloc_2[%arg1] : memref<16000xf64>
        %4 = memref.load %alloc_3[%arg0] : memref<80000xf64>
        %5 = arith.mulf %2, %3 : f64
        %6 = arith.addf %4, %5 : f64
        memref.store %6, %alloc_3[%arg0] : memref<80000xf64>
      }
      scf.reduce 
    }
    %1 = func.call @getTime() : () -> f64
    func.call @printElapsedTime(%0, %1) : (f64, f64) -> ()

    } // repeat
    return
  }
  func.func private @comet_sort_index(memref<*xindex>, index, index)
  func.func private @getTime() -> f64
  func.func private @printElapsedTime(f64, f64)
}

module {
  func.func @main() {
    %c200 = arith.constant 200 : index
    %c400 = arith.constant 400 : index
    %c8000 = arith.constant 8000 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 3.400000e+00 : f64
    %cst_1 = arith.constant 2.200000e+00 : f64
    %alloc = memref.alloc() {alignment = 32 : i64} : memref<8000x400xf64>
    %alloc_2 = memref.alloc() {alignment = 32 : i64} : memref<400x200xf64>
    %alloc_3 = memref.alloc() {alignment = 32 : i64} : memref<8000x200xf64>
    linalg.fill ins(%cst_1 : f64) outs(%alloc : memref<8000x400xf64>)
    linalg.fill ins(%cst_0 : f64) outs(%alloc_2 : memref<400x200xf64>)
    linalg.fill ins(%cst : f64) outs(%alloc_3 : memref<8000x200xf64>)

    %repeat = arith.constant 100 : index
    scf.for %r_i = %c0 to %repeat step %c1 {

    %0 = func.call @getTime() : () -> f64
    scf.parallel (%arg0) = (%c0) to (%c8000) step (%c1) {
      scf.for %arg1 = %c0 to %c400 step %c1 {
        scf.for %arg2 = %c0 to %c200 step %c1 {
          %2 = memref.load %alloc[%arg0, %arg1] : memref<8000x400xf64>
          %3 = memref.load %alloc_2[%arg1, %arg2] : memref<400x200xf64>
          %4 = memref.load %alloc_3[%arg0, %arg2] : memref<8000x200xf64>
          %5 = arith.mulf %2, %3 : f64
          %6 = arith.addf %4, %5 : f64
          memref.store %6, %alloc_3[%arg0, %arg2] : memref<8000x200xf64>
        }
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

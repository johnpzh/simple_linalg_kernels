if [ $# -ne 1 ]; then
  echo "Usage: bash $0 <scf.mlir>"
  exit -1
fi
# input_llvm=$1

COMET_ROOT="/people/peng599/pppp/comet-openmp-dialect/COMET-openmp"
LLVM_ROOT="/people/peng599/pppp/comet-openmp-dialect/COMET-openmp/llvm"

# input_scf="mult_dense_matrix.large.ta.SCF.mlir"
input_scf="$1"
echo "##"
echo "## Run $0"
echo "input_scf: ${input_scf}"

# Number of Threads
export OMP_NUM_THREADS=8
echo "OMP_NUM_THREADS: ${OMP_NUM_THREADS}"

# Input sparse matrix
# export SPARSE_FILE_NAME0="${COMET_ROOT}/integration_test/data/test_rank2.mtx"
# export SPARSE_FILE_NAME0="/qfs/projects/cenate/tmp/zhen.peng/datasets/suitesparse/GAP-road/GAP-road.mtx"
# export SPARSE_FILE_NAME0="/qfs/projects/cenate/tmp/zhen.peng/datasets/suitesparse/pwtk/pwtk.mtx"
# export SPARSE_FILE_NAME1="../../integration_test/data/test_rank2.mtx"
# export SPARSE_FILE_NAME0="/Users/peng599/Library/CloudStorage/OneDrive-PNNL/Documents/Datasets/pwtk/pwtk.mtx"

echo "SPARSE_FILE_NAME0: ${SPARSE_FILE_NAME0}"

#
# Test if this machine is running macOS
uname -s | grep -q Darwin
if [ $? -eq 0 ]; then
  # macOS
  export EXT="dylib"
else
  # Not macOS, then Linux
  export EXT="so"
  ulimit -s unlimited  # Set stack size as unlimited
fi

# Lowering
comet_opt="${COMET_ROOT}/build-debug/bin/comet-opt"
mlir_opt="${LLVM_ROOT}/build/bin/mlir-opt"
# input_ta="mult_dense_matrix.ta"
basename=$(basename ${input_scf} ".SCF.mlir")
# comet_opt_options="--convert-ta-to-it --convert-to-loops --convert-to-llvm"
# src_llvm="${basename}.llvm.llvm"
# eval ${comet_opt} ${comet_opt_options} ${input_ta} &> ${src_llvm}

# src_ta="${basename}.TensorAlgebra.mlir"
# tensor_algebra_options="--emit-ta"
# eval ${comet_opt} ${tensor_algebra_options} ${input_ta} &> ${src_ta}

# src_it="${basename}.IndexTree.mlir"
# index_tree_options="--convert-ta-to-it --emit-it --opt-comp-workspace"
# eval ${comet_opt} ${index_tree_options} ${input_ta} &> ${src_it}

# src_scf="${basename}.SCF.mlir"
# scf_options="--convert-ta-to-it --convert-to-loops  --opt-comp-workspace"
# eval ${comet_opt} ${scf_options} ${input_ta} &> ${src_scf}

src_llvm="${basename}.LLVM.mlir"
llvm_options="\
-convert-linalg-to-loops \
-lower-affine \
-async-parallel-for \
-async-to-async-runtime \
-async-runtime-ref-counting \
-async-runtime-ref-counting-opt \
-convert-async-to-llvm \
-arith-expand \
-finalize-memref-to-llvm \
-convert-scf-to-cf \
-convert-cf-to-llvm \
-convert-func-to-llvm \
-convert-index-to-llvm \
-convert-vector-to-llvm \
-canonicalize \
-convert-to-llvm \
"
# eval ${comet_opt} ${llvm_options} ${src_scf} &> ${src_llvm}
eval ${mlir_opt} ${llvm_options} ${input_scf} &> ${src_llvm}

# Runner
mlir_cpu_runner="${LLVM_ROOT}/build/bin/mlir-cpu-runner"
mlir_cpu_runner_options="-O3 -e main -entry-point-result=void"
mlir_cpu_runner_shared_libs="${COMET_ROOT}/build-release/lib/libcomet_runner_utils.${EXT},\
${LLVM_ROOT}/build/lib/libmlir_async_runtime.${EXT}\
"
eval ${mlir_cpu_runner} ${mlir_cpu_runner_options} -shared-libs="${mlir_cpu_runner_shared_libs}" ${src_llvm}
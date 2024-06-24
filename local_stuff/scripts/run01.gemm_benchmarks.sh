# C++
start_time=$(date +%s)
binaries_dir="../build-release/cpp_baselines"
output_cpp="output.gemm.cpp.log"
gemm="${binaries_dir}/gemm"
eval "${gemm}" | tee "${output_cpp}"

# COMET
output_comet="output.gemm.comet.log"
# input_scf="mult_dense_matrix.large.ta.SCF.mlir"
# input_scf="mult_dense_matrix.large.ta.v2.one_level_omp.SCF.mlir"
input_scf="mult_dense_matrix.large.ta.v3.one_level.large_mat.SCF.mlir"
last_cwd=$(pwd)
cd ../comet
bash run01.openmp_from_scf.sh "${input_scf}" | tee "../local_stuff/${output_comet}"

# Parse the results
cd "${last_cwd}"
python3 scripts/proc01.extract_comet_exe_time.py -i ${output_comet}
python3 scripts/proc02.extract_cpp_exe_time.py -i ${output_cpp}

end_time=$(date +%s)
exe_time=$((end_time - start_time))
echo "##"
echo "## Execution time (s): ${exe_time}"
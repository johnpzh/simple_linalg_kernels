export SPARSE_FILE_NAME0="/people/peng599/scratch/datasets/suitesparse/GAP-road/GAP-road.mtx"

# C++
export OMP_NUM_THREADS=8
NK=32
start_time=$(date +%s)
binaries_dir="../build-release/cpp_baselines"
output_cpp="output.spmm.cpp.log"
spmm="${binaries_dir}/spmm"
eval "${spmm}" "${SPARSE_FILE_NAME0}" "${NK}" | tee "${output_cpp}"

# COMET
output_comet="output.spmm.comet.log"
input_scf="mult_spmm_CSRxDense.large.ta.SCF.mlir"
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
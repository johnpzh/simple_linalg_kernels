start_time=$(date +%s)

MATRICES=(\
"pdb1HYS" \
"rma10" \
"cant" \
# "consph" \
# "pwtk" \
# "shipsec1" \
# "cop20k_A" \
# "dc2" \
# "scircuit" \
# "mac_econ_fwd500" \
# "ins2" \
# "ASIC_680k" \
"mc2depi" \
"webbase-1M" \
"GAP-road" \
# "GAP-web" \
# "com-LiveJournal" \
# "com-Orkut" \
)

output_comet="output.spmm.comet.log"
comet_collected="$(basename ${output_comet} .log).revised.csv"
rm -f "${comet_collected}"

output_cpp="output.spmm.cpp.log"
cpp_collected="$(basename ${output_cpp} .log).revised.csv"
rm -f "${cpp_collected}"

for matrix in "${MATRICES[@]}"; do

export SPARSE_FILE_NAME0="/people/peng599/scratch/datasets/suitesparse/${matrix}/${matrix}.mtx"

echo ""
echo "#################################"
echo "## Go to ${SPARSE_FILE_NAME0} ..."
echo "#################################"

# C++
binaries_dir="../build-llvm-release/cpp_baselines"
spmm="${binaries_dir}/spmm.v3.schedule"
eval "${spmm}" "${SPARSE_FILE_NAME0}" | tee "${output_cpp}"

# COMET
# input_scf="mult_spmm_CSRxDense.large.ta.v3.k512.SCF.mlir"
# input_scf="mult_spmm_CSRxDense.large.ta.v2.lift_A.SCF.mlir"
# input_llvm="mult_spmm_CSRxDense.large.ta.v4.schedule.k32.LLVM.mlir"
input_llvm="mult_spmm_CSRxDense.large.ta.v5.schedule.k512.LLVM.mlir"
last_cwd=$(pwd)
cd ../comet
bash run02.openmp_from_LLVM.sh "${input_llvm}" | tee "../local_stuff/${output_comet}"

# Parse the results
cd "${last_cwd}"
python3 scripts/proc03.extract_comet_exe_time.append.py -i ${output_comet} -m ${matrix}
python3 scripts/proc04.extract_cpp_exe_time.append.py -i ${output_cpp} -m ${matrix}

done

combined_output="$(basename ${output_comet} .comet.log).combined.csv"
python3 scripts/proc05.combine_csv.py ${cpp_collected} ${comet_collected} ${combined_output}

end_time=$(date +%s)
exe_time=$((end_time - start_time))
echo "##"
echo "## Execution time (s): ${exe_time}"
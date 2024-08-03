start_time=$(date +%s)

MATRICES=(\
"pdb1HYS" \
"rma10" \
"cant" \
"consph" \
"pwtk" \
"shipsec1" \
"cop20k_A" \
"dc2" \
"scircuit" \
"mac_econ_fwd500" \
"ins2" \
"ASIC_680k" \
"mc2depi" \
"webbase-1M" \
"GAP-road" \
"GAP-web" \
"com-LiveJournal" \
"com-Orkut" \
)

output_comet="output.spgemm.comet.log"
comet_collected="$(basename ${output_comet} .log).revised.csv"
rm -f "${comet_collected}"

output_cpp="output.spgemm.cpp.log"
cpp_collected="$(basename ${output_cpp} .log).revised.csv"
rm -f "${cpp_collected}"

for matrix in "${MATRICES[@]}"; do

export SPARSE_FILE_NAME0="/people/peng599/scratch/datasets/suitesparse/${matrix}/${matrix}.mtx"
export SPARSE_FILE_NAME1="/people/peng599/scratch/datasets/suitesparse/${matrix}/${matrix}.mtx"

echo ""
echo "#################################"
echo "## Go to ${SPARSE_FILE_NAME0} ..."
echo "#################################"

# C++
export OMP_NUM_THREADS=8
binaries_dir="../build-release/cpp_baselines"
spgemm="${binaries_dir}/spgemm"
eval "${spgemm}" "${SPARSE_FILE_NAME0}" | tee "${output_cpp}"

# COMET
input_scf="mult_spgemm_CSRxCSR_oCSR.ta.v0.openmp.SCF.mlir"
last_cwd=$(pwd)
cd ../comet
bash run01.openmp_from_scf.sh "${input_scf}" | tee "../local_stuff/${output_comet}"

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
start_time=$(date +%s)

gemm="../build-release/gemm"
eval ${gemm} | tee output.cpp.log

# COMET
cd ../comet
bash run05.openmp.sh | tee ../local_stuff/output.comet.log

end_time=$(date +%s)
exe_time=$((end_time - start_time))
echo "##"
echo "## Execution time (s): ${exe_time}"
# import os
import numpy as np
import pandas as pd
# from typing import Any, List
import argparse
import sys
import os
import scipy.stats as ss

# OUTPUT_DIR = "output"

# def geomean_speedup(baseline: List, x: List) -> Any:
#     return np.exp((np.log(np.array(baseline)) - np.log(np.array(x))).mean())

# def check_if_valid(name: str,
#                    output_dir: str,
#                    feat_sizes: list):
#     for feat_size in feat_sizes:
#         input = os.path.join(output_dir, F"output_tune_{name}_feat{feat_size}_hyb.csv")
#         if not os.path.exists(input):
#             print(F"File {input} does not exist. Skip extract_data.py on matrix {name}.")
#             return False
    
#     return True


def extract_data(filename: str, matrix_name: str):
    with open(filename) as fin:
        runtimes = []
        for line in fin:
            if not line.startswith("exe_time(s): "):
                continue
            time = float(line.split()[1])
            runtimes.append(time)
        
        avg_time = np.mean(runtimes)
        # std_dev = np.std(runtimes)
        cv = ss.variation(runtimes)
        avg_time_parsed = F"{avg_time:.6f}"
        # std_dev_parsed = F"{std_dev:.2%}"
        cv_parsed = F"{cv:.2%}"
        print("C++ execution:")
        print(F"avg_time(s): {avg_time_parsed} coefficient_of_variation: {cv_parsed}")        
        basename = os.path.splitext(os.path.basename(filename))[0]
        table = {
            "name": [matrix_name],
            "C++_exe_time(s)": [avg_time_parsed],
            "C++_exe_time_cv": [cv_parsed]
        }
        output_file = F"{basename}.revised.csv"
        if os.path.exists(output_file):
            df = pd.read_csv(output_file)
            # df = df.append(table, ignore_index=True)
            df = pd.concat([df, pd.DataFrame(data=table)], ignore_index=True)
        else:
            df = pd.DataFrame(data=table)
        
        df.to_csv(output_file, index=False)
        print(F"Saved to file {output_file}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser("parse C++ output")
    parser.add_argument("--input", "-i", type=str, help="input log file")
    parser.add_argument("--matrix-name", "-m", type=str, help="matrix name")

    if len(sys.argv) == 1:
        parser.print_help(sys.stderr)
        sys.exit(-1)
    args = parser.parse_args()

    filename = args.input
    matrix_name = args.matrix_name
    extract_data(filename, matrix_name)

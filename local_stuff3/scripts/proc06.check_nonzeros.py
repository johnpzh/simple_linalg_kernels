# import os
import numpy as np
import pandas as pd
# from typing import Any, List
import argparse
import sys
import os
import scipy.stats as ss


def compare(cpp_input: str, scf_input: str):
    cpp_array = []
    with open(cpp_input) as fin:
        last_line = fin.readlines()[-1]
        cpp_array = [float(x) for x in last_line.split(",")[:-1]]

    scf_array = []
    with open(scf_input) as fin:
        last_line = fin.readlines()[-1]
        scf_array = [float(x) for x in last_line.split(",")[:-1]]
    
    if np.allclose(cpp_array, scf_array, atol=1e-07):
        print("All close!")
    else:
        print("something wrong!")
    flags = np.isclose(cpp_array, scf_array, atol=1e-07)
    count = 0
    for i, val in enumerate(flags):
        if not val:
            count += 1
            if count < 20:
                print(F"cpp_array[{i}]: {cpp_array[i]} scf_array[{i}]: {scf_array[i]} val: {val}")
    print(F"difference: {count}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(f"{sys.argv[0]}")
    # parser.add_argument("--input", "-i", type=str, help="input log file")
    # parser.add_argument("--matrix-name", "-m", type=str, help="matrix name")
    parser.add_argument("cpp_input", type=str, help="cpp input text file")
    parser.add_argument("scf_input", type=str, help="scf input text file")
    # parser.add_argument("scf_csv", type=str, help="SCF CSV file")
    # parser.add_argument("output", type=str, help="output CSV file")

    if len(sys.argv) == 1:
        parser.print_help(sys.stderr)
        sys.exit(-1)
    args = parser.parse_args()

    cpp_input = args.cpp_input
    scf_input = args.scf_input
    # scf_csv = args.scf_csv
    # output_csv = args.output
    # combine(cpp_csv, scf_csv, output_csv)
    compare(cpp_input, scf_input)

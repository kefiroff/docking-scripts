#!/bin/bash

# Specify the source and target directories
src_dir="protein"
tgt_dir="pdb-to-pdbqt"

# Find all files in the source directory, shuffle them and select the first 100
for file in $(find "$src_dir" -type f | shuf -n 100)
do
  # Move each file to the target directory
  mv "$file" "$tgt_dir"
done
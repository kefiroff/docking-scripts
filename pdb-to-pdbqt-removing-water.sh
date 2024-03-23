#!/bin/bash
dir="pdb-to-pdbqt"

for file in "$dir"/*
do
  grep -v 'HOH' $file > $file1
  file1="$file"
  file2="${file%.*}.pdbqt"
  obabel "$file1" -O "$file2"
done
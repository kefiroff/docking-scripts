#!/bin/bash
dir="pdb-to-pdbqt"

for file in "$dir"/*
do
  file1="${file%.*}_noHOH.pdb" # output file will have _noHOH.txt suffix
  grep -v 'HOH' "$file" > "$file1"
  file2="${file%.*}_removed_water.pdbqt"
  obabel "$file1" -O "$file2"
done

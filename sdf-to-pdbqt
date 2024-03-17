#!/bin/bash
dir="sdf-to-pdbqt" # replace with your directory

for file in "$dir"/*
do
  file1="$file"
  file2="${file%.*}.pdbqt"
  obabel "$file1" -O "$file2"
done
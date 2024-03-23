#!/bin/bash
output_dir="result"
dir1="pdb-to-pdbqt" 
for fullpath in "$dir1"/*
do
  file=$(basename "$fullpath")
  filename=${file%.*} # Remove the file extension
  shortname=$(echo "$filename" | cut -c 1-4)
  fileNames+=("$shortname")
done
dir1="pdb-to-pdbqt"
dir2="sdf-to-pdbqt"
for name in "${fileNames[@]}"
do
  # Construct the file paths
  file1="$dir1/${name}_protein.pdbqt"
  file2="$dir2/${name}_ligand.pdbqt"
  # Check if both files exist
  if [[ -f "$file1" && -f "$file2" ]]; then
    # Run the command with the files as arguments
    ./smina.static -r "$file1" -l "$file2" --autobox_ligand "$file2" -o "${output_dir}/${name}result"
  fi
done
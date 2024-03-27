#!/bin/bash
output_dir="result_vinardo_removed_water"
dir1="protein_pdbqt_removed_water"
dir2="ligand_pdbqt" 
for fullpath in "$dir1"/*
do
  file=$(basename "$fullpath")
  filename=${file%.*} # Remove the file extension
  shortname=$(echo "$filename" | cut -c 1-4)
  fileNames+=("$shortname")
done

for name in "${fileNames[@]}"
do
  # Construct the file paths
  file1="$dir1/${name}_protein_removed_water.pdbqt"
  file2="$dir2/${name}_ligand.pdbqt"
  # Check if both files exist
  if [[ -f "$file1" && -f "$file2" ]]; then
    # Run the command with the files as arguments
    ./smina.static -r "$file1" -l "$file2" --autobox_ligand "$file2" --scoring vinardo -o "${output_dir}/${name}_result_vinardo_removed_water"
  fi
done
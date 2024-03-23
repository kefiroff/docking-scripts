import os
import shutil
directory1 = 'C:/Users/ildar/work/pdbbind/ligand'
directory2 = 'C:/Users/ildar/work/pdbbind/pdb-to-pdbqt'
directory3 = 'C:/Users/ildar/work/pdbbind/sdf-to-pdbqt'
filename_list = []
for filename in os.listdir(directory2):
    filename_list.append(filename[:4])
for filename in os.listdir(directory1):
    if filename[:4] in filename_list:
        file_path = f'C:/Users/ildar/work/pdbbind/ligand/{filename}'
        dest_path = f'C:/Users/ildar/work/pdbbind/sdf-to-pdbqt/{filename}'
        shutil.move(file_path, dest_path)


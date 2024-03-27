import pandas as pd
import openpyxl
import os
# Read the Excel file
df = pd.read_excel('SearchResult.xlsx', skiprows=1)
directory2 = 'C:/Users/ildar/work/pdbbind/protein_pdbqt'
names = []
print(df.columns)
# Define the list of names
for filename in os.listdir(directory2):
    names.append(filename[:4])

# Filter rows where the 'name' column's value is in the list of names
filtered_df = df[df['PDB code'].isin(names)]

# Now, 'filtered_df' contains the rows from df where 'name' is in 'names'
# You can access the 'value' column of these rows like this:
values = filtered_df['pKd pKi pIC50']
values_df = pd.DataFrame(values)
values_transposed = values_df.transpose()
# Write the values to a new Excel file
values_transposed.to_excel('pKd.xlsx', index=False, header=False)

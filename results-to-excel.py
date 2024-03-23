import pandas as pd
import openpyxl
import os
directory = 'C:/Users/ildar/work/pdbbind/result'
target = ">  <minimizedAffinity>"
file_result = {}
for filename in os.listdir(directory):
    result = []
    file = open(os.path.join(directory, filename), "r")
    content = file.read()
    strings = content.split('\n')
    for i in range(len(strings)):
        if strings[i] == target:
            result.append(strings[i + 1])
    file_result[filename] = result
df = pd.DataFrame.from_dict(file_result, orient='index').transpose()
df.to_excel('results.xlsx', index=False)
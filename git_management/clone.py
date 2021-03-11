import os

filepath = 'list.txt'
with open(filepath) as fp:
    while line := fp.readline():
        line = line.strip()
        os.system(f'git clone {line}')

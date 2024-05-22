# ********************
# LEYENDO FICHEROS CSV
# ********************
from pathlib import Path


def run(datafile: Path) -> list:
<<<<<<< HEAD
    f = open(datafile)
    cdata = {}
    for line in f:
        cleaned_line = line.strip().split(',')
        for k in cleaned_line:
            cdata[k] = 0
    f.close()

    data = [cdata]
=======
    data = []
    
    with open(datafile, 'r') as f:
        lines = f.readlines()
        headers = lines[0].strip().split(',')
        for line in lines[1:]:
            cleaned_line = line.strip().split(',')
            row = {}
            for key, value in zip(headers, cleaned_line):
                if value.lower() == 'true':
                    row[key] = True
                elif value.lower() == 'false':
                    row[key] = False
                elif value.isdigit():
                    row[key] = int(value)
                elif value == '':
                    row[key] = None
                else:
                    row[key] = value
            data.append(row)
>>>>>>> 5b0f647ad2423cba454eef9adb35081c42d42c38
    return data


if __name__ == '__main__':
    run('data/read_csv/pokemon.csv')
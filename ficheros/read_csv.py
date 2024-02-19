# ********************
# LEYENDO FICHEROS CSV
# ********************
from pathlib import Path


def run(datafile: Path) -> list:
    f = open(datafile)
    cdata = {}
    for line in f:
        cleaned_line = line.strip().split(',')
        for k in cleaned_line:
            cdata[k] = 0
    f.close()

    data = [cdata]
    return data


if __name__ == '__main__':
    run('data/read_csv/pokemon.csv')

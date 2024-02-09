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

    with open(datafile) as f1:
        for line in f1:
            cleaned_line = line.strip().split(',')
            for word in cleaned_line:
                cdata[k] = cdata.get(word)
    data = [cdata]
    return data


if __name__ == '__main__':
    run('data/read_csv/pokemon.csv')

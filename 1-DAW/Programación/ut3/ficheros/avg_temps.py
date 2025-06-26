# *******************
# TEMPERATURAS MEDIAS
# *******************
import filecmp
from pathlib import Path


def run(input_path: Path) -> bool:
    output_path = 'data/avg_temps/avg_temps.dat'
    f_ipath = open(input_path)
    total_tempertatures = 0

    with open(output_path, "w") as f_opath:
        for month in f_ipath:
            temperatures = month.strip().split(',')
            total_tempertatures = 0
            for day in temperatures:
                total_tempertatures += int(day)

            media = total_tempertatures / len(temperatures)
            f_opath.write(f'{media:.2f}\n')

    return filecmp.cmp(output_path, './data/avg_temps/.expected', shallow=False)


if __name__ == '__main__':
    run(Path('data/avg_temps/temperatures.dat'))

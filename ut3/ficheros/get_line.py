# *****************
# HAN CANTADO LÍNEA
# *****************
from pathlib import Path


def run(input_path: Path, line_no: int) -> str:
    line = None
    with open(input_path, 'r') as file:
        for num_line, incoming_line in enumerate(file, 1):
            if num_line == line_no:
                line = incoming_line.strip()


    return line


if __name__ == '__main__':
    run('data/get_line/nasdaq.txt', 20)
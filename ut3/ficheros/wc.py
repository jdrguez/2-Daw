# ****************
# CONTANDO COMO WC
# ****************
from pathlib import Path


def run(input_path: Path) -> tuple:
    num_words = 0
    num_bytes = 0
    num_lines = 0
    with open(input_path, 'r') as f_input:
        for line in f_input:
            num_words += len(line.strip().split())
            num_lines += 1
            num_bytes += len(line.encode('utf-8'))
    return num_lines, num_words, num_bytes


if __name__ == '__main__':
    run('data/wc/lorem.txt')

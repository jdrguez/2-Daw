# ***********************************
# ¿DÓNDE ESTÁN LAS PALABRAS? MATARILE
# ***********************************
from pathlib import Path


def run(data_path: Path, target_word: str) -> list:
    matches = []

    with open(data_path, 'r') as file:
        for line_num, line in enumerate(file, 1):
            words = line.strip().split()
            total_pos = 1
            for word in words:
                if word.lower() == target_word.lower():
                    matches.append((line_num, total_pos))
                    break
                total_pos += len(word) + 1
            else:
                total_pos += len(line) + 1
    return matches


if __name__ == '__main__':
    run('data/find_words/bzrp.txt', 'persona')
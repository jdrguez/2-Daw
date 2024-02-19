# ********************
# LA PALABRA MÁS LARGA
# ********************
from pathlib import Path


def run(input_path: Path) -> str:
    longest_word = ''
    with open(input_path, 'r') as file:
        for line in file:
            line = line.strip('\n,.;:()').split()
            for word in line:
                biggest_word = line[0]
                if len(word) >= len(longest_word):
                    longest_word = word

    return longest_word


if __name__ == '__main__':
    run('data/longest_word/python.txt')
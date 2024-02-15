# **********
# HISTOGRAMA
# **********
import filecmp
from pathlib import Path


def run(data_path: Path) -> bool:
    histogram_path = 'data/histogram/histogram.txt'
    file = open(data_path)
    with open(histogram_path, 'w', encoding='UTF-8') as result:
        letters = file.readline()
        uniq_letter = set(letters)
        for letter in sorted(uniq_letter):
            total_repeat_letter = letters.count(letter)
            result.write(f'{letter} {"█" * total_repeat_letter} {total_repeat_letter}\n')
    return filecmp.cmp(histogram_path, 'data\histogram\.expected', shallow=False)


if __name__ == '__main__':
    run('data/histogram/data.txt')
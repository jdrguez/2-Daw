# **********************
# FRECUENCIA DE PALABRAS
# **********************
from pathlib import Path


def run(input_path: Path, lower_bound: int) -> dict:
    total_freq = {}
    with open(input_path, 'r') as file:
        for line in file:
            words = line.lower().split()
            for word in words:
                word = word.strip(".,!?")
                total_freq[word] = total_freq.get(word, 0 ) + 1
    
    freq = {word: total for word, total in total_freq.items() if total >= lower_bound}
    return freq


if __name__ == '__main__':
    run('data/word_freq/cistercian.txt', 9)
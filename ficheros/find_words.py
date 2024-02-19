# ***********************************
# ¿DÓNDE ESTÁN LAS PALABRAS? MATARILE
# ***********************************
from pathlib import Path


def run(data_path: Path, target_word: str) -> list:
    matches = []
    columns = 0
    
    with open(data_path, 'r') as file:
       for line_number, line in enumerate(file, start= 1):
           line_lower = line.lower()
           target_word_lower = target_word.lower()
           index = line_lower.find(target_word_lower)
           while index != -1:
               if (index == 0 or not line[index - 1].isalnum()) and (index + len(target_word_lower) == len(line_lower) or not line[index + len(target_word_lower).isalnum()]):
                    columns = index + 1
                    matches.append((line_number, columns))
                    index = line_lower.find(target_word_lower, index + 1)
        
       
    return matches


if __name__ == '__main__':
    run('data/find_words/bzrp.txt', 'persona')
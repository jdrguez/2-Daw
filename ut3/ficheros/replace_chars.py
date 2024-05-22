# ***********************
# REEMPLAZO DE CARACTERES
# ***********************
import filecmp
from pathlib import Path


def run(input_path: Path, replacements: str) -> bool:
    output_path = 'data/replace_chars/r_noticia.txt'
    file = open(input_path)
    all_replaces = [replacement for replacement in replacements.split('|')]
    
    with open(output_path, 'w') as result:
        for line in file:
            for word in line:
                for letter in word:
                    for old_char, new_char in all_replaces:
                        content = letter.replace(old_char, new_char)
                        result.write(content)
                

        

    return filecmp.cmp(output_path, 'data/replace_chars/.expected', shallow=False)


if __name__ == '__main__':
    run('data/replace_chars/noticia.txt', 'áa|ée|íi|óo|úu')
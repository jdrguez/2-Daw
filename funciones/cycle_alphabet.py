# *****************
# ALFABETO CIRCULAR
# *****************


def generator_alphabet(limit: int):
    alphabete = 'abcdefghijklmñopqrstuvwxyz'
    limits = abs(limit - len(alphabete))
    for letter_pos in range(limit):
        yield alphabete[letter_pos]


def run(max_letters: int) -> str:
    text = ''
    alphabet = generator_alphabet(max_letters)
    for letter in alphabet:
        text += letter

    return text


if __name__ == '__main__':
    run(0)

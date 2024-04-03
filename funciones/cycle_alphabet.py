# *****************
# ALFABETO CIRCULAR
# *****************


def generator_alphabet(limit: int):
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    for letter_pos in range(limit):
        yield alphabet[letter_pos % len(alphabet)]


def run(max_letters: int) -> str:
    return ''.join(generator_alphabet(max_letters))


if __name__ == '__main__':
    run(0)

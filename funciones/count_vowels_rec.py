# *******************************
# CONTANDO VOCALES (EN RECURSIVO)
# *******************************


def count_vowels(text: str) -> int:
    VOWELS = 'aeiou'
    text = list(text)
    count = 0
    if len(text) == 0:
        return 0
    for letter in text[0]:
        if letter in VOWELS:
            count += 1
    return count + count_vowels(text[1:])

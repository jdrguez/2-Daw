import re


def extract_vowel_words(text: str) -> list[str]:
    start_vowels = r'^[aeiouáéíóú]'
    split_re = r'\b'
    splited_text = re.split(split_re, text)
    return [letter for letter in splited_text if re.match(start_vowels, letter, re.I)]

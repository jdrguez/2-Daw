# ********
# PANGRAMA
# ********


def is_pangram(text: str) -> bool:
    ALPHABET = set('abcdefghijklmnopqrstuvwxyz')
    non_repeat_text = set(text.lower())
    return len(non_repeat_text & ALPHABET) == len(ALPHABET)

# *********************************
# SEPARANDO MAYÚSCULAS Y MINÚSCULAS
# *********************************


def split_case(words: list) -> list:
    lower_words = [word for word in words if word.islower()]
    upper_words = [word for word in words if word.isupper()]
    return lower_words, upper_words

# *******************
# CONSONANTES COMUNES
# *******************


def run(text1: str, text2: str) -> str:
    VOWELS = 'aeiou'
    cleaned_text1, cleaned_text2 = text1.replace(' ', ''), text2.replace(' ', '')

    cosonants1 = {word for word in cleaned_text1.lower() if word not in VOWELS}
    cosonants2 = {word for word in cleaned_text2.lower() if word not in VOWELS}

    cconst = ''.join(sorted(cosonants1 & cosonants2))

    return cconst


if __name__ == '__main__':
    run('Flat is bEtter than nested', 'Readability counts')

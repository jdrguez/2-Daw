# ******************
# AGRUPANDO PALABRAS
# ******************


def run(words: list) -> dict:
    group_words = {}

    for letter in words:
        group_words[letter[0]]
    return group_words


if __name__ == '__main__':
    run(
        [
            'mesa',
            'móvil',
            'barco',
            'coche',
            'avión',
            'bandeja',
            'casa',
            'monitor',
            'carretera',
            'arco',
        ]
    )

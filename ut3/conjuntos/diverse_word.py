# ***************
# PALABRA DIVERSA
# ***************


def run(words: list) -> str:
    max_diversity = 0
    dword = ''

    for word in words:
        diversity = len(set(word))
        if diversity > max_diversity:
            max_diversity = diversity
            dword = word
        elif diversity == max_diversity and word > dword:
            dword = word

    return dword


if __name__ == '__main__':
    run(['dictionary', 'turtle', 'flexibility', 'humanity'])

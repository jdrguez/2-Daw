# ****************
# TROCEADO EXTREMO
# ****************


def run(numbers: str) -> str:
    numbers_list = numbers.split(',')
    stripped_number = numbers_list[1:-1]
    strip_numbers = ' '.join(stripped_number)

    return strip_numbers


if __name__ == '__main__':
    run('1,2,3')
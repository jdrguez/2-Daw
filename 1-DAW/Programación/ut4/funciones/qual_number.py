# ********************
# CUALIFICANDO NÚMEROS
# ********************


def run(number: int) -> str:
    number = str(number)[::-1]
    qnumber = []
    for char_pos, char in enumerate(number):
        if char_pos % 3 == 0 and char_pos != 0:
            qnumber.append(',')
        qnumber.append(number[char_pos])
    return ''.join(qnumber)[::-1]


if __name__ == '__main__':
    run(1)

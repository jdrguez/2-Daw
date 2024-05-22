# ************************
# DÍGITOS EN ORDEN INVERSO
# ************************


def run(number: int) -> list:
    rev_digits = []
    number_list = list(str(number))
    for num in number_list:
        rev_digits.append(int(num))
    rev_digits.reverse()
    
    return rev_digits


if __name__ == '__main__':
    run(35231)
# ******************
# TUPLAS Y CONJUNTOS
# ******************


def run(input: tuple) -> tuple:
    first_value = set()
    second_value = set()
    
    for values in input:
        first_value.add(values[0])
        second_value.add(values[1])
        
    output = first_value, second_value

    return output


if __name__ == '__main__':
    run(((4, 3), (8, 2), (7, 5), (8, 2), (9, 1)))
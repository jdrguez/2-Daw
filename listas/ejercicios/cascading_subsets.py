# ***********************
# SUBCONJUNTOS EN CASCADA
# ***********************


def run(values: list, size: int) -> list:
    cascading = []
    for element in range(len(values) - size + 1):
        for value in range(element + 1, element + size + 1):
            next_list = values[element:value]
            if len(next_list) == size:
                cascading.append(next_list)

    return cascading


if __name__ == '__main__':
    run([1, 2, 3, 4], 3)
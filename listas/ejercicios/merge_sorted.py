# ***************
# MEZCLA ORDENADA
# ***************


def run(values1: list, values2: list) -> list:
    merged = []
    element1 = element2 = 0
    for _ in range(len(values1) + len(values2)):
        if element1 < len(values1) and (element2 == len(values2) or values1[element1] <= values2[element2]):
            if not merged or values1[element1] != merged[-1]:
                merged.append(values1[element1])
            element1 += 1
        elif element2 < len(values2) and (element1 == len(values1) or values2[element2] < values1[element1]):
            if not merged or values2[element2] != merged[-1]:
                merged.append(values2[element2])
            element2 += 1

    return merged


if __name__ == '__main__':
    run([1, 2, 3, 4], [1, 1, 2, 3, 4, 5])
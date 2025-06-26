# ***************
# MEZCLA ORDENADA
# ***************


def run(values1: list, values2: list) -> list:
    new_values1 = values1.copy()
    new_values2 = values2.copy()
    merged = []
    while new_values1 and new_values2:
        if new_values1[0] < new_values2[0]:
            if not merged or new_values1[0] != merged[-1]:
                merged.append(new_values1.pop(0))
            else:
                new_values1.pop(0)
        else:
            if not merged or new_values2[0] != merged[-1]:
                merged.append(new_values2.pop(0))
            else:
                new_values2.pop(0)
    remaining = new_values1 if new_values1 else values2
    for value in remaining:
        if value != merged[-1]:
            merged.append(value)
    return merged


if __name__ == '__main__':
    run([1, 2, 3, 4], [1, 1, 2, 3, 4, 5])
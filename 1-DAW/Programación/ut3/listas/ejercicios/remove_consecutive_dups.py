# *********************************
# ELEMENTOS DUPLICADOS CONSECUTIVOS
# *********************************


def run(items: list) -> list:
    result = [items[0]]
    for item in range(1, len(items)):
        if items[item] != items[item - 1]:
            result.append(items[item])

    return result


if __name__ == '__main__':
    run([0, 0, 1, 2, 3, 4, 4, 5, 6, 6, 6, 7, 8, 9, 4, 4])
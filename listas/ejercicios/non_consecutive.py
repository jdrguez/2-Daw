# *******************
# NO ERES CONSECUTIVO
# *******************


def run(values: list) -> int:
    target = None
    if not values:
        target = None
    else:
        for element in range(1,len(values)):
            if values[element] != values[element - 1] + 1:
                target = values[element]
                break

    return target


if __name__ == '__main__':
    run([1, 2, 3, 4, 6, 7, 8])
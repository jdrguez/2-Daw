# *************************
# PRIMER ELEMENTO DUPLICADO
# *************************


def run(numbers: list) -> int:
    fdup = -1
    currents = []
    for num in numbers:
        if num not in currents:
            currents.append(num)
        elif num in currents:
            fdup = num
            break

    return fdup


if __name__ == '__main__':
    run([2, 3, 5, 3, 2])

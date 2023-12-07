# *******************
# NO ERES CONSECUTIVO
# *******************


def run(values: list) -> int:
    target = 0
    if not values or len(values) == 1:
        target = None
    else:
        for element in range(1,len(values)):
            if abs (values[element] != values[element - 1] + 1 ):
                target += (values[element])
            else:
                target = None
    

    return target


if __name__ == '__main__':
    run([1, 2, 3, 4, 6, 7, 8])
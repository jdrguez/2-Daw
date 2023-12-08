# **************
# SUMA RECORTADA
# **************


def run(values: list) -> int:
    if not values or values == []:
        tsum = 0
    else:
        max_value = max(values)
        min_value = min(values)
        tsum = 0
        for value in values:
            if value != max_value and value != min_value:
                tsum += value

    return tsum


if __name__ == '__main__':
    run([6, 2, 1, 8, 10])
# ******************
# POTENCIA RECURSIVA
# ******************


def power(num: int, n: int):
    if n <= 0:
        return 0
    return num * num * power(num, n - 1)

# ******************
# POTENCIA RECURSIVA
# ******************


def power(num: int, n: int):
    if n == 0:
        return 1
    if n == 1:
        return num
    return  num * power(num, n - 1)

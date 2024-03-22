# *******************
# FIBONACCI GENERADOR
# *******************


def run(n: int) -> list:
    if n == 0:
        return 0
    if n == 1:
        return 0, 1

    return list(run(n - 1) + run(n - 2))

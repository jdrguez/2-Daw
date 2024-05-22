# ************************
# MULTIPLICACIÓN EN CADENA
# ************************


def run(numbers: list) -> int:
    rmult = 1
    if not numbers or len(numbers) == 1:
        rmult = 1
    else:
        for num in numbers:
            rmult*= num
    return rmult


if __name__ == '__main__':
    run([1, 2, 3, 4])
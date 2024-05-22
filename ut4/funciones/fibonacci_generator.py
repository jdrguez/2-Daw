# *******************
# FIBONACCI GENERADOR
# *******************

def fibonacci_generator(n: int):
    num1, num2 = 0, 1
    for _ in range(n):
        yield num1
        num1, num2 = num2, num1 + num2

def run(n: int) -> list:
    return list(fibonacci_generator(n))
# *******************************
# ASEGURANDO ARGUMENTOS POSITIVOS
# *******************************

def assert_positive(func):
    def wrapper(*args, **kwargs):
        for arg in args:
            if arg <= 0:
                return 0
        for arg in kwargs.values():
            if arg <= 0:
                return 0
        return func(*args, **kwargs)
    return wrapper

@assert_positive
def factorial(n: int) -> int:
    fact = 1
    for i in range(1, n + 1):
        fact *= i
    
    return fact


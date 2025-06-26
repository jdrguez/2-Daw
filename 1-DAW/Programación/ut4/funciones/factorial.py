# ************************************
# CALCULANDO EL FACTORIAL DE UN NÚMERO
# ************************************


def factorial(n):
    if n == 0:
        return 1
    if n < 0:
        return 
    else:
        fact = 1
        for i in range(1, n + 1):
            fact *= i

    return fact
        

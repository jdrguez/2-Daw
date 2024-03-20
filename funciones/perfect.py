# *****************
# NÚMEROS PERFECTOS
# *****************


def self_divisors(number: int) -> list:
    return [number // num for num in range(1, number)]


def is_perfect(n: int):
    total_divisors = self_divisors(n)
    if sum(total_divisors) == n:
        return True
    return False

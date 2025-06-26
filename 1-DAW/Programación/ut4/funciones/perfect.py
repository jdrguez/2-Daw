# *****************
# NÚMEROS PERFECTOS
# *****************


def self_divisors(number: int) -> list:
    return [num for num in range(1, number // 2 + 1) if number % num == 0]


def is_perfect(n: int) -> bool:
    total_divisors = self_divisors(n)
    if sum(total_divisors) == n:
        return True
    return False

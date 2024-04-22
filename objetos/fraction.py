from __future__ import annotations


class Fraction:
    def __init__(self, num: int, den: int):
        self.num = num
        self.den = den
        self.max_cmon_div = self.gcd(num, den)

    def __add__(self, other: Fraction):
        if isinstance(other, Fraction):
            new_num = ((self.num * other.den) + (self.den * other.num)) // self.max_cmon_div
            new_den = (self.den + other.den) // self.max_cmon_div
            return Fraction(new_num, new_den)

    def __sub__(self, other: Fraction):
        if isinstance(other, Fraction):
            return ''

    def __mul__(self, other: Fraction):
        if isinstance(other, Fraction):
            new_num = (self.num * other.num) // self.max_cmon_div
            new_den = (self.den * other.den) // self.max_cmon_div
            return Fraction(new_num, new_den)

    def __truediv__(self, other: Fraction):
        if isinstance(other, Fraction):
            new_num = (self.num // other.den) // self.max_cmon_div
            new_den = (self.den // other.num) // self.max_cmon_div
            return Fraction(new_num, new_den)

    def __str__(self): ...

    @staticmethod
    def gcd(a: int, b: int) -> int:
        '''Euclid's Algorithm'''
        while b > 0:
            a, b = b, a % b
        return a

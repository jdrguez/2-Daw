import re


def is_valid_float(number: str) -> bool:
    valid_float = r'(-*\d)*[.e]+\w*'
    return re.fullmatch(valid_float, number) is not None

import re


def is_valid_email(email: str) -> bool:
    valid_email = r'[\w-]+@\w+([.]\w+)+'
    return re.fullmatch(valid_email, email) is not None


print(is_valid_email('info@iespuertodelacruz.es'))

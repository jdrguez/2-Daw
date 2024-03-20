# **********
# PALÍNDROMO
# **********


def is_palindrome(text: str) -> bool:
    if ' '.join(sorted(text, reverse=True)) == text:
        return True
    return False

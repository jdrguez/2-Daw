# **********
# PALÍNDROMO
# **********


def is_palindrome(text: str) -> bool:
    cleaned_text = text.lower().replace(" ", "")
    return cleaned_text == cleaned_text[::-1]

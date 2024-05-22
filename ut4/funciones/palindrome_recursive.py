# **********
# PALÍNDROMO
# **********


def is_palindrome(text: str) -> bool:
    cleaned_text = text.lower().replace(" ", "")

    if len(cleaned_text) <= 1:
        return True
    if cleaned_text[0] != cleaned_text[-1]:
        return False
    return is_palindrome(cleaned_text[1:-1])

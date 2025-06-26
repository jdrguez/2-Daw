import re


def is_valid_url(url: str) -> bool:
    valid_form = r'^https?:\//.+\.+.+\w'
    return re.fullmatch(valid_form, url) is not None

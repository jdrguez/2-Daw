# ***********************
# SUMANDO CON ANIDAMIENTO
# ***********************


def sum_nested(items: list) -> int:
    result = []
    for item in items:
        if isinstance(item, list):
            result.append(sum_nested(item))
        else:
            result.append(item)
    return sum(result)

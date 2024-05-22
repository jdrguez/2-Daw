# ******************
# CALCULADORA LÓGICA
# ******************


def run(values: list, oper: str) -> bool:
    if oper == 'and':
        result = True
        for value in values:
            result = result and value
    elif oper == 'or':
        result = False
        for value in values:
            result = result or value
    return result


if __name__ == '__main__':
    run([True, True, False], 'and')
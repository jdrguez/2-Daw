import re


def calc(expression: str) -> int | float:
    valid_expresion = r'(\d+)([+\-*/])(\d+)'
    result = 0
    expression = expression.replace(' ', '')
    if m := re.match(valid_expresion, expression):
        num1, operator, num2 = m.groups()
        num1, num2 = int(num1), int(num2)
        match operator:
            case '+':
                result = num1 + num2
            case '-':
                result = num1 - num2
            case '*':
                result = num1 * num2
            case '/':
                result = num1 / num2
            case _:
                result = None
    return result

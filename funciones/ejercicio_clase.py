def get_number(n:int) -> str:
    number = str(n)[::-1]
    result = []
    for char_pos, char in enumerate(number):
        if char_pos % 3 == 0 and char_pos != 0:
            result.append(',')
        result.append(number[char_pos])
    return ''.join(result)[::-1]
    
print(get_number(5432))

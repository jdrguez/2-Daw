# *****************************
# SUMA DE LA DIAGONAL PRINCIPAL
# *****************************


def run(matrix: list) -> int:
    pos = 0
    sum_diagonal= 0
    rows_a = len(matrix)
    for element in range(rows_a):
        sum_diagonal += matrix[pos][pos]
        pos += 1
    

    return sum_diagonal


if __name__ == '__main__':
    run([[4, 6, 1], [2, 9, 3], [1, 7, 7]])
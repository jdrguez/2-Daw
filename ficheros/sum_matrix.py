# ****************
# SUMANDO MATRICES
# ****************
import filecmp
from pathlib import Path


def run(matrix1_path: Path, matrix2_path: Path) -> bool:
    result_path = 'data/sum_matrix/result.dat'
    matrix1 = open(matrix1_path)
    matrix2 = open(matrix2_path)
    
    with open(result_path, 'w') as result:
        lines1 = matrix1.readlines()
        lines2 = matrix2.readlines()
        matrix1_num = [[int(num) for num in line.strip().split()] for line in lines1]
        matrix2_num = [[int(num) for num in line.strip().split()] for line in lines2]
        
        for numbers1, numbers2 in zip(matrix1_num, matrix2_num):
            for num1, num2 in zip(numbers1, numbers2):
                total_sum = num1 + num2
                result.write(str(total_sum) + ' ')
            result.write('\n')
         
    return filecmp.cmp(result_path, 'data\sum_matrix\.expected', shallow=False)


if __name__ == '__main__':
    run('data/sum_matrix/matrix1.dat', 'data/sum_matrix/matrix2.dat')
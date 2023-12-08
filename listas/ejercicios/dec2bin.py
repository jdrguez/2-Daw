# *****************
# DECIMAL A BINARIO
# *****************


def run(num: int) -> str:
    total_binary = ''
    
    while num > 0:
        binary_operation = num % 2
        total_binary = str(binary_operation) + total_binary
        num //=2
    to_bin = total_binary

    return to_bin


if __name__ == '__main__':
    run(1)
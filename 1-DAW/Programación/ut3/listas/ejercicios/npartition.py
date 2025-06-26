# ***********************
# PARTICIÓN POR EL NÚMERO
# ***********************


def run(values: list, ref_value: int) -> list:
    lower_partition = [num for num in values if num < ref_value]
    upper_partition = [num for num in values if num >= ref_value]
    npartition = [lower_partition, upper_partition]

    return npartition


if __name__ == '__main__':
    run([4, 3, 2, 9, 8, 5], 4)
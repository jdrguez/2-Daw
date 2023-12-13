# *****************
# ORDENANDO NÚMEROS
# *****************


def run(numbers: list) -> list:
    length_numbers = len(numbers)

    for element in range(length_numbers):
        for num_pos in range(0, length_numbers - element - 1):
            if numbers[num_pos] > numbers[num_pos + 1]:
                numbers[num_pos] = numbers[num_pos + 1]
                numbers[num_pos + 1] = numbers[num_pos]

    sorted_numbers = numbers

    return sorted_numbers


if __name__ == '__main__':
    run([4, 2, 9, 7, 1, 8])

# *****************
# ORDENANDO NÚMEROS
# *****************


def run(numbers: list) -> list:
    new_list = numbers.copy()
    length_numbers = len(new_list)

    for element in range(length_numbers):
        for num_pos in range(0, length_numbers - element - 1):
            if new_list[num_pos] > new_list[num_pos + 1]:
                current_pos = new_list[num_pos]
                new_list[num_pos] = new_list[num_pos + 1]
                new_list[num_pos + 1] = current_pos

    sorted_numbers = new_list

    return sorted_numbers


if __name__ == '__main__':
    run([4, 2, 9, 7, 1, 8])

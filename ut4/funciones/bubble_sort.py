# **********************
# ORDENANDO CON BURBUJAS
# **********************


def bubble(items: list[int]) -> list[str]:
    new_items = items.copy()
    length_numbers = len(new_items)

    for element in range(length_numbers):
        for num_pos in range(0, length_numbers - element - 1):
            if new_items[num_pos] > new_items[num_pos + 1]:
                current_pos = new_items[num_pos]
                new_items[num_pos] = new_items[num_pos + 1]
                new_items[num_pos + 1] = current_pos

    return new_items

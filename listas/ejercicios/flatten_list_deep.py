# ***************
# APLANA LA LISTA
# ***************


def run(elements: list) -> list:
    new_elements = elements.copy()
    box = [new_elements]
    flatten_elements = []
    
    while box:
        current_list = box.pop()
        while current_list:
            element = current_list.pop(0)
            if isinstance(element,list):
                box.append(current_list)
                current_list = element
            else:
                flatten_elements.append(element)
        else:
            if box:
                current_list = box.pop()
                box.append(current_list)

    return flatten_elements


if __name__ == '__main__':
    run(
        [
            0,
            10,
            [20, [-10, [5, 5, 5], -20], 30],
            40,
            50,
            [60, 70, [-1, -2, -3], 80],
            [90, 100, 110, 120],
        ]
    )

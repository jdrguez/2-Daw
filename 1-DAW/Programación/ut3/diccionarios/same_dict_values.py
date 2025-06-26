# ******************************
# VALORES IGUALES EN DICCIONARIO
# ******************************


def run(items: dict) -> bool:
    all_same = True
    current_item = []
    for v in items.values():
        current_item.append(v)
        if v != current_item[0]:
            all_same = False
            break

    return all_same


if __name__ == '__main__':
    run({'a': 1, 'b': 1, 'c': 1, 'd': 1})

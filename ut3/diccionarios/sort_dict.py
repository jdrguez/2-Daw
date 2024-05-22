# *********************
# ORDENE MI DICCIONARIO
# *********************


def run(unsorted_items: dict) -> list:
    sorted_items_reverse = sorted(([ (v, k) for k, v in unsorted_items.items()]))
    sorted_items = [(k, v) for v, k in sorted_items_reverse]
    return sorted_items


if __name__ == '__main__':
    run({'a': 'two', 'b': 'one', 'c': 'three'})
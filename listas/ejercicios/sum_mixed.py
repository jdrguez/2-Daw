# ****************
# SUMA HETEROGÉNEA
# ****************


def run(items: list) -> int:
    sum_items = 0
    for element in items:
        if isinstance(element,str):
            sum_items += int(element)
        else:
            sum_items += element
            
    return sum_items


if __name__ == '__main__':
    run([1, '2', 3, '4', 5])
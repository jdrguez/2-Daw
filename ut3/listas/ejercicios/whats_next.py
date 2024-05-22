# *********************
# ¿QUÉ ES LO SIGUIENTE?
# *********************


def run(items: list, ref_item: object) -> object:
    index_ref = -1
    for i,item in enumerate(items):
        if item == ref_item:
            index_ref = i
            break
    if index_ref != -1 and index_ref + 1 <len(items):
        target_item = items[index_ref + 1]
    else:
        target_item = None
        

    return target_item


if __name__ == '__main__':
    run([1, 2, 3, 4, 5, 6, 7], 3)
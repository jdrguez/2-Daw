# *****************
# MENOR ID SIN USAR
# *****************


def run(ids: list) -> int:
    ids.sort()
    smallest_unused_id = 1
    for identificator in ids:
        if identificator == smallest_unused_id:
            smallest_unused_id += 1
        elif identificator > smallest_unused_id:
            break
    return smallest_unused_id


if __name__ == '__main__':
    run([3, 1, 8, 4, 9])
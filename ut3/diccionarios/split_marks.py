# *********************
# CADA NOTA EN SU SITIO
# *********************


def run(marks: dict) -> tuple:
    passed = {k.upper(): v for k, v in marks.items() if v > 4}
    failed = {k.lower(): v for k, v in marks.items() if v < 5}
    return passed, failed


if __name__ == '__main__':
    run({'Ana': 4, 'Domingo': 7, 'Eva': 5, 'Álvaro': 3, 'Juan': 8, 'Belén': 1})

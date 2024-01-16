# **********************
# BORRANDO VALORES CLAVE
# **********************


def run(items: dict) -> dict:
    citems = items.copy()
    for k, v in citems.items():
        citems[k] = []
    

    return citems


if __name__ == '__main__':
    run({'C1': [10, 20, 30], 'C2': [20, 30, 40], 'C3': [12, 34]})
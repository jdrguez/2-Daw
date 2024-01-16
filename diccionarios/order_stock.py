# ***********
# ¿HAY STOCK?
# ***********


def run(stock: dict, merch: str, amount: int) -> bool:
    available = False
    for k, v in stock.items():
        if k == merch and v >= amount:
            available = True
            break
    

    return available


if __name__ == '__main__':
    run({'pen': 20, 'cup': 11, 'keyring': 40}, 'cup', 9)
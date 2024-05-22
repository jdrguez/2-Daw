# **************************
# AQUÍ TIENE SU VUELTA (MAX)
# **************************


def run(to_give_back: float, available_currencies: dict) -> dict:
    money_back = {}
    max_to_min_currencies = sorted(available_currencies.keys(), reverse=True)
    
    for currency in max_to_min_currencies:
        change = min(available_currencies[currency], to_give_back // currency)
        if change > 0:
            money_back[currency] = change
            to_give_back -= change * currency
            
    if to_give_back == 0:
        money_back
    else:
        money_back = None

    return money_back


if __name__ == '__main__':
    run(20, {5: 3, 2: 7, 1: 3})
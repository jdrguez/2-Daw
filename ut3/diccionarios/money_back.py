# ********************
# AQUÍ TIENE SU VUELTA
# ********************


def run(to_give_back: float, available_currencies: list) -> dict:
    money_back = {}
    max_to_min_currencies = sorted(available_currencies, reverse=True)
    
    for num in max_to_min_currencies:
        change =  to_give_back // num
        if change > 0:
            currency = int(to_give_back // num)
            money_back[num] = currency
            to_give_back -= currency * num
    
    if to_give_back == 0:
        money_back
    else:
        money_back = None
    

    return money_back


if __name__ == '__main__':
    run(20, [5, 2, 1])
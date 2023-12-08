# **************
# EL LOBO ACECHA
# **************


def run(farm: list) -> str:
    n = len(farm)
    msg = ''
    for character in range(n - 1, 0 , -1):
        if farm[character] == 'lobo':
            if character == n - 1:
                msg = f'No te quiero ver más por aqui,lobo'
            else:
                msg = f'Cuidado oveja {n - character}, el lobo te va a comer'


    return msg


if __name__ == '__main__':
    run(['oveja', 'oveja', 'lobo', 'oveja'])
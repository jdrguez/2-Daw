# **************
# EL LOBO ACECHA
# **************


def run(farm: list) -> str:
    length_farm = len(farm)
    msg = ''
    for character in range(length_farm - 1, -1 , -1):
        if farm[character] == 'lobo':
            if character == length_farm - 1:
                msg = f'No te quiero ver más por aquí, lobo'
            else:
                msg = f'Cuidado oveja {length_farm - character - 1}, el lobo te va a comer'


    return msg


if __name__ == '__main__':
    run(['oveja', 'oveja', 'lobo', 'oveja'])
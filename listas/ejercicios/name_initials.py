# **********************
# INICIALES DE UN NOMBRE
# **********************


def run(fullname: str) -> str:
    fullname_parts = fullname.split(', ')
    surname_parts = fullname.split(' ')
    first_surname_initial = surname_parts[0][0].upper()
    second_surname_initial = surname_parts[1][0].upper() if len(surname_parts) == 1 else None
    name = fullname_parts[1][0].upper()
    initials = f'{name}.{first_surname_initial}.{second_surname_initial}.'
    

    return initials


if __name__ == '__main__':
    run('Delgado Quintero, sergio')
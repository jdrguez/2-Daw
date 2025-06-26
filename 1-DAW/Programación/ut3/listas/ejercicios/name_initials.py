# **********************
# INICIALES DE UN NOMBRE
# **********************


def run(fullname: str) -> str:
    parts = [part.strip() for part in fullname.split(',')]
    first_name_initials = parts[1][0].upper() if len(parts) > 1 else ''
    last_name_initials = '.'.join([part[0].upper() for part in parts[0].split()]) if len(parts) > 0 else ''
    initials = f'{first_name_initials}.{last_name_initials}.'
    

    return initials


if __name__ == '__main__':
    run('Delgado Quintero, sergio')
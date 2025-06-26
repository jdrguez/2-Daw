# *****************
# FICHO CUANDO TOCA
# *****************


def run(time: str, offset: int) -> str:
    time_parts = time.split(':')
    hours = int(time_parts[0])
    minutes = int(time_parts[1])
    
    new_minutes = (hours * 60 + minutes + offset) % (24 * 60)
    new_hours = new_minutes // 60
    new_minutes %= 60
    
    final_time = f'{new_hours}:{new_minutes}'

    return final_time


if __name__ == '__main__':
    run('17:15', 240)
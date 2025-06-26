# **************************************************
# IDENTIFICANDO SECUENCIAS CONSECUTIVAS DE UN TAMAÑO
# **************************************************


def consecutive_seq(items: list, target_count: int) -> int:
    index = 0
    if index >= len(items) - target_count + 1:
        return False
    
    for item_pos, item in enumerate(target_count):
        if items[item_pos] != items[index]:
            return False
    
    return items[index]
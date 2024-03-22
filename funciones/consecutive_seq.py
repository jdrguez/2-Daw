# **************************************************
# IDENTIFICANDO SECUENCIAS CONSECUTIVAS DE UN TAMAÑO
# **************************************************


def consecutive_seq(items:list, target_count:int)-> int:
    for char in items:
        if char == items[char - 1]:
            
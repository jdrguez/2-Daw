# *************************
# MOVIMIENTOS DE INVENTARIO
# *************************


def run(imoves: str) -> dict:
    cleaned_inventory = imoves.split(',')
    inventory = {}
    for element in cleaned_inventory:
        article, stock = element[:1], int(element[1:])
        if article in inventory:
            inventory[article] += stock
        else:
            inventory[article] = stock
    
   
    
    
    
            

    return inventory


if __name__ == '__main__':
    run('A1,B4,A-2,A7,B1,C4')
# ****************
# YELLOW SUBMARINE
# ****************
from pathlib import Path


def run(route_path: Path) -> tuple:
    distance = depth = fuel = 0

    with open(route_path, 'r') as route:
        fuel = int(route.readline().strip())
        moves = route.readline().strip().split(',')
        for move in moves:
            x, y = move.split(':')
            x = int(x)
            y = int(y)
            
            distance += x
            depth += y
            consume = 3 * abs(x) + 2 * abs(y)
            fuel -= consume
            
            if fuel < 0 or depth <= 0 or depth >= 600:
                break
               
    return distance, depth, fuel


if __name__ == '__main__':
    run('data/submarine/route1.dat')
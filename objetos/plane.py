class Plane:
    BLACKBOX = True
    def __init__(self, fuel_capacity: float, max_passengers: int, storage_capacity: float,
                 manufacturer: str, model: str, reactor: bool = True):
        self.fuel_capacity = fuel_capacity
        self.max_passengers = max_passengers
        self.storage_capacity = storage_capacity
        self.manufacturer = manufacturer
        self.model = model
        self.reactor = reactor
        self.doors = {'d1': True, 'd2': True, 'd3': True, 'd4': True, 'd5': True, 'd6': True}
        
    def close_doors(self):
        self.doors = {'d1': False, 'd2': False, 'd3': False, 'd4': False, 'd5': False, 'd6': False}
    

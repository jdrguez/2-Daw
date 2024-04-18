class Plane:
    BLACKBOX = True
    count = 0
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
    
    def remaining_storage_cpty(self, current_load: float) -> float:
        return self.storage_capacity - current_load

    def requires_refuel(self, distance_to_travel: float, fuel_consumption_per_km: float) -> float:
        required_fuel = distance_to_travel * fuel_consumption_per_km
        return required_fuel > self.fuel_capacity
    
    def calculate_distance_fuel(distance: float, fuel_consumption_per_km: float) -> float:
        return distance * fuel_consumption_per_km
    
    @staticmethod
    def get_types_of_plane() -> tuple[str]:
        return ('Passenger', 'Cargo', 'Military')
    
    @classmethod
    def total_planes(cls) -> None:
        print(f'{cls.count} total planes built!!!')
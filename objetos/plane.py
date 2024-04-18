class Plane:
    BLACKBOX = True
    count = 0

    def __init__(
        self,
        fuel_capacity: float,
        max_passengers: int,
        storage_capacity: float,
        manufacturer: str,
        model: str,
        reactor: bool = True,
    ):
        self.fuel_capacity = fuel_capacity
        self.max_passengers = max_passengers
        self.storage_capacity = storage_capacity
        self.manufacturer = manufacturer
        self.model = model
        self.reactor = reactor
        self.doors = {'d1': True, 'd2': True, 'd3': True, 'd4': True, 'd5': True, 'd6': True}
        self.seats = [
            [{'1A': False, '1B': False, '1C': False, '1D': False, '1E': False, '1F': False}],
            [{'2A': False, '2B': False, '2C': False, '2D': False, '2E': False, '2F': False}],
            [{'3A': False, '3B': True, '3C': False, '3D': False, '3E': False, '3F': False}],
            [{'4A': False, '4B': False, '4C': False, '4D': False, '4E': False, '4F': False}],
            [{'5A': False, '5B': False, '5C': False, '5D': False, '5E': False, '5F': True}],
        ]

    def close_doors(self):
        self.doors = {'d1': False, 'd2': False, 'd3': False, 'd4': False, 'd5': False, 'd6': False}

    def remaining_storage_cpty(self, current_load: float) -> float:
        return self.storage_capacity - current_load

    def requires_refuel(self, distance_to_travel: float, fuel_consumption_per_km: float) -> float:
        required_fuel = distance_to_travel * fuel_consumption_per_km
        return required_fuel > self.fuel_capacity

    def calculate_distance_fuel(self, distance: float, fuel_consumption_per_km: float) -> float:
        return distance * fuel_consumption_per_km

    @staticmethod
    def get_types_of_plane() -> tuple[str, ...]:
        return ('Passenger', 'Cargo', 'Military')

    @classmethod
    def total_planes(cls) -> None:
        print(f'{cls.count} total planes built!!!')

    def get_total_passengers(self) -> int:
        total_passenger = 0
        for seats in self.seats:
            for row in seats:
                for seat in row.values():
                    if seat:
                        total_passenger += 1

        return total_passenger

    def is_overbooking(self) -> bool:
        return self.get_total_passengers() > self.max_passengers


myplane = Plane(
    fuel_capacity=1258.97,
    max_passengers=30,
    storage_capacity=1968.25,
    manufacturer="Airbus",
    model='A987',
    reactor=True,
)

print(myplane.get_total_passengers())

print(myplane.is_overbooking())

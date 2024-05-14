from __future__ import annotations


class Date:
    MONTH_NAMES = [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Mayo',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre',
    ]
    WEEK_DAYS = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']

    def __init__(self, day: int, month: int, year: int):
        '''Validar día, mes y año. Se comprobará si la fecha es correcta
        (entre el 1-1-1900 y el 31-12-2050); si el día no es correcto, lo pondrá a 1;
        si el mes no es correcto, lo pondrá a 1; y si el año no es correcto, lo pondrá a 1900.
        Ojo con los años bisiestos.
        El 1-1-1900 fue lunes.
        '''
        self.day = day
        self.month = month
        self.year = year
        if self.day > 31 or self.day < 1:
            self.day = 1
        if self.month > 12 or self.month < 1:
            self.month = 1
        if self.year > 2050 or self.year < 1900:
            self.year = 1900

    @staticmethod
    def is_leap_year(year: int) -> bool:
        return year % 4 == 0 and year % 100 != 0

    @staticmethod
    def days_in_month(month: int, year: int) -> int:
        thirty_one_months = [1, 3, 5, 7, 8, 10, 12]
        thirty_months = [4, 6, 9, 11]
        total_days = 0

        if month in thirty_one_months:
            total_days = 31
        elif month in thirty_months:
            total_days = 30
        elif month == 2:
            total_days = 28
            if Date.is_leap_year(year):
                total_days = 29

        return total_days

    def get_total_days(self) -> int:
        total_years = self.year - 1900 - 1
        return sum([366 for year in range(total_years + 1) if Date.is_leap_year(year)]) + sum(
            [365 for year in range(total_years + 1) if not Date.is_leap_year(year)]
        )

    def get_delta_days(self) -> int:
        '''Número de días transcurridos desde el 1-1-1900 hasta la fecha'''
        total_days_without_date = self.get_total_days()
        current_days_in_date = sum(
            [self.days_in_month(month, self.year) for month in range(self.month)]
        )
        return total_days_without_date + current_days_in_date + self.day - 1

    @property
    def weekday(self) -> int:
        '''Día de la semana de la fecha (0 para domingo, ..., 6 para sábado).'''
        month = self.month
        year = self.year
        day = self.day

        if month < 3:
            month += 12
            year -= 1

        century_year = self.year % 100
        century = self.year // 100

        zeller_form = (
            day
            + ((13 * (month + 1)) // 5)
            + century_year
            + (century_year // 4)
            + (century // 4)
            - (2 * century)
        )
        weekday = zeller_form % 7 - 1

        return weekday

    @property
    def is_weekend(self) -> bool:
        return self.weekday == 6 or self.weekday == 0

    @property
    def short_date(self) -> str:
        '''02/09/2003'''
        return f'{self.day:02d}/{self.month:02d}/{self.year}'

    def __str__(self):
        '''MARTES 2 DE SEPTIEMBRE DE 2003'''
        return f'{self.WEEK_DAYS[self.weekday]} {self.day} de {self.MONTH_NAMES[self.month - 1]} de {self.year}'.upper()

    def __add__(self, days: int) -> Date:
        '''Sumar un número de días a la fecha'''
        new_year = self.year
        new_month = self.month
        new_day = self.day + days

        while new_day > self.days_in_month(new_month, new_year):
            current_day_in_month = self.days_in_month(new_month, new_year)
            new_day -= current_day_in_month
            new_month += 1
            if new_month > 12:
                new_month = 1
                new_year += 1

        return Date(new_day, new_month, new_year)

    def __sub__(self, other: Date | int) -> int | Date:
        '''Dos opciones:
        1) Restar una fecha a otra fecha -> Número de días
        2) Restar un número de días la fecha -> Nueva fecha'''

        if isinstance(other, Date):
            total_days_without_date_self = self.get_total_days()
            total_days_without_date_other = other.get_total_days()
            actual_self_days = (
                sum([self.days_in_month(month, self.year) for month in range(self.month)])
                + self.day
            )
            actual_other_days = (
                sum([other.days_in_month(month, other.year) for month in range(other.month)])
                + other.day
            )
            self_days = total_days_without_date_self + actual_self_days
            other_days = total_days_without_date_other + actual_other_days
            return self_days - other_days

        elif isinstance(other, int):
            new_year = self.year
            new_month = self.month
            new_day = self.day

            while other > 0:
                if new_day > 1:
                    new_day -= 1
                else:
                    if new_month > 1:
                        new_month -= 1
                    else:
                        new_month = 12
                        new_year -= 1
                    new_day = self.days_in_month(new_month, new_year)
                other -= 1

            return Date(new_day, new_month, new_year)

    def __lt__(self, other) -> bool:
        if self.year < other.year:
            return True
        elif self.year == other.year:
            if self.month < other.month:
                return True
            elif self.month == other.month:
                return self.day < other.day
        return False

    def __gt__(self, other) -> bool:
        if self.year > other.year:
            return True
        elif self.year == other.year:
            if self.month > other.month:
                return True
            elif self.month == other.month:
                return self.day > other.day
        return False

    def __eq__(self, other) -> bool:
        return self.year == other.year and self.month == other.month and self.day == other.day

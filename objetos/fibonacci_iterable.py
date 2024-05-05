# ******************
# FIBONACCI ITERABLE
# ******************
class Fibonacci:
    def __init__(self, limit_range: int) -> None:
        self.limite_range = limit_range
        self.start_num = 0
        self.next_num = 1
        self.pointer = 0
    def __iter__(self):
        return self
    
    def __next__(self):
        if self.pointer == self.limite_range:
            raise StopIteration
        if self.pointer == 0:
            self.pointer += 1
            return self.start_num
        self.start_num, self.next_num = self.next_num, self.start_num + self.next_num
        self.pointer += 1
        return self.start_num
    


def run(n: int) -> list:
    return [num for num in Fibonacci(n)]


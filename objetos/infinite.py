class InfiniteList:
    def __init__(self, *args, fill_value=None):
        self.items = [arg for arg in args]
        self.fill_value = fill_value

    def __getitem__(self, index: int):
        return self.items[index]

    def __len__(self):
        return len(self.items)

    def __setitem__(self, index: int, item) -> None:
        if index > len(self.items):
            for _ in range(index + 1):
                self.items.append(self.fill_value)
                self.items[index] == item
        else:
            self.items[index] = item

    def __str__(self):
        return f'{self.items}'

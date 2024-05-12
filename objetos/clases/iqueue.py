from __future__ import annotations


class IntegerQueue:
    '''
    Cola de enteros:
    ╔══════╦═══╦═══╦═══╦═══╗
    ║ HEAD ║ 4 ║ 3 ║ 5 ║ 7 ║
    ╚══════╩═══╩═══╩═══╩═══╝
    '''

    def __init__(self, *, max_size: int = 10):
        '''Utilizar atributo items para guardar los elementos'''
        self.items = []
        self.max_size = max_size
        ...

    def enqueue(self, item: int) -> bool:
        '''Añade item a la cola.
        Si la cola está llena retornar False, en otro caso retornar True'''
        if len(self.items) < self.max_size:
            self.items.append(item)
            return True
        return False
        ...

    def dequeue(self) -> int:
        '''Extraer el elemento que está en el HEAD de la cola'''
        return self.items.pop(0)

    def head(self) -> int:
        '''Devolver el elemento que está en el HEAD de la cola (sin extracción)'''
        return self.items[0]

    def is_empty(self) -> bool:
        '''Indica si la cola está vacía'''
        return not self.items

    def is_full(self) -> bool:
        '''Indica si la cola está llena -> max_size'''
        return len(self.items) == self.max_size
    def expand(self, factor: int = 2) -> None:
        '''Expande el tamaño máximo de la cola en el factor indicado'''
        self.max_size *= factor
        return None

    def dump_to_file(self, path: str) -> None:
        '''Vuelca la cola a un fichero.
        - Todos los elementos en una misma línea separados por comas.
        - El primer elemento del fichero corresponde con el HEAD de la cola.'''
        with open(path, 'w') as f:
            for item in self.items[:len(self.items) - 1]:
                f.write(str(item) + ',')
            if self.items:
                f.write(str(self.items[-1]))

    @classmethod
    def load_from_file(cls, path: str) -> IntegerQueue:
        '''Crea una cola desde un fichero.
        - Todos los elementos en una misma línea separados por comas.
        - El primer elemento del fichero corresponde con el HEAD de la cola.
        - Si la cola se llena al ir añadiendo elementos habrá que expandir con los valores
        por defecto'''
        new_queue = IntegerQueue()
        content = open(path).readline().split(",")
        for num in content:
            element = int(num)
            if not new_queue.enqueue(element):
               new_queue.expand()
               new_queue.enqueue(element)
        return new_queue

    def __getitem__(self, index: int) -> int:
        '''Devuelve el elemento de la cola en el índice indicado'''
        return self.items[index]

    def __setitem__(self, index: int, item: int) -> None:
        '''Establece el valor de un elemento de la cola mediante el índice indicado'''
        if index < len(self.items):
            self.items[index] = item
        else:
            raise IndexError

    def __len__(self):
        '''Número de elementos que contiene la cola'''
        return len(self.items)

    def __str__(self):
        '''Todos los elementos de la cola separados por coma empezando por el HEAD'''
        return ','.join([str(num) for num in self.items])

    def __add__(self, other: IntegerQueue) -> IntegerQueue:
        '''Sumar dos colas.
        - La segunda cola va "detrás" de la primera
        - El tamaño máximo de la cola resultante es la suma de los tamaños
        máximos de cada cola.'''
        new_stack = IntegerQueue(max_size= self.max_size + other.max_size)
        new_stack.items = self.items + other.items
        return new_stack

    def __iter__(self) -> IntegerQueueIterator:
        return IntegerQueueIterator(self)


class IntegerQueueIterator:
    def __init__(self, queue: IntegerQueue):
        self.queue = queue
        self.pointer = 0

    def __next__(self) -> int:
        if self.pointer >= len(self.queue.items):
            raise StopIteration
        queue = self.queue.items[self.pointer]
        self.pointer += 1
        return queue

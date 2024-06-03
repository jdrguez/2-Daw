from __future__ import annotations

import sqlite3

DB_PATH = 'todo.db'
TASK_DONE_SYMBOL = '✔'
TASK_PENDING_SYMBOL = '⎕'


def create_db(db_path: str) -> None:
    con = sqlite3.connect(db_path)
    con.row_factory = sqlite3.Row
    cur = con.cursor()
    """Crea la base de datos y la siguiente tabla:
    - tasks (id, name, done)
        └ id es la clave primaria identificador numérico
        └ name es el nombre/descripción de la tarea
        └ done indica si la tarea está hecha o no"""

    sql = '''
    DROP TABLE if exists tasks;
    CREATE TABLE tasks(
        id INT PRIMARY KEY,
        name TEXT,
        done BOOLEAN
    )'''
    cur.executescript(sql)
    con.commit()
    con.close()

class Task:
    """Crear atributos de clase:
    - con: para la conexión a la base de datos. Establecer consultas como "filas".
    - cur: para el cursor de manejo."""

    create_db(DB_PATH)
    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    cur = con.cursor()

    def __init__(self, name: str, done: bool = False, id: int = -1):
        """Crea los atributos homónimos a los parámetros"""
        self.name = name
        self.done = done
        self.id = id

    def save(self):
        """Guarda esta tarea en la base de datos.
        El identificador asignado en la base de datos se debe usar para actualizar el
        atributo id de la tarea."""
        sql = 'INSERT INTO tasks (name, done) VALUES (:name, :done)'
        Task.cur.execute(sql, dict(name=self.name, done=self.done))
        self.id = Task.cur.lastrowid
        Task.con.commit()
    
    def update(self):
        """Actualiza la tarea (nombre y estado) en la base de datos"""
        sql = '''UPDATE tasks SET name = :name, done = :done WHERE id = :id'''
        Task.cur.execute(sql, dict(name=self.name, done=self.done, id=self.id))
        Task.con.commit()

    def check(self):
        """Marca la tarea como completada. Haz uso también de .update()"""
        self.done = True
        self.update()

    def uncheck(self):
        """Marca la tarea como no completada. Haz uso también de .update()"""
        self.done = False
        self.update()

    def __repr__(self):
        """Muestra la tarea en formato:
        <SYMBOL> <name> (id=<id>)"""
        symbol = TASK_DONE_SYMBOL if self.done else TASK_PENDING_SYMBOL
        return f'{symbol} {self.name} (id={self.id})'
        

    @classmethod
    def from_db_row(cls, row: sqlite3.Row) -> Task:
        """Construye una nueva tarea a partir de una fila de consulta devuelta por execute()"""
        return Task(name=row['name'], done=row['done'], id=row['id'])

    @classmethod
    def get(cls, task_id: int) -> Task:
        """Devuelve un objeto Task desde la consulta a la base de datos"""
        sql = 'SELECT * FROM tasks WHERE id = :id'
        result = Task.cur.execute(sql, dict(id=task_id))
        row = result.fetchone()
        return cls.from_db_row(row)


class ToDo:
    """Crear atributos de clase:
    - con: para la conexión a la base de datos. Establecer consultas como "filas".
    - cur: para el cursor de manejo."""

    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    cur = con.cursor()

    def get_tasks(self, *, done: int = -1):
        """Devuelve todas las tareas como objetos de tipo Task consultando la BBDD.
        - Si done = 0 se devuelven las tareas pendientes.
        - Si done = 1 se devuelven las tareas completadas.
        Ojo! Esto es una función generadora."""
        sql = 'SELECT * FROM tasks'
        match done:
            case 0:
                sql = 'SELECT * FROM tasks WHERE done = 0'
            case 1:
                sql = 'SELECT * FROM tasks WHERE done = 1'
        ToDo.cur.execute(sql)
        rows = ToDo.cur.fetchall()
        for row in rows:
            yield Task.from_db_row(row)

    def add_task(self, name: str):
        '''Añade la tarea con nombre "name"'''
        new_task = Task(name)
        new_task.save()

    def complete_task(self, task_id: int):
        """Marca la tarea con identificador "task_id" como completada"""
        task = Task.get(task_id)
        task.check()
    def reopen_task(self, task_id: int):
        """Marca la tarea con identificador "task_id" como pendiente"""
        task = Task.get(task_id)
        task.uncheck()
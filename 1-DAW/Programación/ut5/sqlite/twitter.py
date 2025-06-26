from __future__ import annotations

import re
import sqlite3

DB_PATH = 'twitter.db'

TWEET_EMOJI = '🐦'
RETWEET_EMOJI = '🔁'
MAX_TWEET_LENGTH = 280


def create_db(db_path: str = DB_PATH) -> None:
    """Crea la base de datos y las siguientes tablas:
    - user (id, username, password, bio)
    - tweet (id, content, user_id, retweet_from)
        └ user_id es clave ajena de user(id)
        └ retweet_from es clave ajena de tweet(id)"""
    with sqlite3.connect(DB_PATH) as con:
        con.row_factory = sqlite3.Row
        cur = con.cursor()
        
        sql = '''
        DROP TABLE IF EXISTS user;
        CREATE TABLE user(
            id INTEGER PRIMARY KEY,
            username TEXT,
            password TEXT,
            bio TEXT
        );
        DROP TABLE IF EXISTS tweet;
        CREATE TABLE tweet(
            id INTEGER PRIMARY KEY,
            content TEXT,
            user_id INTEGER REFERENCES user(id),
            retweet_from INTEGER REFERENCES tweet(id)
        )
        '''
        cur.executescript(sql)
        con.commit()
class User:
    def __init__(self, username: str, password: str, bio: str = '', user_id: int = 0):
        """Constructor de la clase User.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row).
        - Crea los atributos username, password, bio, id y logged.
        """
        self.username = username
        self.password = password
        self.bio = bio
        self.user_id = user_id
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()
        self.logged = False

    def save(self) -> None:
        if self.user_id == 0:
            sql = '''INSERT INTO user (username, password, bio) VALUES (?, ?, ?)'''
            self.cur.execute(sql, (self.username, self.password, self.bio))
            self.con.commit()
            self.user_id = self.cur.lastrowid
        else:
            sql = '''UPDATE user SET username = ?, password = ?, bio = ? WHERE id = ?'''
            self.cur.execute(sql, (self.username, self.password, self.bio, self.user_id))
            self.con.commit()

    def login(self, password: str) -> None:
        sql = '''SELECT * FROM user WHERE username = ? AND password = ?'''
        self.cur.execute(sql, (self.username, password))
        row = self.cur.fetchone()
        if row:
            self.logged = True
            self.user_id = row['id']
            self.bio = row['bio']
        else:
            raise TwitterError(f"User {self.username} login failed!")

    def tweet(self, content: str) -> Tweet:
        if not self.logged:
            raise TwitterError(f"User {self.username} is not logged in!")
        if len(content) > MAX_TWEET_LENGTH:
            raise TwitterError("Tweet has more than 280 chars!")
        tweet = Tweet(content=content)
        tweet.save(self)
        return tweet

    def retweet(self, tweet_id: int) -> Tweet:
        if not self.logged:
            raise TwitterError(f"User {self.username} is not logged in!")
        sql = '''SELECT * FROM tweet WHERE id = ?'''
        self.cur.execute(sql, (tweet_id,))
        row = self.cur.fetchone()
        if not row:
            raise TwitterError(f"Tweet with id {tweet_id} does not exist!")
        retweet = Tweet(retweet_from=tweet_id)
        retweet.save(self)
        return retweet

    @property
    def tweets(self):
        sql = '''SELECT * FROM tweet WHERE user_id = ?'''
        self.cur.execute(sql, (self.user_id,))
        rows = self.cur.fetchall()
        for row in rows:
            yield Tweet.from_db_row(row)

    def __repr__(self):
        return f"{self.username}: {self.bio}"

    @classmethod
    def from_db_row(cls, row: sqlite3.Row):
        return cls(username=row['username'], password=row['password'], bio=row['bio'], user_id=row['id'])


class Tweet:
    def __init__(self, content: str = '', retweet_from: int = 0, tweet_id: int = 0):
        """Constructor de la clase Tweet.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row)
        - Crea los atributos _content, retweet_from e id.
        - retweet_from indica el id del tweet que se retuitea.
          Un id válido debe ser mayor o igual que 1.
        - Si es un retweet el contenido debe ser la cadena vacía.
        """
        self._content = content
        self.retweet_from = retweet_from
        self.id = tweet_id
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()

    @property
    def is_retweet(self) -> bool:
        return self.retweet_from > 0

    @property
    def content(self) -> str:
        if self.is_retweet:
            sql = '''SELECT content FROM tweet WHERE id = ?'''
            self.cur.execute(sql, (self.retweet_from,))
            row = self.cur.fetchone()
            if row:
                return row['content']
        return self._content

    def save(self, user: User) -> None:
        if self.is_retweet:
            sql = '''INSERT INTO tweet (content, user_id, retweet_from) VALUES (?, ?, ?)'''
            self.cur.execute(sql, ('', user.user_id, self.retweet_from))
        else:
            sql = '''INSERT INTO tweet (content, user_id) VALUES (?, ?)'''
            self.cur.execute(sql, (self._content, user.user_id))
        self.con.commit()
        self.id = self.cur.lastrowid

    def __repr__(self):
        emoji = RETWEET_EMOJI if self.is_retweet else TWEET_EMOJI
        return f"{emoji} {self.content} (id={self.id})"

    @classmethod
    def from_db_row(cls, row: sqlite3.Row) -> Tweet:
        return cls(content=row['content'], retweet_from=row['retweet_from'], tweet_id=row['id'])


class Twitter:
    def __init__(self):
        """Constructor de la clase Twitter.
        - Crea los atributos con y cur para la conexión a la base de datos (con factoría Row)
        """
        self.con = sqlite3.connect(DB_PATH)
        self.con.row_factory = sqlite3.Row
        self.cur = self.con.cursor()

    def add_user(self, username: str, password: str, bio: str = '') -> User:
        if not re.match(r'^[=@]\d{2,4}[A-Za-z]{2,4}[!*]$', password):
            raise TwitterError("Password does not follow security rules!")
        user = User(username, password, bio)
        user.save()
        return user

    def get_user(self, user_id: int) -> User:
        sql = '''SELECT * FROM user WHERE id = ?'''
        self.cur.execute(sql, (user_id,))
        row = self.cur.fetchone()
        if not row:
            raise TwitterError(f"User with id {user_id} does not exist!")
        return User.from_db_row(row)

class TwitterError(Exception):
    pass

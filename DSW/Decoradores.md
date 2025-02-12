# Decoradores importantísimos de error
```python
import json
import re
from json.decoder import JSONDecodeError

from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.http import JsonResponse

from orders.models import Order


""" 
def auth_required(func):
    def wrapper(request, *args, **kwargs):
        json_post = json.loads(request.body)
        print(json_post)
        user = get_user_model()
        try:
            user = user.objects.get(token__key=json_post['token'])
            request.json_post = json_post
            return func(request, *args, **kwargs)
        except user.DoesNotExist:
            return JsonResponse({'error': 'Invalid token'}, status=401)

    return wrapper """
```
## Saber si un usario esta autentificado
```python
def auth_required(func):
    def wrapper(request, *args, **kwargs):
        if user := authenticate(
            username=request.json_body['username'], password=request.json_body['password']
        ):
            request.user = user
            return func(request, *args, **kwargs)
        return JsonResponse({'error': 'Invalid credentials'}, status=401)

    return wrapper
```

## Saber si es el token existe en la base de datos
```python
def token_exists(func):
    def wrapper(request, *args, **kwargs):
        try:
            request.user = User.objects.get(token__key=request.token)
            return func(request, *args, **kwargs)
        except User.DoesNotExist:
            return JsonResponse({'error': 'Unregistered authentication token'}, status=401)

    return wrapper
```

## Saber si el token es válido
```python
def valid_token(func):
    def wrapper(request, *args, **kwargs):
        auth = request.headers.get('Authorization', 'no existe')
        regexp = 'Bearer (?P<token>[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})'
        if auth_value := re.fullmatch(regexp, auth):
            request.token = auth_value['token']
            return func(request, *args, **kwargs)
        return JsonResponse({'error': 'Invalid authentication token'}, status=400)

    return wrapper
```
## Si es post o get
```python
def method_required(method):
    def decorator(func):
        def wrapper(request, *args, **kwargs):
            if request.method == method.upper():
                return func(request, *args, **kwargs)
            return JsonResponse({'error': 'Method not allowed'}, status=405)

        return wrapper

    return decorator
```

## Ver si el Json es correcto
```python
def check_json_body(func):
    def wrapper(request, *args, **kwargs):
        try:
            json_body = json.loads(request.body)
            request.json_body = json_body
            return func(request, *args, **kwargs)
        except JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON body'}, status=400)

    return wrapper
```
## Ver si el usuario es el mismo quién creo eso
```python
def user_owner(func):
    def wrapper(request, *args, **kwargs):
        order = Order.objects.get(pk=kwargs['order_pk'])
        user = request.user
        if order.user == user:
            return func(request, *args, **kwargs)
        return JsonResponse({'error': 'User is not the owner of requested order'}, status=403)

    return wrapper
```
## Si los campos están dentro
```python
def required_fields(*fields):
    def decorator(func):
        def wrapper(request, *args, **kwargs):
            json_body = json.loads(request.body)
            for field in fields:
                if field not in json_body:
                    return JsonResponse({'error': 'Missing required fields'}, status=400)
            return func(request, *args, **kwargs)

        return wrapper

    return decorator
```

# Serializador base

Tiene que ir en shared
```python


import json
from abc import ABC
from typing import Iterable

from django.http import HttpRequest, JsonResponse


class BaseSerializer(ABC):
    def __init__(
        self,
        to_serialize: object | Iterable[object],
        *,
        fields: Iterable[str] = [],
        request: HttpRequest = None,
    ):
        self.to_serialize = to_serialize
        self.fields = fields
        self.request = request

    def build_url(self, path: str) -> str:
        return self.request.build_absolute_uri(path) if self.request else path

    # To be implemented by subclasses
    def serialize_instance(self, instance: object) -> dict:
        raise NotImplementedError

    def __serialize_instance(self, instance: object) -> dict:
        serialized = self.serialize_instance(instance)
        return {f: v for f, v in serialized.items() if not self.fields or f in self.fields}

    def serialize(self) -> dict | list[dict]:
        if not isinstance(self.to_serialize, Iterable):
            return self.__serialize_instance(self.to_serialize)
        return [self.__serialize_instance(instance) for instance in self.to_serialize]

    def to_json(self) -> str:
        return json.dumps(self.serialize())

    def json_response(self) -> str:
```
## Serializador base para cada objeto con many to many dentro
Tienen que tener un archivo serializer.py


```python

from games.serializer import GameSerializer
from shared.serializers import BaseSerializer
from users.serializer import UserSerializer


class OrderSerializer(BaseSerializer):
    def __init__(self, to_serialize, *, fields=[], request=None):
        super().__init__(to_serialize, fields=fields, request=request)

    def serialize_instance(self, instance) -> dict:
        return {
            'id': instance.pk,
            'status': instance.get_status_display(),
            'user': UserSerializer(instance.user, request=self.request).serialize(),
            'key': instance.key if instance.status == 3 else None,
            'games': GameSerializer(instance.games.all(), request=self.request).serialize(),
            'created_at': instance.created_at.isoformat(),
            'updated_at': instance.updated_at.isoformat(),
            'price': float(instance.price),
        }

```
# Decoradores de ejemplo para uno modelo

```python

def game_exist(func):
    def wrapper(*args, **kwargs):
        try:
            game = Game.objects.get(slug=kwargs['game_slug'])
            args[0].game = game
            return func(*args, **kwargs)
        except Game.DoesNotExist:
            return JsonResponse({'error': 'Game not found'}, status=404)

    return wrapper
```
```python
def game_exist_post(func):
    def wrapper(request, *args, **kwargs):
        game_slug = request.json_body['game-slug']
        print(game_slug)
        try:
            game = Game.objects.get(slug=game_slug)
            request.game = game
            return func(request, *args, **kwargs)
        except Game.DoesNotExist:
            return JsonResponse({'error': 'Game not found'}, status=404)

    return wrapper
```
```python
def review_exist(func):
    def wrapper(*args, **kwargs):
        try:
            review = Review.objects.get(pk=kwargs['review_pk'])
            args[0].review = review
            return func(*args, **kwargs)
        except Review.DoesNotExist:
            return JsonResponse({'error': 'Review not found'}, status=404)

    return wrapper


```

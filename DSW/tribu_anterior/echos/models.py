# Create your models here.
from django.conf import settings
from django.db import models


class Echo(models.Model):
    content = models.TextField(max_length=350)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
    )

    def __str__(self):
        return f'Contenido del post:{self.content}, creado en fecha {self.created_at}'

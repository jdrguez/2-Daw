from django.db import models

# Create your models here.


class Task(models.Model):
    name = models.CharField(max_length=100)
    slug = models.SlugField(max_length=150)
    description = models.TextField(max_length=250, blank=True)
    done = models.BooleanField(default=False)
    complete_before = models.DateTimeField(null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.name

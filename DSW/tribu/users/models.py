from django.conf import settings
from django.db import models
from django.urls import reverse


# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='profile'
    )
    avatar = models.ImageField(
        blank=True, null=True, upload_to='avatars', default='avatars/noavatar.png'
    )
    bio = models.TextField(blank=True)

    def __str__(self):
        return self.bio

    def get_absolute_url(self):
        return reverse('users:user-detail', kwargs={'username': self.username})

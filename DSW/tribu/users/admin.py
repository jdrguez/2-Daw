from django.contrib import admin

# Register your models here.
from .models import Profile

# Register your models here.


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ['avatar', 'bio']

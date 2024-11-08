from django.contrib import admin

# Register your models here.
from .models import Wave

# Register your models here.


@admin.register(Wave)
class WaveAdmin(admin.ModelAdmin):
    list_display = ['content', 'created_at', 'updated_at', 'echo']

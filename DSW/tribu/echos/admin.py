from django.contrib import admin

# Register your models here.
from .models import Echo

# Register your models here.


@admin.register(Echo)
class EchoAdmin(admin.ModelAdmin):
    list_display = ['content', 'created_at', 'updated_at', 'user']

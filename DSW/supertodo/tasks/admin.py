from django.contrib import admin

# Register your models here.
from .models import Task

# Register your models here.


@admin.register(Task)
class TaskAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug', 'description', 'created_at', 'done']
    prepopulated_fields = {'slug': ['name']}

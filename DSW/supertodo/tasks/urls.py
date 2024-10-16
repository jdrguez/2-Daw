from django.urls import path

from . import views

app_name = 'tasks'
urlpatterns = [
    path('', views.task_list, name='task-list'),
    path('done/', views.complete_tasks, name='complete-tasks'),
    path('pending/', views.pending_tasks, name='pending-tasks'),
    path('add/', views.add_task, name='add-task'),
    path('delete/', views.delete_task, name='delete-task'),
    path('edit/<task_slug>/', views.edit_task, name='edit-task'),
    path('task/<task_slug>/', views.task_detail, name='task-detail'),
]

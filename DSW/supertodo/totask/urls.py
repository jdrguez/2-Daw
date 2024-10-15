from django.urls import path

from . import views

app_name = 'totask'

urlpatterns = [
    path('', views.home, name='home'),
    path('tasks/<task_slug>/', views.task_detail, name='task_detail'),
    path('task/add', views.add_task, name='add-task'),
    path('done', views.taskdone, name='taskdone'),
    path('pending', views.pendingtasks, name='pendingtasks'),
]

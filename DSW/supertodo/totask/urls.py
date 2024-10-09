from django.urls import path

from . import views

app_name = 'totask'

urlpatterns = [
    path('', views.home, name='home'),
    path('tasks/<task_slug>/', views.task_detail, name='task_detail'),
    path('done', views.taskdone, name='taskdone'),
    path('pending', views.pendingtasks, name='pendingtasks'),
]

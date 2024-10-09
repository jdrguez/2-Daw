from django.urls import path

from . import views

app_name = 'totask'

urlpatterns = [
    path('', views.home, name='home'),
    path('<task_slug>/', views.task_detail, name='task_detail'),
    path('taskdone', views.taskdone, name='taskdone'),
    path('pendingtasks', views.pendingtasks, name='pendingtasks'),
]

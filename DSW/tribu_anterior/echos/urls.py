from django.urls import path

from . import views

app_name = 'echos'

urlpatterns = [
    path('', views.echo_list, name='echo-list'),
    path('add/', views.add_echo, name='add-echo'),
    path('<echo_id>/', views.echo_detail, name='echo-detail'),
    path('<echo_id>/edit/', views.edit_echo, name='edit-echo'),
    path('<echo_id>/delete/', views.delete_echo, name='delete-echo'),
    path('<echo_id>/waves/add/', views.add_wave, name='add-wave'),
    path('<echo_id>/waves/', views.all_waves, name='all-waves'),
]

from django.urls import path

from . import views

app_name = 'waves'

urlpatterns = [path('', views.all_waves, name='all-waves')]

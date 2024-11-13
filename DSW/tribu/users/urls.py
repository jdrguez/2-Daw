from django.urls import path

from users import views

app_name = 'users'

urlpatterns = [
    path('', views.all_users, name='all-users'),
    path('@me/', views.logged_user, name='logged-user'),
    path('<str:username>/', views.user_detail, name='user-detail'),
    path('<str:username>/echos/', views.user_echos, name='user-echos'),
    path('<str:username>/edit/', views.edit_profile, name='edit-profile'),
]

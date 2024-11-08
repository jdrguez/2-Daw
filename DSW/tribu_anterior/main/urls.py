"""
URL configuration for main project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.shortcuts import redirect
from django.urls import include, path
from shared import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', lambda _: redirect('echos:echo-list')),
    path('echos/', include('echos.urls')),
    path('waves/', include('waves.urls')),
    path('login/', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'),
    path('signup/', views.user_signup, name='signup'),
    path('@<username>/', views.show_profile, name='show-profile'),
    path('@<username>/echos/', views.show_user_echos, name='show-user-echos'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

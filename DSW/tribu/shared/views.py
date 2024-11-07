# Create your views here.
from django.contrib.auth import authenticate, get_user_model, login, logout
from django.shortcuts import redirect, render
from echos.models import Echo

from shared.forms import LoginForm, SignupForm


def user_login(request):
    if request.method == 'POST':
        if (form := LoginForm(request.POST)).is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            if user := authenticate(request, username=username, password=password):
                login(request, user)
                return redirect('show-profile', user.username)
    else:
        form = LoginForm()
    return render(request, 'login.html', dict(form=form))


def user_logout(request):
    logout(request)
    return redirect('login')


def show_profile(request, username: str):
    return render(request, 'profile.html', dict(username=username))


def user_signup(request):
    if request.method == 'POST':
        if (form := SignupForm(request.POST)).is_valid():
            user = form.save(commit=False)
            user.set_password(form.cleaned_data['password'])
            user.save()
            login(request, user)
            return redirect('echos:echo-list')
    else:
        form = SignupForm()
    return render(request, 'signup.html', dict(form=form))


def show_user_echos(request, username):
    users = get_user_model()
    user = users.objects.get(username=username)
    echos = Echo.objects.filter(user=user.id)
    return render(request, 'echos/timeline.html', dict(echos=echos))

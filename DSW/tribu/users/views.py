from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from echos.models import Echo

from .forms import EditProfileForm
from .models import Profile

# Create your views here.


def validated_user(func):
    def wrapper(*args, **kwargs):
        user = args[0].user
        profile = Profile.objects.get(user=user)
        if user != profile.user:
            return HttpResponseForbidden('No puedes editar esto')
        return func(*args, **kwargs)

    return wrapper


def get_user(username: str):
    return User.objects.get(username=username)


@login_required
def all_users(request):
    users = User.objects.all()
    return render(request, 'users/all_users.html', dict(users=users))


@login_required
def logged_user(request):
    return redirect('users:user-detail', request.user)


@login_required
def user_detail(request, username: str):
    user = get_user(username)
    echos = Echo.objects.filter(user=user)[:5]

    return render(request, 'users/user_profile.html', dict(user=user, echos=echos))


@login_required
def user_echos(request, username: str):
    user = get_user(username)
    echos = Echo.objects.filter(user=user)

    return render(request, 'users/all_echos.html', dict(user=user, echos=echos))


@login_required
@validated_user
def edit_profile(request, username: str):
    target_user = get_user(username)

    if request.method == 'POST':
        if (form := EditProfileForm(request.POST, instance=target_user)).is_valid():
            target_user = form.save(commit=False)
            target_user.user = request.user
            target_user.save()

            return redirect(target_user)
    else:
        form = EditProfileForm(instance=target_user)

    return render(request, 'echos/modifiers/edit.html', dict(target_user=target_user, form=form))

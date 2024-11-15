from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import HttpResponseForbidden
from django.shortcuts import redirect, render

from echos.models import Echo
from waves.models import Wave

from .forms import EditProfileForm
from .models import Profile

# Create your views here.


def get_user(username: str):
    return User.objects.get(username=username)


def get_echos(user: object):
    return Echo.objects.filter(user=user)


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
    echos = get_echos(user)[:5]
    total_waves = Wave.objects.filter(user=user).count()
    return render(
        request,
        'users/user_profile.html',
        dict(user=user, echos=echos, total_echos=echos.count(), total_waves=total_waves),
    )


@login_required
def user_echos(request, username: str):
    user = get_user(username)
    echos = get_echos(user)

    return render(request, 'users/user_echos.html', dict(user=user, echos=echos))


@login_required
def edit_profile(request, username: str):
    user = User.objects.get(username=username)
    if user == request.user:
        profile = Profile.objects.filter(user=request.user).first()
        if request.method == 'POST':
            if (form := EditProfileForm(request.POST, request.FILES, instance=profile)).is_valid():
                form.save()
                return redirect('users:logged-user')
        else:
            form = EditProfileForm(instance=profile)

        return render(request, 'users/modifiers/edit.html', {'form': form})
    else:
        return HttpResponseForbidden('No puedes editar este perfil')

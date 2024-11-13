from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden
from django.shortcuts import redirect, render

from .forms import AddEchoForm, EditEchoForm
from .models import Echo

# Create your views here.


def validated_user(func):
    def wrapper(*args, **kwargs):
        user = args[0].user
        echo = Echo.objects.get(pk=kwargs['echo_pk'])
        if user != echo.user:
            return HttpResponseForbidden('No puedes editar esto')
        return func(*args, **kwargs)

    return wrapper


@login_required
def echo_list(request):
    echos = Echo.objects.all()
    return render(request, 'echos/timeline.html', dict(echos=echos))


@login_required
def echo_detail(request, echo_pk: int):
    echo = Echo.objects.get(pk=echo_pk)
    waves = echo.waves.all()[:5]
    num_waves = waves.count()

    return render(request, 'echos/detail.html', dict(echo=echo, waves=waves, num_waves=num_waves))


@login_required
def add_echo(request):
    if request.method == 'POST':
        if (form := AddEchoForm(request.POST)).is_valid():
            echo = form.save(commit=False)
            echo.user = request.user
            echo.save()
            return redirect('echos:echo-list')
    else:
        form = AddEchoForm()
    return render(request, 'echos/modifiers/add.html', dict(form=form))


@login_required
@validated_user
def edit_echo(request, echo_pk: int):
    echo = Echo.objects.get(pk=echo_pk)

    if request.method == 'POST':
        if (form := EditEchoForm(request.POST, instance=echo)).is_valid():
            echo = form.save(commit=False)
            echo.user = request.user
            echo.save()

            return redirect(echo)
    else:
        form = EditEchoForm(instance=echo)

    return render(request, 'echos/modifiers/edit.html', dict(echo=echo, form=form))


@login_required
@validated_user
def delete_echo(request, echo_pk: int):
    echo = Echo.objects.get(pk=echo_pk)
    echo.delete()
    return render(request, 'echos/modifiers/delete.html')


@login_required
def all_waves(request, echo_pk: int):
    echo = Echo.objects.get(pk=echo_pk)
    waves = echo.waves.all()

    return render(request, 'echos/all_waves.html', dict(waves=waves, echo=echo))

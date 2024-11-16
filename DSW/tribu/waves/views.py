# Create your views here.
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden
from django.shortcuts import redirect, render
from echos.models import Echo

from .forms import AddWaveForm, EditWaveForm
from .models import Wave


def validated_user(func):
    def wrapper(*args, **kwargs):
        user = args[0].user
        wave = Wave.objects.get(pk=kwargs['wave_pk'])
        if user != wave.user:
            return HttpResponseForbidden('No puedes editar esto')
        return func(*args, **kwargs)

    return wrapper


@login_required
def add_wave(request, echo_pk: int):
    if request.method == 'POST':
        if (form := AddWaveForm(request.POST)).is_valid():
            wave = form.save(commit=False)
            wave.user = request.user
            echo = Echo.objects.get(pk=echo_pk)
            wave.echo = echo
            wave.save()
            return redirect(wave.echo)
    else:
        form = AddWaveForm()
    return render(request, 'waves/modifiers/add.html', dict(form=form))


@login_required
@validated_user
def edit_wave(request, wave_pk: int):
    wave = Wave.objects.get(pk=wave_pk)

    if request.method == 'POST':
        if (form := EditWaveForm(request.POST, instance=wave)).is_valid():
            wave = form.save(commit=False)
            wave.user = request.user
            wave.save()

            return redirect('echos:echo-list')
    else:
        form = EditWaveForm(instance=wave)

    return render(request, 'waves/modifiers/edit.html', dict(wave=wave, form=form))


@login_required
@validated_user
def delete_wave(request, wave_pk: int):
    wave = Wave.objects.get(pk=wave_pk)
    wave.delete()
    return render(
        request,
        'waves/modifiers/delete.html',
    )

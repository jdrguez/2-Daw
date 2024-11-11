# Create your views here.
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden
from django.shortcuts import redirect, render

from .forms import EditWaveForm
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

    return render(request, 'echos/modifiers/add.html', dict(wave=wave, form=form))


def delete_wave(request, wave_pk: int):
    pass

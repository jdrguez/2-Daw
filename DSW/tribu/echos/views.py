from django.shortcuts import redirect, render

from .forms import AddEchoForm, EditEchoForm
from .models import Echo

# Create your views here.


def echo_list(request):
    echos = Echo.objects.all()
    return render(request, 'echos/timeline.html', dict(echos=echos))


def echo_detail(request, echo_id: int):
    echo = Echo.objects.get(id=echo_id)
    return render(request, 'echos/detail.html', dict(echo=echo))


def add_echo(request):
    if request.method == 'POST':
        if (form := AddEchoForm(request.POST)).is_valid():
            echo = form.save()
            echo.save()
            return redirect('echos:echo-list')
    else:
        form = AddEchoForm()
    return render(request, 'echos/modifiers/add.html', dict(form=form))


def edit_echo(request, echo_id: int):
    echo = Echo.objects.get(id=echo_id)

    if request.method == 'POST':
        if (form := EditEchoForm(request.POST, instance=echo)).is_valid():
            echo = form.save(commit=False)
            echo.save()

            return redirect('tasks:echo-list')

    else:
        form = EditEchoForm(instance=echo)

    return render(request, 'echos/modifiers/edit.html', dict(echo=echo, form=form))


def delete_echo(request, echo_pk: int):
    pass


def add_wave(request, echo_pk: int):
    pass


def all_waves(request, echo_pk: int):
    pass

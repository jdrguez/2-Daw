from django.shortcuts import render

from .models import Echo

# Create your views here.


def echo_list(request):
    echos = Echo.objects.all()
    return render(request, 'echos/timeline.html', dict(echos=echos))


def echo_detail(request, echo_pk: int):
    pass


def add_echo(request):
    pass


def edit_echo(request, echo_pk: int):
    pass


def delete_echo(request, echo_pk: int):
    pass


def add_wave(request, echo_pk: int):
    pass


def all_waves(request, echo_pk: int):
    pass

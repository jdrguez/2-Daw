# Create your views here.
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, render

from .forms import SignupForm


@login_required
def user_logout(request):
    logout(request)
    return redirect('login')


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
    return render(request, 'registration/signup.html', dict(form=form))

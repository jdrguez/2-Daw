from django import forms
from django.contrib.auth import get_user_model


class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)


class SignupForm(forms.ModelForm):
    class Meta:
        model = get_user_model()
        fields = ('username', 'password', 'first_name', 'last_name', 'email')
        widgets = dict(password=forms.PasswordInput)
        help_texts = dict(username=None)

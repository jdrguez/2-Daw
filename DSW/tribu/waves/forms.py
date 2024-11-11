from django import forms

from .models import Wave


class AddWaveForm(forms.ModelForm):
    class Meta:
        model = Wave
        fields = ['content']
        widgets = {
            'content': forms.TextInput(attrs={'id': 'post-title'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'


class EditWaveForm(forms.ModelForm):
    class Meta:
        model = Wave
        fields = [
            'content',
        ]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        for visible in self.visible_fields():
            visible.field.widget.attrs['class'] = 'form-control'

from django import forms
from .models import TShirt


class ShirtForm(forms.ModelForm):
    class Meta:
        model = TShirt
        fields = "__all__"

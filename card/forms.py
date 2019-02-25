from django import forms
from .models import Cards, CardDetail


class CardForm(forms.ModelForm):
    class Meta:
        model = Cards
        fields = "__all__"


class CardDetailForm(forms.ModelForm):
    class Meta:
        model = CardDetail
        fields = "__all__"

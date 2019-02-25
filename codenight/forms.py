from django import forms
from .models import CodingCompetition


class CodingCompetitionForm(forms.ModelForm):
    class Meta:
        model = CodingCompetition
        fields = "__all__"

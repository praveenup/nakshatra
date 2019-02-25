from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import CardForm, CardDetailForm
from .models import Cards
from django.contrib.staticfiles.templatetags.staticfiles import static
import os.path

def card(request):
    if request.method == "POST":
        form = CardForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            name = request.POST['name']
            messages.success(request, 'ID Card Details successfully submitted for : ' +name)
        else:
            messages.warning(request, 'Check the error in the fields OR Your details already exists.')
    else:
        form = CardForm()
    return render(request, 'card/card.html', {'form': form})

def card_detail(request):
    if request.method == "POST":
        form = CardDetailForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            name = request.POST['group_name']
            messages.success(request, 'ID Card Details successfully submitted for : ' +name)
        else:
            messages.warning(request, 'Check the error in the fields OR Your details already exists.')
    else:
        form = CardDetailForm()
    return render(request, 'card/card.html', {'form': form})

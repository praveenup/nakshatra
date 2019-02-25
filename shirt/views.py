from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .forms import ShirtForm
from .models import TShirt
from django.contrib.staticfiles.templatetags.staticfiles import static
import os.path

def shirt(request):
    if request.method == "POST":
        form = ShirtForm(request.POST)
        if form.is_valid():
            form.save()
            roll_no = request.POST['roll_no']
            messages.success(request, 'T-Shirt Details successfully submitted for Roll No.: ' + roll_no)
        else:
            messages.warning(request, 'Your details already exists.')
    else:
        form = ShirtForm()
    return render(request, 'shirt/shirt.html', {'form': form})

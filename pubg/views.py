from django.shortcuts import render
from django.contrib import messages
from .forms import PubgForm

def pubg(request):
    if request.method == "POST":
        form = PubgForm(request.POST)
        if form.is_valid():
            form.save()
            name = request.POST['student_name']
            messages.success(request, 'Details successfully submitted for : ' + name)
        else:
            messages.warning(request, 'Check the error in the fields OR Your details already exists.')
    else:
        form = PubgForm()
    return render(request, 'pubg/pubg.html', {'form': form})

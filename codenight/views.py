from django.shortcuts import render
from django.contrib import messages
from .forms import CodingCompetitionForm

def coding_competition(request):
    if request.method == "POST":
        form = CodingCompetitionForm(request.POST)
        if form.is_valid():
            form.save()
            name = request.POST['student_name']
            messages.success(request, 'Details successfully submitted for : ' + name)
            return render(request, 'codenight/redirect.html',)
    else:
        form = CodingCompetitionForm()
    return render(request, 'codenight/coding_competition.html', {'form': form})

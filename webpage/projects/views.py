from django.shortcuts import render

# Create your views here.

projects_list = ['snake', 'payroll', 'demo']

def index(request):
    return render(request, 'projects/index.html', {
        'projects': projects_list
    })

def project(request, project_name):
    return render(request, 'projects/project.html', {
            'project_name' : project_name
        })
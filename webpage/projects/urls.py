from django.urls import path

from . import views

app_name = 'projects'
    
urlpatterns = [
    path('', views.index, name='index'),
    path('project/<str:project_name>', views.project, name='project')
]

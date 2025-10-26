from django.urls import path
from . import views

urlpatterns = [
    path('', views.listar_laboratoristas, name='listar_laboratoristas'),
    path('crear/', views.crear_laboratorista, name='crear_laboratorista'),
]
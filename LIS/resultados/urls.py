from django.urls import path
from . import views

urlpatterns = [
    path('', views.listar_resultados, name='listar_resultados'),
    path('crear/', views.crear_resultado, name='crear_resultado'),
]
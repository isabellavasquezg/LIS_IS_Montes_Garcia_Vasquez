from django.urls import path
from .views import ResultadosView 

urlpatterns = [
    path('',ResultadosView.as_view(), name='resultados_general'),
    path('<int:id>',ResultadosView.as_view, name='resultados_individual'),
]
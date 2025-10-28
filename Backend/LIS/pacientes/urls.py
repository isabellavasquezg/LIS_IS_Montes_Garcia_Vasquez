from django.urls import path
from .views import PacientesView

urlpatterns = [
    path('', PacientesView.as_view(), name='pacientes_general'),
    path('<int:codigo_ingreso>', PacientesView.as_view(), name='pacientes_individual'),
]

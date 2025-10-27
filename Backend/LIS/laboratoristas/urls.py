from django.urls import path
from .views import LaboratoristasView

urlpatterns = [
    path('', LaboratoristasView.as_view(), name='laboratoristas_general'),
    path('<str:codigo_interno>',LaboratoristasView.as_view(), name='laboratoristas_individual'),
]
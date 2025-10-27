from django.db import models
from pacientes.models import Paciente
from laboratoristas.models import Laboratorista

class Resultado(models.Model):
    paciente = models.ForeignKey(Paciente, on_delete=models.CASCADE)
    laboratorista = models.ForeignKey(Laboratorista, on_delete=models.SET_NULL, null=True)
    colesterol_total = models.FloatField()
    colesterol_hdl = models.FloatField()
    colesterol_ldl = models.FloatField()
    trigliceridos = models.FloatField()

from django.db import models

class Paciente(models.Model):
    codigo_ingreso = models.AutoField(primary_key=True)
    documento = models.CharField(max_length=20, unique=True)
    nombre = models.CharField(max_length=100)
    apellidos = models.CharField(max_length=100)
    direccion = models.CharField(max_length=200)
    telefono = models.CharField(max_length=20)

    def __str__(self):
        return f"{self.nombre} {self.apellidos}"
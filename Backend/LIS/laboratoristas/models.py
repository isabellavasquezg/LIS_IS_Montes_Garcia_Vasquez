from django.db import models

class Laboratorista(models.Model):
    codigo_interno = models.CharField(max_length=10, primary_key=True)
    nombre = models.CharField(max_length=100)
    titulo = models.CharField(max_length=100)
    telefono = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre
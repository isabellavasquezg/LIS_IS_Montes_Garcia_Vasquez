from django.db import models

class Usuario(models.Model):
    usuario = models.CharField(max_length=150, unique=True)  
    contrasena = models.CharField(max_length=64) 

    def __str__(self):
        return self.usuario

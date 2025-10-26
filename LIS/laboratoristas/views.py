from django.http import HttpResponse

def listar_laboratoristas(request):
    return HttpResponse("Listado de laboratoristas OK")

def crear_laboratorista(request):
    return HttpResponse("Crear laboratorista OK")
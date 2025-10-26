from django.http import HttpResponse

def listar_resultados(request):
    return HttpResponse("Listado de resultados OK")

def crear_resultado(request):
    return HttpResponse("Crear resultado OK")
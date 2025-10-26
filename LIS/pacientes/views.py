from django.http import HttpResponse

def listar_pacientes(request):
    return HttpResponse("Página de listado de pacientes funcionando correctamente")

def crear_paciente(request):
    return HttpResponse("Página para crear paciente funcionando correctamente")

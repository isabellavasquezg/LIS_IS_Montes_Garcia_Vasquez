from django.views import View
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
import json

from .models import Paciente
from resultados.models import Resultado  # Para verificar relaciones con resultados


@method_decorator(csrf_exempt, name='dispatch')
class PacientesView(View):

    def get(self, request, codigo_ingreso=None):
        if codigo_ingreso:
            try:
                paciente = Paciente.objects.get(codigo_ingreso=codigo_ingreso)
                data = {
                    "codigo_ingreso": paciente.codigo_ingreso,
                    "documento": paciente.documento,
                    "nombre": paciente.nombre,
                    "apellidos": paciente.apellidos,
                    "direccion": paciente.direccion,
                    "telefono": paciente.telefono
                }
                return JsonResponse(data, status=200)
            except Paciente.DoesNotExist:
                return JsonResponse({"error": "Paciente no encontrado"}, status=404)
        else:
            pacientes = list(Paciente.objects.values(
                "codigo_ingreso",
                "documento",
                "nombre",
                "apellidos",
                "direccion",
                "telefono"
            ))
            return JsonResponse({"pacientes": pacientes}, status=200)

    def post(self, request):
        try:
            data = json.loads(request.body.decode('utf-8'))
            paciente = Paciente.objects.create(
                documento=data["documento"],
                nombre=data["nombre"],
                apellidos=data["apellidos"],
                direccion=data["direccion"],
                telefono=data["telefono"]
            )
            return JsonResponse(
                {"message": "Paciente creado correctamente", "codigo_ingreso": paciente.codigo_ingreso},
                status=201
            )
        except KeyError as e:
            return JsonResponse({"error": f"Campo faltante: {str(e)}"}, status=400)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)

    def put(self, request, codigo_ingreso):
        try:
            data = json.loads(request.body.decode('utf-8'))
            paciente = Paciente.objects.get(codigo_ingreso=codigo_ingreso)
            paciente.documento = data.get("documento", paciente.documento)
            paciente.nombre = data.get("nombre", paciente.nombre)
            paciente.apellidos = data.get("apellidos", paciente.apellidos)
            paciente.direccion = data.get("direccion", paciente.direccion)
            paciente.telefono = data.get("telefono", paciente.telefono)
            paciente.save()
            return JsonResponse({"message": "Paciente actualizado correctamente"}, status=200)
        except Paciente.DoesNotExist:
            return JsonResponse({"error": "Paciente no encontrado"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)

    def delete(self, request, codigo_ingreso):
        try:
            paciente = Paciente.objects.get(codigo_ingreso=codigo_ingreso)
            
            # Verificar si tiene resultados asociados
            if Resultado.objects.filter(paciente=paciente).exists():
                return JsonResponse(
                    {"error": "No se puede eliminar el paciente porque tiene resultados asociados"},
                    status=400
                )

            paciente.delete()
            return JsonResponse({"message": "Paciente eliminado correctamente"}, status=200)
        except Paciente.DoesNotExist:
            return JsonResponse({"error": "Paciente no encontrado"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)

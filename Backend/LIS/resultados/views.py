from django.views import View
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
import json

from .models import Resultado
from pacientes.models import Paciente
from laboratoristas.models import Laboratorista


@method_decorator(csrf_exempt, name='dispatch')
class ResultadosView(View):

    def get(self, request, id_resultado=None):
        if id_resultado:
            try:
                resultado = Resultado.objects.get(id=id_resultado)
                data = {
                    "id": resultado.id,
                    "paciente": resultado.paciente.codigo_ingreso if resultado.paciente else None,
                    "laboratorista": resultado.laboratorista.codigo_interno if resultado.laboratorista else None,
                    "colesterol_total": resultado.colesterol_total,
                    "colesterol_hdl": resultado.colesterol_hdl,
                    "colesterol_ldl": resultado.colesterol_ldl,
                    "trigliceridos": resultado.trigliceridos
                }
                return JsonResponse(data, status=200)
            except Resultado.DoesNotExist:
                return JsonResponse({"error": "Resultado no encontrado"}, status=404)
        else:
            resultados = Resultado.objects.select_related('paciente', 'laboratorista').all()
            data = []
            for r in resultados:
                data.append({
                    "id": r.id,
                    "paciente__codigo_ingreso": r.paciente.codigo_ingreso if r.paciente else "",
                    "paciente__documento": r.paciente.documento if r.paciente else "",
                    "paciente__nombre": r.paciente.nombre if r.paciente else "",
                    "paciente__apellidos": r.paciente.apellidos if r.paciente else "",
                    "laboratorista__codigo_interno": r.laboratorista.codigo_interno if r.laboratorista else "",
                    "colesterol_total": r.colesterol_total,
                    "colesterol_hdl": r.colesterol_hdl,
                    "colesterol_ldl": r.colesterol_ldl,
                    "trigliceridos": r.trigliceridos
                })
            return JsonResponse({"resultados": data}, status=200)

    def post(self, request):
        try:
            data = json.loads(request.body.decode('utf-8'))

            # Buscar paciente y laboratorista
            paciente = Paciente.objects.get(codigo_ingreso=data["codigo_ingreso"])
            laboratorista = Laboratorista.objects.get(codigo_interno=data["codigo_interno"])

            resultado = Resultado.objects.create(
                paciente=paciente,
                laboratorista=laboratorista,
                colesterol_total=data["colesterol_total"],
                colesterol_hdl=data["colesterol_hdl"],
                colesterol_ldl=data["colesterol_ldl"],
                trigliceridos=data["trigliceridos"]
            )

            return JsonResponse({
                "message": "Resultado creado correctamente",
                "id": resultado.id
            }, status=201)

        except Paciente.DoesNotExist:
            return JsonResponse({"error": "El paciente no existe"}, status=404)
        except Laboratorista.DoesNotExist:
            return JsonResponse({"error": "El laboratorista no existe"}, status=404)
        except KeyError as e:
            return JsonResponse({"error": f"Campo faltante: {str(e)}"}, status=400)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)

    def put(self, request, id_resultado):
        try:
            data = json.loads(request.body.decode('utf-8'))
            resultado = Resultado.objects.get(id=id_resultado)

            # Actualizar campos
            if "codigo_ingreso" in data:
                resultado.paciente = Paciente.objects.get(codigo_ingreso=data["codigo_ingreso"])
            if "codigo_interno" in data:
                resultado.laboratorista = Laboratorista.objects.get(codigo_interno=data["codigo_interno"])

            resultado.colesterol_total = data.get("colesterol_total", resultado.colesterol_total)
            resultado.colesterol_hdl = data.get("colesterol_hdl", resultado.colesterol_hdl)
            resultado.colesterol_ldl = data.get("colesterol_ldl", resultado.colesterol_ldl)
            resultado.trigliceridos = data.get("trigliceridos", resultado.trigliceridos)

            resultado.save()
            return JsonResponse({"message": "Resultado actualizado correctamente"}, status=200)

        except Resultado.DoesNotExist:
            return JsonResponse({"error": "Resultado no encontrado"}, status=404)
        except Paciente.DoesNotExist:
            return JsonResponse({"error": "Paciente no encontrado"}, status=404)
        except Laboratorista.DoesNotExist:
            return JsonResponse({"error": "Laboratorista no encontrado"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)

    def delete(self, request, id_resultado):
        try:
            resultado = Resultado.objects.get(id=id_resultado)
            resultado.delete()
            return JsonResponse({"message": "Resultado eliminado correctamente"}, status=200)
        except Resultado.DoesNotExist:
            return JsonResponse({"error": "Resultado no encontrado"}, status=404)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)
from django.http import JsonResponse
from django.views import View
from .models import Laboratorista
import json
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt

class LaboratoristasView(View): 
    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)
    def get(self, request, codigo_interno=None):
        if codigo_interno:
            try:
                laboratorista = Laboratorista.objects.get(codigo_interno=codigo_interno)
                data = {
                    'codigo_interno': laboratorista.codigo_interno,
                    'nombre': laboratorista.nombre,
                    'titulo': laboratorista.titulo,
                    'telefono': laboratorista.telefono
                }
                return JsonResponse(data, status=200)
            except Laboratorista.DoesNotExist:
                return JsonResponse({'error': 'Laboratorista no encontrado'}, status=404)
            except Laboratorista.MultipleObjectsReturned:
                return JsonResponse({'error': 'Múltiples laboratoristas encontrados con el mismo código'}, status=400)
        else:
            laboratoristas=list(Laboratorista.objects.values())
            data={'message':'Success','laboratoristas':laboratoristas}
            return JsonResponse(data, status=200)
    def post(self,request):
        try:
            data = json.loads(request.body)
            Laboratorista.objects.create(
                codigo_interno=data['codigo_interno'],
                nombre=data['nombre'],
                titulo=data['titulo'],
                telefono=data['telefono']
            )
            return JsonResponse({'message': 'Laboratorista creado exitosamente'}, status=201)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)
    def put(self, request, codigo_interno):
        try:
            data = json.loads(request.body)
            laboratorista = Laboratorista.objects.get(codigo_interno=codigo_interno)
            laboratorista.nombre = data.get('nombre', laboratorista.nombre)
            laboratorista.titulo = data.get('titulo', laboratorista.titulo)
            laboratorista.telefono = data.get('telefono', laboratorista.telefono)
            laboratorista.save()
            return JsonResponse({'message': 'Laboratorista actualizado exitosamente'}, status=200)
        except Laboratorista.DoesNotExist:
            return JsonResponse({'error': 'Laboratorista no encontrado'}, status=404)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)
    def delete(self, request, codigo_interno):
        try:
            laboratorista = Laboratorista.objects.get(codigo_interno=codigo_interno)
            laboratorista.delete()
            return JsonResponse({'message': 'Laboratorista eliminado exitosamente'}, status=200)
        except Laboratorista.DoesNotExist:
            return JsonResponse({'error': 'Laboratorista no encontrado'}, status=404)
        except Laboratorista.MultipleObjectsReturned:
            return JsonResponse({'error': 'Múltiples laboratoristas encontrados con el mismo código'}, status=400)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)
            
        
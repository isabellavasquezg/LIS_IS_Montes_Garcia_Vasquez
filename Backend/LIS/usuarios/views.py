import json
from django.views import View
from django.http import JsonResponse
from django.utils.decorators import method_decorator 
from django.views.decorators.csrf import csrf_exempt
from .models import Usuario 
import hashlib


def hash_sha256(password):
    hashed_password = hashlib.sha256(password.encode('utf-8')).hexdigest()
    return hashed_password
@method_decorator(csrf_exempt, name='dispatch')
class LoginView(View):
    def post(self, request):
        try:
            data = json.loads(request.body)
            username = data.get('usuario')
            password_plano = data.get('contrasena') 
            try:
                user = Usuario.objects.get(usuario=username)
            except Usuario.DoesNotExist:
                return JsonResponse({"error": "Usuario o contraseña incorrectos"}, status=401)
            
            password_recibida_hashed = hash_sha256(password_plano)
            
            if password_recibida_hashed == user.contrasena:
                return JsonResponse({"mensaje": "Login exitoso", "token": "tu_token_seguro_aqui"}, status=200)
            else:
                return JsonResponse({"error": "Usuario o contraseña incorrectos"}, status=401)
        except json.JSONDecodeError:
            return JsonResponse({"error": "Formato JSON inválido"}, status=400)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)

<script>
import axios from 'axios';
// Importa el Toast de Vue (asume que fue configurado globalmente en main.js/main.ts)
// Si no lo configuraste globalmente, necesitarías importarlo aquí:
// import { useToast } from 'vue-toast-notification'; 

// Componente de Login
export default {
    name:'usuarioLogin',
    data() {
        return {
        // user no es reactivo ni usado en el template, se puede omitir o dejar para futura lógica.
        user:'',
        // Variable enlazada al campo de texto del nombre de usuario
        username: '',
        // Variable enlazada al campo de texto de la contraseña
        password: '',
        // Controla la visibilidad del campo de contraseña (true = texto, false = password)
        passwordVisible: false
        };
    },
    methods:{
        // Método para alternar la visibilidad de la contraseña
        estadoPassword(){
            this.passwordVisible = !this.passwordVisible;
        },
        // Método para limpiar los campos de entrada
        clearInputs(){
            this.username = '';
            this.password = '';
        },
        // Método principal para intentar el inicio de sesión
        LoginUser(){
            // 1. Validación de campos vacíos
            if (!this.username || !this.password) {
                // Muestra un Toast de error si faltan credenciales
                this.$toast.error('Por favor, ingresa tu nombre de usuario y contraseña.');
                return; // Detiene la ejecución si los campos están vacíos
            }
            
            // 2. Preparar credenciales para el backend
            const credentials = {
                usuario: this.username, // Clave esperada por el backend
                contrasena: this.password // Clave esperada por el backend
            };
            
            // 3. Petición POST a la API de autenticación
            // Nota: La URL es local y puede requerir ajustes según la configuración de tu backend.
            axios.post('http://127.0.0.1:8000/usuarios/', credentials)
            .then(response => {
                // Lógica de éxito: Inicio de sesión correcto
                
                // Muestra un Toast de éxito
                this.$toast.success('¡Inicio de sesión exitoso!');

                // Procesa el nombre de usuario (ej: 'juan.perez' -> 'JUAN')
                const valornombre = this.username;
                let nombrepartes = valornombre.split('.');
                let nombreUsuario = nombrepartes[0]
                let nombreUsuarioCapital=nombreUsuario.charAt(0).toUpperCase() + nombreUsuario.slice(1).toLowerCase()
                
                // Redirecciona a la página de inicio ('/Home') y pasa el nombre como parámetro de consulta
                this.$router.push({ 
                    path: '/Home', 
                    query: { user: nombreUsuarioCapital }
                });
                
                // Limpia los campos después de la redirección
                this.password = '';
                this.username = '';
            })
            .catch(error => {
                // Lógica de manejo de errores
                
                let errorMessage = 'Error desconocido al intentar iniciar sesión.';

                if (error.response) {
                    // Error HTTP (4xx o 5xx) - Respuesta del servidor
                    errorMessage = error.response.data.error || "Credenciales inválidas. Inténtalo de nuevo.";
                    console.error("Detalles del error HTTP:", error.response);

                } else if (error.request) {
                    // Error de red (Servidor no responde o no está disponible)
                    errorMessage = 'No se pudo conectar con el servidor. Verifica la URL o la conexión.';
                    console.error("Error de conexión/red:", error.request);
                    
                } else {
                    // Otros errores (ej. configuración de Axios)
                    console.error("Error:", error.message);
                }
                
                // Muestra un Toast de error en lugar de un alert()
                this.$toast.error('Error de inicio de sesión: ' + errorMessage);
                
            }); 
        } 
    }
};
</script>

<template>
<!--Fondo principal-->
  <div class="background-login-container"> 
    <div class="bacground-login-color">
        <div class="logo-container">
            <img class="img-logo"src="../../public/images/logo_login.png" alt="Logo" />
        </div>

        <form class="form-login" @submit.prevent="LoginUser"> 
            <div class="input-container">
                <input class="input-login" type="text" placeholder="Username" v-model="username" />
                <div class="password-wrapper">
                    <!-- Input de Contraseña: el tipo cambia según el estado -->
                    <input class="input-login"  :type="passwordVisible ? 'text' : 'password'" placeholder="Password" v-model="password"/> 
                    <button type="button" class="password-toggle" @click="estadoPassword">
                        <img :src="passwordVisible ?  '../../public/images/eye_closed.png' : '../../public/images/eye_open.png'"alt="Toggle Password Visibility"class="eye-icon"/>
                    </button>
                </div>

                <div class="buttons-login">
                    <button  class="button-login" type="button" @click="clearInputs">DELETE</button>
                    <button  class="button-login" type="submit">LOGIN</button>
                </div>
            </div>
        </form>
    </div>
  </div>
</template>

<style>
/* --- 1. Estilos Globales de Reinicio --- */
body{
    margin: 0; /* Elimina el margen por defecto del navegador */
    padding: 0; /* Elimina el relleno por defecto del navegador */
}

/* --- 2. Contenedor Principal y Fondo de Imagen --- */
.background-login-container {
    margin: 0;
    padding: 0;
    background-image: url(../../public/images/Background.jpg); /* Establece la imagen de fondo */
    background-size: cover; /* Asegura que la imagen cubra todo el contenedor */
    height: 100vh; /* Ocupa el 100% de la altura de la ventana (viewport height) */
    display: flex; /* Utiliza Flexbox para el alineamiento (aunque Grid es dominante en el hijo) */
}

/* --- 3. Capa de Color de Fondo (Grid Layout) --- */
.bacground-login-color {
    background-color:#00215a; /* Color de fondo azul oscuro */
    width: 100%;
    height: 100vh;
    opacity: 0.9; /* Aplica una ligera transparencia al color */
    margin: 0;
    padding: 0;
    display: grid; /* Habilita el CSS Grid para el diseño principal (Logo vs Formulario) */
    grid-template-columns: 1fr 1fr; /* Define dos columnas de igual ancho (1 fracción cada una) */
    grid-template-rows: 3fr 3fr 4fr; /* Define tres filas con proporciones de altura para centrar el contenido */
}

/* --- 4. Contenedor del Logo (Columna Izquierda) --- */
.logo-container{
    width: 100%;
    height: 100%;
    padding: 0 100px;
    grid-row-start: 2; /* Posiciona el contenedor en la segunda fila */
    grid-row-end: 3;
    grid-column-start: 1; /* Posiciona el contenedor en la primera columna */
    grid-column-end: 2;
    border-right: 4px solid white; /* Línea divisoria blanca en el lado derecho */
    box-sizing: border-box;
}
.img-logo{
    display:block;
    margin: Auto; /* Centrado horizontal y vertical dentro de su contenedor (por grid/auto) */
    padding:0;
}

/* --- 5. Contenedor del Formulario (Columna Derecha) --- */
.form-login{
    margin: 0;
    padding: 0;
    grid-row-start: 2; /* Posiciona el formulario en la segunda fila */
    grid-row-end: 3;
    grid-column-start: 2; /* Posiciona el formulario en la segunda columna */
    grid-column-end: 3;
    position: relative;
}
.input-container {
    box-sizing: border-box;
    margin-top: 60px; /* Margen superior para el grupo de inputs */
    width: 60%; /* Ancho base del contenedor de inputs */
}

/* --- 6. Estilos de los Inputs (Usuario y Contraseña) --- */
.input-login{
    background-color: transparent; /* Fondo transparente */
    display: block;
    width: 60%;
    height: 40px;
    margin: 20px 40px; /* Margen exterior */
    border-radius: 5px;
    border: none;
    border-bottom: 2px solid white; /* Borde inferior blanco para el efecto de "línea" */
    padding: 0 10px;
    font-size: 16px;
    color: #ffffff; /* Color de texto blanco */
}
.input-login::placeholder{
    color: #ffffff84; /* Color del texto placeholder (blanco semi-transparente) */
}
.input-login:active, .input-login:focus{
    outline: none; /* Elimina el borde de enfoque por defecto del navegador */
    background-color: #123d87; /* Cambia el fondo al enfocar */
    color: #ffffff;
}

/* --- 7. Manejo de la Contraseña y el Icono de Visibilidad --- */
.password-wrapper {
    position: relative; /* Establece el contexto de posicionamiento para el botón del ojo */
    width: 60%; 
    margin: 20px 40px; 
}
.password-wrapper .input-login {
    margin: 0;
    width: 100%; 
    padding-right: 10px;
}
.password-toggle {
    position: absolute; /* Posicionamiento absoluto dentro de .password-wrapper */
    top: 50%; /* Centrado verticalmente */
    right: 5px; 
    transform: translateY(-50%) translateX(30px); /* Ajuste fino de la posición final */
    background: none;
    border: none;
    cursor: pointer;
    padding: 5px;
    height: 30px;
    width: 30px;
}
.eye-icon {
    width: 100%;
    height: 100%;
    filter: invert(100%); /* Invierte los colores (útil si la imagen es negra, la hace blanca) */
}

/* --- 8. Estilos de los Botones (LOGIN / DELETE) --- */
.buttons-login {
    display: flex; /* Utiliza Flexbox para alinear los botones en una fila */
    margin-left: 40px; 
    margin-top: 20px; 
}
.button-login{
    padding:0;
    width: 90px;
    border:none;
    background-color: transparent; /* Fondo transparente */
    color: white;
    font-weight: bold;
    font-size: 18px;
    border-radius: 5px;
}
.button-login:first-child{
    margin-right: 100px; /* Espacio entre el botón DELETE y LOGIN */
}
.button-login:hover{
    background-color: #ffffff; /* Efecto hover: cambia a fondo blanco */
    color: #00215a; /* Color de texto azul */
    cursor: pointer;
}
.button-login:active{
    transform: scale(0.98); /* Efecto de "presionar" al hacer click */
}
</style>

<script>
import axios from 'axios';
export default {
  name:'usuarioLogin',
    data() {
        return {
        user:'',
        username: '',
        password: '',
        passwordVisible: false
        };
    },
    methods:{
        estadoPassword(){
            this.passwordVisible = !this.passwordVisible;
        },
        clearInputs(){
            this.username = '';
            this.password = '';
        },
        LoginUser(){
            if (!this.username || !this.password) {
            }else{
                const credentials = {
                usuario: this.username, 
                contrasena: this.password 
                };
                axios.post('http://127.0.0.1:8000/usuarios/', credentials)
                .then(response => {
                    const valornombre=this.username;
                    let nombrepartes=valornombre.split('.');
                    let nombreUsuario=nombrepartes[0].toUpperCase();
                    this.$router.push({ 
                        path: '/Home', 
                        query: { user: nombreUsuario }
                    });
                    this.password = '';
                    this.username = '';
                })
                .catch(error => {
                    if (error.response) {
                        const errorMessage = error.response.data.error || "Credenciales inválidas.";
                        alert('Error de inicio de sesión: ' + errorMessage);
                        
                        console.error("Detalles del error HTTP:", error.response);
                    } else {
                        alert('No se pudo conectar con el servidor. Verifica la URL.');
                        console.error("Error de conexión/red:", error);
                    }
                });  
            }
        }   
    }
};

</script>

<template>
  <div class="background-login-container"> 
    <div class="bacground-login-color">
        <div class="logo-container">
            <img class="img-logo"src="../../public/images/logo_login.png" alt="Logo" />
        </div>
        <form class="form-login"> 
            <div class="input-container">
                <input class="input-login" required type="text" placeholder="Username" v-model="username"/>
                <div class="password-wrapper">
                    <!-- Input de Contraseña: el tipo cambia según el estado -->
                    <input class="input-login" required :type="passwordVisible ? 'text' : 'password'" placeholder="Password" v-model="password"/> 
                    <button type="button" class="password-toggle" @click="estadoPassword">
                        <img :src="passwordVisible ?  '../../public/images/eye_closed.png' : '../../public/images/eye_open.png'"alt="Toggle Password Visibility"class="eye-icon"/>
                    </button>
                </div>

                <div class="buttons-login">
                    <button  class="button-login" type="button" @click="clearInputs">DELETE</button>
                    <button  class="button-login" type="button" @click="LoginUser">LOGIN</button>
                </div>
            </div>
        </form>
    </div>
  </div>
</template>

<style>
    body{
        margin: 0;
        padding: 0;
    }
    .background-login-container {
        margin: 0;
        padding: 0;
        background-image: url(../../public/images/Background.jpg);
        background-size: cover;
        height: 100vh;
        display: flex;
    }
    .bacground-login-color {
        background-color:#00215a;
        width: 100%;
        height: 100vh;
        opacity: 0.9;
        margin: 0;
        padding: 0;
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 3fr 3fr 4fr;
    }
    .logo-container{
        width: 100%;
        height: 100%;
        padding: 0 100px;
        grid-row-start: 2;
        grid-row-end: 3;
        grid-column-start: 1;
        grid-column-end: 2;
        border-right: 4px solid white;
        box-sizing: border-box;
    }
    .img-logo{
        display:block;
        margin: Auto;
        padding:0;
    }
    .form-login{
        margin: 0;
        padding: 0;
        grid-row-start: 2;
        grid-row-end: 3;
        grid-column-start: 2;
        grid-column-end: 3;
        position: relative;
    }
    .input-login{
        background-color: transparent;
        display: block;
        width: 60%;
        height: 40px;
        margin: 20px 40px;
        border-radius: 5px;
        border: none;
        border-bottom: 2px solid white;
        padding: 0 10px;
        font-size: 16px;
        color: #ffffff;
    }
    .input-container {
        box-sizing: border-box;
        margin-top: 60px;
        width: 60%; 
    }
    .password-wrapper {
        position: relative;
        width: 60%; 
        margin: 20px 40px; 
    }
    .password-wrapper .input-login {
        margin: 0;
        width: 100%; 
        padding-right: 10px;
    }
    .password-toggle {
        position: absolute;
        top: 50%; 
        right: 5px; 
        transform: translateY(-50%) translateX(30px);
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
        filter: invert(100%); 
    }
    .input-login::placeholder{
        color: #ffffff84; 
    }
    .input-login:active, .input-login:focus{
        outline: none;
        background-color: #123d87;
        color: #ffffff;
    }
    .buttons-login {
        display: flex;
        margin-left: 40px; 
        margin-top: 20px; 
    }
    .button-login{
        padding:0;
        width: 90px;
        border:none;
        background-color: transparent;
        color: white;
        font-weight: bold;
        font-size: 18px;
        border-radius: 5px;
    }
    .button-login:first-child{
        margin-right: 100px;
    }
    .button-login:hover{
        background-color: #ffffff;
        color: #00215a;
        cursor: pointer;
    }
    .button-login:active{
        transform: scale(0.98);
    }
</style>
<script setup>
</script>

<template>
  <div class="background-login-container"> 
    <div class="bacground-login-color">
        <div class="login-left">
            <div class="logo-container">
                <div class="logo-image">
                </div>
            </div>
        </div>
        <div class="login-right">
            <div class="formulario-container">
                <form>
                    <div class="inputs-login">
                        <input type="text" placeholder="User Name"/> 
                    </div>
                    <div class="inputs-login">
                        <input type="password" placeholder="Password"/> 
                    </div>
                </form>
            </div>
        </div>
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
        background-color:#00506c;
        width: 100%;
        height: 100vh;
        opacity: 0.9;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: row;
    }
    .login-left, .login-right {
        height: 100vh;
        margin:0; 
        display: flex; 
        align-items: center;  
    }
    .login-right{
        width: 52%;
        justify-content: left; 
    }
    .login-left{
        width: 48%;
        padding: 100px,0,100px,0;
    }
    .logo-container {
        width: 100vh;
        height: 40vh;
        border-right: 3px solid white;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .logo-image{
        width: 50vh;
        height: 100%;
        background-image: url(../../public/images/logo_login.png);
    }
    .formulario-container {
        width: 50vh;
        height: 40vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .inputs-login {
        margin: 20px;
    }
</style>
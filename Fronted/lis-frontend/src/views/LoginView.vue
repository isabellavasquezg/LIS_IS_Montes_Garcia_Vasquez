<script setup>

</script>

<template>
  <div class="background-login-container"> 
    <div class="bacground-login-color">
        <div class="logo-container">
            <img class="img-logo"src="../../public/images/logo_login.png" alt="Logo" />
        </div>
        <form class="form-login"> 
            <div class="input-container">
                <input class="input-login" type="text" placeholder="Username" />
                <input class="input-login" type="password" placeholder="Password" />
                <div class="buttons-login">
                    <button  class="button-login" type="reset">DELETE</button>
                    <button  class="button-login" type="submit">LOGIN</button>
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
        background-color:#00506c;
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
    .input-container{
        box-sizing: border-box;
        margin-top: 60px;
        width: 50%;
    }
    .input-login::placeholder{
        color: #ffffff84; 
    }
    .input-login:active, .input-login:focus{
        outline: none;
        background-color: #678d9d;
        color: #ffffff;
    }
    .buttons-login{
        display: flex;
        margin-left: 40px;  
        height: 40px;
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
        color: #00506c;
    }
    .button-login:active{
        transform: scale(0.98);
    }
</style>
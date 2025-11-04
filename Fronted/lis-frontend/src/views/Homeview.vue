<script>
export default {
    data() {
        return {
            nombreUsuario: null 
        };
    },
    mounted(){
        const nombreCompleto = this.$route.query.user; 
        
        let nombreRecortado = null;

        if (nombreCompleto) {
            const partes = nombreCompleto.split('.'); 
            nombreRecortado = partes[0]; 
        }
        this.nombreUsuario = nombreRecortado.toUpperCase();
    }
}
</script>
<template>
    <div class="backgroundhome-container">
        <h2 class="titulo-menu">PACIENTES</h2>
        <form class="menu-busqueda-codigo">
            <input class="input-menu-busqueda" type="text" placeholder="Codigo Paciente"></input>
            <button class="boton-busqueda-menu" type="button">buscar</button>
        </form>
        <button class="boton-anadir-menu" type="button">+</button>
        <table class="tabla-menu-sujetos">
            <thead>
                <tr>
                    <th>sds</th>
                    <th>sds</th>
                    <th>dsd</th>
                    <th>sds</th>
                    <th>sdsd</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>sds</td>
                    <td>sd</td>
                    <td>sds</td>
                    <td>sd</td>
                    <td>dss</td>
                </tr>
                <tr>
                    <td>sds</td>
                    <td>sd</td>
                    <td>sds</td>
                    <td>sd</td>
                    <td>dss</td>
                </tr>
            </tbody>
        </table>
        <div class="sidebar-container">
            <div class="imagen-logo-menu">
            </div>
            <h4 class="usuario-name-menu">
                Bienvenido Dr. {{ nombreUsuario }}
            </h4>
            <ul class="menu-opciones-contenedor">
                <li class="menu-opcion">Laboratoristas</li>
                <li class="menu-opcion">Pacientes</li>
                <li class="menu-opcion">Resultados</li>
                <li class="menu-opcion">Salida</li>
            </ul>
        </div>
    </div>
</template>
<style>
    body{
        margin: 0;
    }
    .backgroundhome-container{
        background-color: #f5f5f5;
        width: 100vw;
        height: 100vh;
        display:grid;
        grid-template-columns: repeat(12,1fr);
        grid-template-rows: 25px repeat(15,1fr);
    }
    .sidebar-container{
        background-color: #00215a;
        grid-column-start: 1;
        grid-column-end: 3;
        grid-row-start: 2;
        grid-row-end: 17;
        border-radius: 0 30px 0 0;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .imagen-logo-menu{
        margin-top: 40px;
        height: 100px;
        width: 120px;
        background-image: url("../../public/images/logo_menu.png");
        background-size: cover;
    }
    .usuario-name-menu{
        color:#ffffff;
        font-family: sans-serif;
        margin-top: 60px;
    }
    .menu-opciones-contenedor{
        margin: 60px 0;
        padding-left: 80px;
        width: 100%;
        box-sizing: border-box;
    }
    .menu-opcion{
        list-style-type: none;
        margin: 20px 0;
        box-sizing: border-box;
        font-family: sans-serif;
        color: #ffffff;
        font-weight: bold;
        font-size: 14px;
        padding: 15px 0;
        padding-left: 10px;
        border-radius: 15px 0 0 15px;
    }
    .menu-opcion:hover{
        background-color: #117fb9 ;
    }
    .menu-opcion:active{
        transform: scale(1.10);
    }
    .titulo-menu{
        display:flex;
        margin:0;
        padding:0 10px;
        grid-column-start: 4;
        grid-column-end: 6;
        grid-row-start: 2;
        grid-row-end: 3;
        box-sizing: border-box;
        border-left: 2px solid #d4d5d6;
        border-right: 2px solid #d4d5d6;
        font-family: sans-serif;
        color:#117fb9;
        align-items: center;
    }
    .menu-busqueda-codigo{
        grid-column-start: 6;
        grid-column-end: 10;
        grid-row-start: 2;
        grid-row-end: 3;
        border-right:2px solid #d4d5d6;
        display: flex;
        flex-direction: row;
        align-items: center;
    }
    .input-menu-busqueda{
        padding: 0;
        margin:0;
        width: 100%;
        height: 100%;
        border:none;
        color:#117fb9;
        font-family:sans-serif;
        font-size:16px;
        font-weight: 700;
        box-sizing: border-box;
        padding-left: 20px;
        background-color: transparent;
    }
    .input-menu-busqueda::placeholder{
        color:#117eb996;
        font-family:sans-serif;
        font-weight: 700;
    }
    .input-menu-busqueda:focus{
        outline: none;
    }
    .boton-busqueda-menu{
        display:flex;
        padding: 0 10px;
        box-sizing: border-box;
        height: 90%;
        border-radius: 15px;
        color:#0f264db3;
        border: none;
        background-color: transparent;
        align-items: center;
    }
    .boton-busqueda-menu:hover{
        color:#08317ce5;
        background-color: #ffffff;
        box-shadow: 0px 2px 2px 0px rgba(0, 0, 0, 0.3);
    }
    .boton-busqueda-menu:active{
        transform: scale(0.98);
    }
    .boton-anadir-menu{
        grid-column-start: 4;
        grid-column-end: 5;
        grid-row-start: 4;
        grid-row-end: 5;
        box-sizing: border-box;
        margin: 5px 70px 5px 0;
        border-radius: 10px;
        border:none;
        background-color: #71cfff;
        color: #ffffff;
        font-size: 16px;
        font-weight: bold;
    }
    .boton-anadir-menu:active{
        transform: scale(0.98);
    }
    .tabla-menu-sujetos{
        grid-column-start: 4;
        grid-column-end: 11;
        grid-row-start: 6;
        grid-row-end: 16;
    }
    th{
        text-align: left;
    }
</style>
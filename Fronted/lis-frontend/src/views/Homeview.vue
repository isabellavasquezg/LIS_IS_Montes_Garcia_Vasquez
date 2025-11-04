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
        <div class="tabla-contenedor-scroll">
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
        </div>
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
    .tabla-contenedor-scroll {
            /* Color del manejador | Color del fondo (pista) */
        scrollbar-color: #00215a #f1f1f1; 
        
        /* Opcional: para hacer el scroll más delgado en Firefox */
        scrollbar-width: thin;
        grid-column-start: 4;
        grid-column-end: 11;
        grid-row-start: 6;
        grid-row-end: 16;
        /* Define la altura máxima que quieres que tenga el área de datos */
        max-height: 400px; /* Por ejemplo, 400 píxeles */
        
        /* ¡Esto es lo crucial! Muestra la barra de desplazamiento vertical 
        solo cuando el contenido exceda la altura máxima. */
        overflow-y: auto; 
        
        /* Asegura que el contenedor ocupe el 100% del ancho para centrar la tabla */
        width: 100%;
    }
    .tabla-menu-sujetos {

        /* Esencial para que border-radius y box-shadow funcionen en la tabla/celdas */
        border-collapse: separate;
        /* Elimina el espacio entre celdas por defecto */
        border-spacing: 0 10px; /* 0 horizontal, 10px vertical para separación de filas */
        width: 100%;
        
        /* Fuente y color de fondo general (opcional) */
        font-family: sans-serif;
    }

    /* --- Estilos de la cabecera (Header) --- */
    .tabla-menu-sujetos thead th {
        background-color: transparent; /* Fondo transparente para la cabecera */
        color: #444; /* Color del texto de la cabecera */
        padding: 10px 15px;
        text-align: left;
        border: none; /* Asegúrate de que no haya bordes indeseados */
    }

    /* Redondear las esquinas de los extremos del encabezado */
    .tabla-menu-sujetos thead th:first-child {
        border-top-left-radius: 10px;
    }

    .tabla-menu-sujetos thead th:last-child {
        border-top-right-radius: 10px;
    }

    /* Ocultar la última celda del encabezado que contiene los 3 puntos (si es una columna) */
    .tabla-menu-sujetos thead th:last-child {
        visibility: hidden; /* Oculta el encabezado de la última columna */
        width: 30px; /* Ajusta el ancho para mantener el espacio de los 3 puntos en la fila de datos */
    }


    /* --- Estilos de las filas de datos (Body Rows) --- */
    .tabla-menu-sujetos tbody tr {
        display: table-row; /* Mantiene el comportamiento de fila */
        /* Agrega un sombreado (shadow) para dar el efecto de "bloque" y el borde ligero */
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); 
        background-color: white; /* Fondo blanco para las filas */
        border-radius: 10px; /* Redondea toda la fila */
        overflow: hidden; /* Importante para que el redondeado se aplique bien */
        height: 60px; /* Altura fija para que la fila vacía se vea del tamaño deseado */
    }

    /* Eliminar el margen inferior de la última fila */
    .tabla-menu-sujetos tbody tr:last-child {
        margin-bottom: 0;
    }

    /* Estilos de las celdas de datos */
    .tabla-menu-sujetos tbody td {
        padding: 10px 15px;
        border: none; /* No queremos bordes internos */
        /* Para simular la línea de la imagen, podrías usar un borde a la derecha */
        border-right: 1px solid #eee; 
    }

    /* Quitar el borde derecho de la última celda antes de los 3 puntos */
    .tabla-menu-sujetos tbody tr td:nth-last-child(2) {
        border-right: none; 
    }

    /* Estilos para la celda de los 3 puntos (última celda) */
    .tabla-menu-sujetos tbody tr td:last-child {
        /* Es importante que no tenga border-right si no tiene contenido visual */
        border-right: none;
        text-align: center;
        width: 30px; /* Mismo ancho que la columna oculta del thead */
        position: relative;
        /* Crear el botón de 3 puntos */
    }

    /* --- Redondeo en las esquinas de las filas --- */

    /* Esquinas superiores izquierdas y derechas de cada fila */
    .tabla-menu-sujetos tbody tr td:first-child {
        border-top-left-radius: 10px;
        border-bottom-left-radius: 10px;
    }

    /* Esquinas inferiores izquierdas y derechas de cada fila */
    .tabla-menu-sujetos tbody tr td:last-child {
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }
</style>
<script>
export default {
			data() {
				return {
					nombreUsuario:null,
				};
			},
			mounted() {
				this.nombreUsuario = this.$route.query.user;
			}
}
</script>

<template>
	<div class="backgroundhome-container">
		<div class="sidebar-container">
			<div class="imagen-logo-menu"></div>

			<ul class="menu-opciones-contenedor">
				<li class="menu-opcion" @click="$router.push({path:'/laboratoristas',query:{user:nombreUsuario}})">Laboratoristas</li>
				<li class="menu-opcion" @click="$router.push({path:'/pacientes',query:{user:nombreUsuario}})">Pacientes</li>
				<li class="menu-opcion" @click="$router.push({path:'/resultados',query:{user:nombreUsuario}})">Resultados</li>
			</ul>

			<div class="sidebar-bottom">
				<button class="icon-btn" @click="$router.push('/')" title="Salir">
					<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16 13v-2H7V8l-5 4 5 4v-3zM20 3h-8v2h8v14h-8v2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z" fill="#fff"/></svg>
				</button>
			</div>
		</div>

		<div class="main-area">
			<div class="bienvenida-central">
				<div>
					<h1 class="bienvenida-principal">Bienvenido</h1>
					<h2 class="bienvenida-nombre">Ing. {{ nombreUsuario }}</h2>
				</div>
			</div>
		</div>
	</div>
</template>

<style scoped>
.backgroundhome-container{
	background-color: #f5f5f5;
	width: 100vw;
	min-height: 100vh;
	display:grid;
	grid-template-columns: repeat(12,1fr);
	grid-template-rows: 25px repeat(15,1fr);
	box-sizing: border-box;
	padding: 0;
	margin: 0;
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
	padding-bottom: 40px;
}
.imagen-logo-menu{
	margin-top: 40px;
	height: 100px;
	width: 120px;
	background-image: url("../../public/images/logo_menu.png");
	background-size: cover;
}
.menu-opciones-contenedor{ margin: 40px 0; padding-left: 10px; width: 100%; box-sizing: border-box }
.menu-opcion{ list-style-type: none; margin: 20px 0; font-family: sans-serif; color: #ffffff; font-weight: bold; font-size: 14px; padding: 15px 0; padding-left: 10px; border-radius: 15px 0 0 15px; cursor: pointer }
.menu-opcion:hover{ background-color: #117fb9 }
.sidebar-bottom{ margin-top:auto; display:flex; gap:8px; padding-left:8px; padding-bottom:20px }
.icon-btn{ background:transparent; border:none; cursor:pointer; padding:6px }
.icon-btn svg{ display:block }

.main-area{ grid-column-start: 3; grid-column-end: 13; grid-row-start: 2; grid-row-end: 17; display:flex; align-items:center; justify-content:center }
.bienvenida-central{ text-align:center }
.bienvenida-principal{ color:#117fb9; font-size:48px; margin:0; font-family:sans-serif }
.bienvenida-nombre{ color:#333; font-size:28px; margin:8px 0 0 0; font-family:sans-serif }
</style>

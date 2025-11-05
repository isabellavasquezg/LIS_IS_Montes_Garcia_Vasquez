<script>
import axios from "axios";

export default {
  name: "PacientesView",
  data() {
    return {
      pacientes: [],
      mostrarCrearModal: false,
      mostrarEditarModal: false,
      mostrarEditarPanel: false,
      mostrarEliminarPanel: false,
      pacienteEditar: null,
      nuevoPaciente: {
        documento: "",
        nombre: "",
        apellidos: "",
        codigo_ingreso: "",
        direccion: "",
        telefono: ""
      },
      codigoEditar: "",
      codigoEliminar: "",
      errores: {},
    };
  },
  methods: {
    async listarPacientes() {
      try {
        const res = await axios.get("http://127.0.0.1:8000/pacientes/");
        this.pacientes = res.data.pacientes || [];
      } catch (err) {
        console.error(err);
        alert("Error al listar pacientes");
      }
    },
    mostrarCrear() {
      this.mostrarCrearModal = true;
      this.nuevoPaciente = {
        documento: "",
        nombre: "",
        apellidos: "",
        codigo_ingreso: "",
        direccion: "",
        telefono: ""
      };
      this.errores = {};
    },
    validarPaciente(paciente) {
      const campos = ["documento", "nombre", "apellidos", "codigo_ingreso", "direccion", "telefono"];
      let errores = {};
      campos.forEach(c => {
        if (!paciente[c]) errores[c] = "Campo requerido";
      });
      this.errores = errores;
      return Object.keys(errores).length === 0;
    },
    async guardarNuevoPaciente() {
      if (!this.validarPaciente(this.nuevoPaciente)) {
        alert("Por favor ingresa todos los campos");
        return;
      }
      try {
        await axios.post("http://127.0.0.1:8000/pacientes/", this.nuevoPaciente);
        alert("Paciente creado correctamente");
        this.mostrarCrearModal = false;
        this.listarPacientes();
      } catch (err) {
        console.error(err);
        alert("Error al crear el paciente");
      }
    },
    mostrarEditar(paciente) {
      this.pacienteEditar = { ...paciente };
      this.mostrarEditarModal = true;
      this.errores = {};
    },
    async guardarEdicionPaciente() {
      if (!this.validarPaciente(this.pacienteEditar)) {
        alert("Por favor ingresa todos los campos");
        return;
      }
      try {
        await axios.put(`http://127.0.0.1:8000/pacientes/${this.pacienteEditar.codigo_ingreso}`, this.pacienteEditar);
        alert("Paciente actualizado correctamente");
        this.mostrarEditarModal = false;
        this.listarPacientes();
      } catch (err) {
        console.error(err);
        alert("Error al actualizar el paciente");
      }
    },
    iniciarEliminacion() {
      const paciente = this.pacientes.find(p => p.codigo_ingreso === this.codigoEliminar);
      if (!paciente) {
        return alert("Paciente no encontrado");
      }
      this.eliminarPaciente(paciente.codigo_ingreso);
    },
    async eliminarPaciente(codigo_ingreso) {
      if (!confirm("¿Seguro que deseas eliminar este paciente?")) return;
      try {
        await axios.delete(`http://127.0.0.1:8000/pacientes/${codigo_ingreso}`);
        alert("Paciente eliminado correctamente");
        this.listarPacientes();
      } catch (err) {
        console.error(err);
        alert("Error al eliminar el paciente");
      }
    },
    irHome() {
      const nombreUsuario = this.$route.query.nombreUsuario || 'KEVIN';
      this.$router.push({ path: '/Home', query: { nombreUsuario } });
    },
    async buscarYEditar() {
      const paciente = this.pacientes.find(p => p.codigo_ingreso === this.codigoEditar);
      if (!paciente) {
        return alert("Paciente no encontrado");
      }
      this.mostrarEditar(paciente);
      this.codigoEditar = "";
      this.mostrarEditarPanel = false;
    }
  },
  mounted() {
    this.listarPacientes();
  },
};
</script>

<template>
  <div class="backgroundhome-container">
    <div class="sidebar-container">
      <div class="imagen-logo-menu"></div>

      <h4 class="usuario-name-menu">Bienvenido Ing. KEVIN</h4>

      <ul class="menu-opciones-contenedor" style="width:100%; padding-left:12px">
        <li class="menu-opcion" @click="mostrarCrear">Crear</li>
        <li class="menu-opcion" @click="mostrarEditarPanel = true">Modificar</li>
        <div v-if="mostrarEditarPanel" class="sidebar-panel" style="background:transparent;padding-left:12px">
          <input v-model="codigoEditar" placeholder="Código de ingreso a buscar" />
          <button class="button-primario" @click="buscarYEditar">Buscar y editar</button>
        </div>
        <li class="menu-opcion" @click="mostrarEliminarPanel = true">Eliminar</li>
        <div v-if="mostrarEliminarPanel" class="sidebar-panel" style="background:transparent;padding-left:12px">
          <input v-model="codigoEliminar" placeholder="Código de ingreso a eliminar" />
          <button class="button-danger" @click="iniciarEliminacion">Eliminar</button>
        </div>
      </ul>

      <div class="sidebar-bottom">
        <button class="icon-btn" @click="irHome" title="Ir al menú">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" fill="#fff"/></svg>
        </button>
        <button class="icon-btn" @click="$router.push('/')" title="Salir">
          <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16 13v-2H7V8l-5 4 5 4v-3zM20 3h-8v2h8v14h-8v2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z" fill="#fff"/></svg>
        </button>
      </div>
    </div>

    <div class="main-area" >
      <div class="laboratoristas-container">
        <h2 class="titulo-menu">Gestión de Pacientes</h2>

        <div class="tabla tarjeta tabla-contenedor-scroll">
          <table class="tabla-menu-sujetos">
            <thead>
              <tr>
                <th>Código ingreso</th>
                <th>Documento</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Dirección</th>
                <th>Teléfono</th>
              </tr>
            </thead>
            <tbody>
              <tr v-if="pacientes.length === 0">
                <td colspan="6" style="text-align:center;padding:28px;color:#666">No hay pacientes registrados</td>
              </tr>
              <tr v-for="p in pacientes" :key="p.codigo_ingreso">
                <td>{{ p.codigo_ingreso }}</td>
                <td>{{ p.documento }}</td>
                <td>{{ p.nombre }}</td>
                <td>{{ p.apellidos }}</td>
                <td>{{ p.direccion }}</td>
                <td>{{ p.telefono }}</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div v-if="mostrarCrearModal" class="modal-overlay">
          <div class="modal" style="max-width:520px;width:90%">
            <h3 style="margin-top:0">Crear nuevo paciente</h3>
            <div class="grid-form" style="margin-top:10px">
              <input v-model="nuevoPaciente.documento" placeholder="Documento" />
              <input v-model="nuevoPaciente.nombre" placeholder="Nombre" />
              <input v-model="nuevoPaciente.apellidos" placeholder="Apellidos" />
              <input v-model="nuevoPaciente.codigo_ingreso" placeholder="Código de ingreso" />
              <input v-model="nuevoPaciente.direccion" placeholder="Dirección" />
              <input v-model="nuevoPaciente.telefono" placeholder="Teléfono" />
            </div>
            <div style="display:flex;gap:10px;margin-top:14px;justify-content:flex-end">
              <button class="button-secundario" @click="mostrarCrearModal=false">Cancelar</button>
              <button class="button-primario" @click="guardarNuevoPaciente">Crear</button>
            </div>
          </div>
        </div>

        <div v-if="mostrarEditarModal" class="modal-overlay">
          <div class="modal" style="max-width:520px;width:90%">
            <h3 style="margin-top:0">Editar paciente</h3>
            <div class="grid-form" style="margin-top:10px">
              <input v-model="pacienteEditar.documento" placeholder="Documento" />
              <input v-model="pacienteEditar.nombre" placeholder="Nombre" />
              <input v-model="pacienteEditar.apellidos" placeholder="Apellidos" />
              <input v-model="pacienteEditar.codigo_ingreso" placeholder="Código de ingreso" disabled />
              <input v-model="pacienteEditar.direccion" placeholder="Dirección" />
              <input v-model="pacienteEditar.telefono" placeholder="Teléfono" />
            </div>
            <div style="display:flex;gap:10px;margin-top:14px;justify-content:flex-end">
              <button class="button-secundario" @click="mostrarEditarModal=false">Cancelar</button>
              <button class="button-primario" @click="guardarEdicionPaciente">Actualizar</button>
            </div>
          </div>
        </div>

        <div v-if="mostrarEliminarModal" class="modal-overlay">
          <div class="modal">
            <div style="display:flex;gap:12px;align-items:center">
              <svg width="44" height="44" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M1 21h22L12 2 1 21z" fill="#fff"/><path d="M13 16h-2v2h2v-2zm0-8h-2v6h2V8z" fill="#d32f2f"/></svg>
              <div>
                <p style="font-weight:700;margin:0 0 6px 0">Confirmar eliminación</p>
                <p style="margin:0">¿Seguro que deseas eliminar este paciente?</p>
              </div>
            </div>
            <div style="display:flex;gap:10px;margin-top:14px">
              <button class="button-danger" @click="eliminarPacienteConfirmado">Eliminar</button>
              <button class="button-confirm" @click="mostrarEliminarModal=false">Cancelar</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.backgroundhome-container{ background-color: #f5f5f5; width: 100vw; min-height: 100vh; display:grid; grid-template-columns: repeat(12,1fr); grid-template-rows: 25px repeat(15,1fr); box-sizing: border-box; padding: 0; margin: 0; }
.sidebar-container{ background-color: #00215a; grid-column-start: 1; grid-column-end: 3; grid-row-start: 2; grid-row-end: 17; border-radius: 0 30px 0 0; display: flex; flex-direction: column; align-items: center; padding-bottom: 40px; }
.imagen-logo-menu{ margin-top: 40px; height: 100px; width: 120px; background-image: url("../../public/images/logo_menu.png"); background-size: cover; }
.usuario-name-menu{ color:#ffffff; font-family: sans-serif; margin-top: 30px; }
.menu-opciones-contenedor{ margin: 40px 0; padding-left: 10px; width: 100%; box-sizing: border-box; }
.menu-opcion{ list-style-type: none; margin: 20px 0; box-sizing: border-box; font-family: sans-serif; color: #ffffff; font-weight: bold; font-size: 14px; padding: 15px 0; padding-left: 10px; border-radius: 15px 0 0 15px; cursor: pointer; }
.menu-opcion:hover{ background-color: #117fb9 }
.main-area{ grid-column-start: 3; grid-column-end: 13; grid-row-start: 2; grid-row-end: 17; padding: 20px 30px; font-family: sans-serif; }
.laboratoristas-container{ background: transparent; }
.titulo-menu{ color:#117fb9; font-family: sans-serif; margin: 0 0 18px 0; text-align:center; font-size:28px }
.tarjeta{ background: #ffffff; border-radius: 12px; padding: 16px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); margin-bottom: 20px; }
.sidebar-actions{ display:flex; flex-direction:column; gap:10px; width:100%; padding: 0 12px }
.sidebar-panel{ display:flex; flex-direction:column; gap:8px; padding: 8px 12px }
.sidebar-panel input{ padding:8px; border-radius:6px; border:none; }
.sidebar-panel button{ align-self:flex-start }
.button-danger{ background:#d32f2f; color:#fff; border:none; padding:8px 12px; border-radius:8px; cursor:pointer }
.sidebar-bottom{ margin-top:auto; display:flex; gap:8px; padding-left:8px; padding-bottom:20px }
.icon-btn{ background:transparent; border:none; cursor:pointer; padding:6px }
.icon-btn svg{ display:block }
.buscador-central{ display:flex; justify-content:center; margin-bottom:18px }
.buscador-bubble{ display:flex; align-items:center; gap:8px; background:#fff; padding:8px 12px; border-radius:999px; box-shadow:0 2px 8px rgba(0,0,0,0.06); }
.buscador-bubble input{ border:none; outline:none; padding:8px; width:260px; font-family:sans-serif }
.buscar-round{ width:40px; height:40px; border-radius:50%; border:none; background:#0b5fa5; display:flex; align-items:center; justify-content:center; cursor:pointer }
.buscar-round img{ filter: invert(1); }
.botones-form{ margin-top:12px; display:flex; gap:12px }
.button-primario{ background:#117fb9; color:#fff; border:none; padding:8px 14px; border-radius:8px; cursor:pointer }
.button-secundario{ background:transparent; border:1px solid #ccc; padding:8px 14px; border-radius:8px; cursor:pointer }
.grid-form{ display:grid; grid-template-columns: repeat(2,1fr); gap:10px }
.grid-form input{ padding:8px; border-radius:6px; border:1px solid #ddd }
.tabla-contenedor-scroll{ scrollbar-color: #00215a #f1f1f1; scrollbar-width: thin; max-height: 600px; overflow-y: auto }
.tabla-menu-sujetos{ border-collapse: separate; border-spacing: 0 12px; width: 100%; font-family: sans-serif; font-size: 16px }
.tabla-menu-sujetos thead th{ background-color: #f0f6fb; color: #0b5fa5; padding: 14px 12px; text-align: center; border: none; font-weight:700; letter-spacing:0.6px }
.tabla-menu-sujetos tbody tr{ display: table-row; box-shadow: 0 2px 6px rgba(11,95,165,0.04); background-color: white; border-radius: 10px; overflow: hidden; height: 64px; transition: transform .12s ease, box-shadow .12s ease }
.tabla-menu-sujetos tbody tr:hover{ transform: translateY(-4px); box-shadow: 0 6px 18px rgba(11,95,165,0.08) }
.tabla-menu-sujetos tbody td{ padding: 12px 10px; border: none; text-align: center; color: #333 }
.tabla-menu-sujetos tbody tr:nth-child(even){ background: #fbfdff }
.tabla-menu-sujetos tbody tr td:first-child{ border-top-left-radius: 10px; border-bottom-left-radius: 10px }
.tabla-menu-sujetos tbody tr td:last-child{ border-top-right-radius: 10px; border-bottom-right-radius: 10px }
.modal-overlay { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.4); display:flex; justify-content:center; align-items:center }
.modal{ background:white; padding: 20px; border-radius: 10px }
.button-confirm{ background:#2e7d32; color:#fff; border:none; padding:8px 12px; border-radius:8px; cursor:pointer }

</style>

<script>
import axios from "axios";

export default {
  name: "ResultadosView",
  data() {
    return {
      idBusqueda: "",
      resultados: [],
      mostrarCrearModal: false,
      mostrarDetalleModal: false,
      resultadoDetalle: null,
      newResultado: {
        codigo_ingreso: "",
        codigo_interno: "",
        colesterol_total: "",
        colesterol_hdl: "",
        colesterol_ldl: "",
        trigliceridos: "",
      },
    };
  },
  methods: {
    async listarResultados() {
      try {
        const res = await axios.get("http://127.0.0.1:8000/resultados/");
        // res.data.resultados: [{..., paciente__codigo_ingreso, paciente__documento, paciente__nombre, paciente__apellidos, ...}]
        // Si el backend no retorna esos campos, hay que ajustarlo. Aquí asumo que sí.
        this.resultados = (res.data.resultados || []).map(r => ({
          id: r.id,
          paciente__codigo_ingreso: r.paciente__codigo_ingreso || r.paciente,
          paciente__documento: r.paciente__documento || '',
          paciente__nombre: r.paciente__nombre || '',
          paciente__apellidos: r.paciente__apellidos || '',
          laboratorista__codigo_interno: r.laboratorista__codigo_interno || r.laboratorista,
          colesterol_total: r.colesterol_total,
          colesterol_hdl: r.colesterol_hdl,
          colesterol_ldl: r.colesterol_ldl,
          trigliceridos: r.trigliceridos
        }));
      } catch (err) {
        console.error(err);
        alert("Error al listar resultados");
      }
    },
    async buscarResultado() {
      if (!this.idBusqueda) return alert("Ingrese un ID de resultado");
      try {
        const res = await axios.get(
          `http://127.0.0.1:8000/resultados/${this.idBusqueda}`
        );
        const r = res.data;
        this.resultados = [
          {
            id: r.id,
            paciente__codigo_ingreso: r.paciente__codigo_ingreso || r.paciente,
            paciente__documento: r.paciente__documento || '',
            paciente__nombre: r.paciente__nombre || '',
            paciente__apellidos: r.paciente__apellidos || '',
            laboratorista__codigo_interno: r.laboratorista__codigo_interno || r.laboratorista,
            colesterol_total: r.colesterol_total,
            colesterol_hdl: r.colesterol_hdl,
            colesterol_ldl: r.colesterol_ldl,
            trigliceridos: r.trigliceridos
          },
        ];
      } catch (err) {
        console.error(err);
        alert("Resultado no encontrado");
        this.resultados = [];
      }
    },

    verDetalle(resultado) {
      this.resultadoDetalle = resultado;
      this.mostrarDetalleModal = true;
    },
    cerrarDetalle() {
      this.mostrarDetalleModal = false;
      this.resultadoDetalle = null;
    },
    mostrarCrear() {
      this.mostrarCrearModal = true;
      this.newResultado = {
        codigo_ingreso: "",
        codigo_interno: "",
        colesterol_total: "",
        colesterol_hdl: "",
        colesterol_ldl: "",
        trigliceridos: "",
      };
    },
    async guardarNuevoResultado() {
      try {
        const payload = {
          codigo_ingreso: this.newResultado.codigo_ingreso,
          codigo_interno: this.newResultado.codigo_interno,
          colesterol_total: parseFloat(this.newResultado.colesterol_total),
          colesterol_hdl: parseFloat(this.newResultado.colesterol_hdl),
          colesterol_ldl: parseFloat(this.newResultado.colesterol_ldl),
          trigliceridos: parseFloat(this.newResultado.trigliceridos),
        };
        await axios.post("http://127.0.0.1:8000/resultados/", payload);
        alert("Resultado creado correctamente");
        this.mostrarCrearModal = false;
        this.listarResultados();
      } catch (err) {
        console.error(err);
        if (err.response && err.response.data && err.response.data.error) {
          alert(err.response.data.error);
        } else {
          alert("Error al crear el resultado");
        }
      }
    },
    irHome() {
      const nombreUsuario = this.$route.query.nombreUsuario || 'KEVIN';
      this.$router.push({ path: '/Home', query: { nombreUsuario } });
    }
  },
  mounted() {
    this.listarResultados();
  },
};
</script>

<template>
  <div class="backgroundhome-container">
    <div class="sidebar-container">
      <div class="imagen-logo-menu"></div>

      <h4 class="usuario-name-menu">Bienvenido Ing. KEVIN</h4>

      <ul class="menu-opciones-contenedor" style="width:100%; padding-left:12px">
        <li class="menu-opcion" @click="mostrarCrear">Ingresar resultado</li>
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
        <h2 class="titulo-menu">Resultados de Laboratorio</h2>

        <div class="buscador-central">
          <div class="buscador-bubble">
            <input v-model="idBusqueda" placeholder="Buscar por ID de resultado" type="text" />
            <button class="buscar-round" @click="buscarResultado">
              <img src="../../public/images/lupa_busqueda.png" alt="buscar" style="width:18px;height:18px"/>
            </button>
          </div>
        </div>

        <div class="tabla tarjeta tabla-contenedor-scroll">
          <table class="tabla-menu-sujetos">
            <thead>
              <tr>
                <th>Documento</th>
                <th>Código de ingreso</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              <tr v-if="resultados.length === 0">
                <td colspan="5" style="text-align:center;padding:28px;color:#666">No hay resultados registrados</td>
              </tr>
              <tr v-for="r in resultados" :key="r.id">
                <td>{{ r.paciente__documento }}</td>
                <td>{{ r.paciente__codigo_ingreso }}</td>
                <td>{{ r.paciente__nombre }}</td>
                <td>{{ r.paciente__apellidos }}</td>
                <td>
                  <button class="button-primario" @click="verDetalle(r)">Ver más</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div v-if="mostrarDetalleModal && resultadoDetalle" class="modal-overlay">
          <div class="modal" style="max-width:520px;width:90%">
            <h3 style="margin-top:0">Detalle del resultado</h3>
            <div style="margin-top:10px">
              <p><b>Documento:</b> {{ resultadoDetalle.paciente__documento }}</p>
              <p><b>Código de ingreso:</b> {{ resultadoDetalle.paciente__codigo_ingreso }}</p>
              <p><b>Nombre:</b> {{ resultadoDetalle.paciente__nombre }} {{ resultadoDetalle.paciente__apellidos }}</p>
              <p><b>Laboratorista:</b> {{ resultadoDetalle.laboratorista__codigo_interno }}</p>
              <p><b>Colesterol total:</b> {{ resultadoDetalle.colesterol_total }}</p>
              <p><b>Colesterol HDL:</b> {{ resultadoDetalle.colesterol_hdl }}</p>
              <p><b>Colesterol LDL:</b> {{ resultadoDetalle.colesterol_ldl }}</p>
              <p><b>Triglicéridos:</b> {{ resultadoDetalle.trigliceridos }}</p>
            </div>
            <div style="display:flex;gap:10px;margin-top:14px;justify-content:flex-end">
              <button class="button-secundario" @click="cerrarDetalle">Cerrar</button>
            </div>
          </div>
        </div>

        <div v-if="mostrarCrearModal" class="modal-overlay">
          <div class="modal" style="max-width:520px;width:90%">
            <h3 style="margin-top:0">Ingresar nuevo resultado</h3>
            <div class="grid-form" style="margin-top:10px">
              <input v-model="newResultado.codigo_ingreso" placeholder="Código de ingreso (paciente)" />
              <input v-model="newResultado.codigo_interno" placeholder="Código interno (laboratorista)" />
              <input v-model="newResultado.colesterol_total" placeholder="Colesterol total" />
              <input v-model="newResultado.colesterol_hdl" placeholder="Colesterol HDL" />
              <input v-model="newResultado.colesterol_ldl" placeholder="Colesterol LDL" />
              <input v-model="newResultado.trigliceridos" placeholder="Triglicéridos" />
            </div>
            <div style="display:flex;gap:10px;margin-top:14px;justify-content:flex-end">
              <button class="button-secundario" @click="mostrarCrearModal=false">Cancelar</button>
              <button class="button-primario" @click="guardarNuevoResultado">Crear</button>
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

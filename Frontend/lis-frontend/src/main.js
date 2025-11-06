import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import VueToast from 'vue-toast-notification';
import 'vue-toast-notification/dist/theme-sugar.css'; // O 'dist/theme-default.css'

const app = createApp(App);

// Configuración global del Toast
app.use(router);
app.use(VueToast, {
    position: 'top-right', // Posición por defecto
    duration: 3000,        // Duración en milisegundos
    // Otras opciones...
});

app.mount('#app');

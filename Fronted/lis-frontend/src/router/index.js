import { createRouter, createWebHistory } from "vue-router";
const router=createRouter({
    history:createWebHistory(),
    routes:[
        {
            path:'/',
            name:'Login',
            component:()=>import('../views/LoginView.vue'),
            props: true
        },
        {
            path:'/Home',
            name:'Home',
            component:()=>import('../views/Homeview.vue'),
            props: true
        },
        {
            path: '/laboratoristas',
            name: 'Laboratoristas',
            component: () => import('../views/LaboratoristasView.vue')
        }
        ,
        {
            path: '/resultados',
            name: 'Resultados',
            component: () => import('../views/ResultadosView.vue')
        },
        {
            path: '/pacientes',
            name: 'Pacientes',
            component: () => import('../views/PacientesView.vue')
        }
  ]
});
export default router;

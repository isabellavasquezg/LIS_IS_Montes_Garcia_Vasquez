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
  ]
});
export default router;

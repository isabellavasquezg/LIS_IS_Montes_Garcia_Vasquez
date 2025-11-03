import { createRouter, createWebHistory } from "vue-router";
const router=createRouter({
    history:createWebHistory(),
    routes:[
        {
            path:'/',
            name:'Login',
            component:()=>import('../views/LoginView.vue')
        },
        {
            path:'/Home',
            name:'Home',
            component:()=>import('../views/Homeview.vue')
        }
    ]
});
export default router;
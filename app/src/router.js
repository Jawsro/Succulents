import Vue from 'vue'
import Router from 'vue-router'
// import HelloContainer from "./components/HelloWorld.vue"
//1.引入组件
import Home from './components/succulents/Home.vue'
import Car from './components/succulents/Car.vue'
import Me from './components/succulents/Me.vue'
import Product from './components/succulents/Product.vue'
import home_index from './components/succulents/home_index.vue'
import Tabbaricon from './components/common/Tabbaricon.vue'
Vue.use(Router)

//2.配置路径
export default new Router({
  routes: [
    {path:'/',redirect:'/Home'},//刷新直接进入首页
    {path:'/Home',component:Home},
    {path:'/Me',component:Me},
    {path:'/Product',component:Product},
    {path:'/Car',component:Car},
    {path:'/home_index',component:home_index},
    {path:'/Tabbaricon',component:Tabbaricon},
  ]
})

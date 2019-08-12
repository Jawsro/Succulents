import Vue from 'vue'
import Router from 'vue-router'
// import HelloContainer from "./components/HelloWorld.vue"
//1.引入组件
import Home from './components/succulents/Home.vue'
import Car from './components/succulents/Car.vue'
import Me from './components/succulents/Me.vue'
import Product from './components/succulents/Product.vue'
import Tabbaricon from './components/common/Tabbaricon.vue'
import List from './components/list/List.vue'
import Liet_item from './components/list/Liet_item.vue'
import ProductList from './components/list/ProductList.vue'
import comment from './components/common/comment.vue'
import logon from './components/succulents/logon.vue'
import login from './components/succulents/login.vue'
Vue.use(Router)

//2.配置路径
export default new Router({
  routes: [
    {path:'/',redirect:'/Home'},//刷新直接进入首页
    {path:'/Home',component:Home,name:'Home'},
    {path:'/Me',component:Me},
    {path:'/logon',component:logon},
    {path:'/login',component:login},
    {path:'/Product',component:Product},
    {path:'/Car',component:Car},
    {path:'/Tabbaricon',component:Tabbaricon},
    {path:'/Home/list',component:List},
    {path:'/Home/List/Liet_item/:id',component:Liet_item},
    {path:'/Product/ProductList/:id',component:ProductList},
    {path:'ProductList/comment/:id',component:comment,name:'comments'},
  ]
})

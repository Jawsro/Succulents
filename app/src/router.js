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
import Contact from './components/list/Contact.vue'
import ProductList from './components/list/ProductList.vue'
import comment from './components/common/comment.vue'
import logon from './components/succulents/logon.vue'
import login from './components/succulents/login.vue'
import account from './components/list/account.vue'
import notifications from './components/succulents/notifications.vue'
Vue.use(Router)

//2.配置路径
export default new Router({
  routes: [
    {path:'/',redirect:'/Home'},//刷新直接进入首页
    {path:'/Home',component:Home,name:'Home'},//首页
    {path:'/Me',component:Me},//我的
    {path:'/logon',component:logon},//注册
    {path:'/login',component:login},//个人中心
    {path:'/Product',component:Product},//产品列表
    {path:'/Car',component:Car},//购物车
    {path:'/Tabbaricon',component:Tabbaricon},//页脚图片组件
    {path:'/Home/list',component:List},//多肉养护列表
    {path:'/Home/List/Liet_item/:id',component:Liet_item},//多肉养护文章页
    {path:'/Product/ProductList/:id',component:ProductList},//产品详情页
    {path:'/ProductList/comment/:id',component:comment,name:'comments'},//发表评论组件
    {path:'/Home/Contact',component:Contact},//进入联系我们
    {path:'/account',component:account},//账户安全设置
    {path:'/notifications',component:notifications},//
  ]
})

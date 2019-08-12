/*
入口JS 
*/
import Vue from 'vue'
//导入app 根组件
import App from './App.vue'
//导入自己的routers模块
import router from './router'

//导入vue-resource
import VueResource from 'vue-resource'
//安装vue-resource
Vue.use(VueResource);

// 1. 完整引入 mint-ui
 import MintUI from 'mint-ui'
// 2. 单引入 mint-ui 样式
import 'mint-ui/lib/style.css'
// 3. 将 mint-ui 注册vue
Vue.use(MintUI);

//5. 引入axios.js文件 
import axios from './axios'
// 6 引入vuex
 import Vuex from "vuex"
// 7 注册vuex组件
 Vue.use(Vuex)
 //每次刚进入网站的时候，肯定会调用main.js。在调用的时候，先从本地存储中，把购物车数据读取出来放到store中
 //var car=JSON.parse(localStorage.getItem('car')||'[]')
// 8 创建store
var store =new Vuex.Store({
  // Vuex中全局共享数据
  state:{//this.$store.state.***
     //将购物车中的商品的数据用一个数组存储起来，在car数组中，存储一些商品的对像
     //{id:商品的id,count:要购买的数量，paice：商品单价，selected：false}
     car:[],//商品详情页 点击加入购物车
     cartotalSum:0,//数据库已存在的所有商品的总件数
    delcount1:0,//点击购物车页面删除功能删除的商品的件数
    totalsum:1//点击购物车页面 + - 修改数据为1
    },
  // 修改vuex中全局共享数据
  mutations:{//this.$store.commit("方法的名称"，"按需传递唯一的参数")
  //1.数据库中已存在的产品的总件数
    addtotalSum(state,totalSum1){
      state.cartotalSum=totalSum1
    },
    /////////////////////////////
   //2.产品详情页 点击 加入购物车添加产品需要共享的数据
    addToCar(state,goodsinfo){
      //点击加入购物车，把商品保存到store中的car上
      //1.如果购物车中，之前就已经有这个对应的商品，只修改件数
      //2.如果没有，则直接把商品数据push到car中即可
      
      //假设没有找到对应的商品
      var flag=false
      state.car.some(item=>{
        if(item.id==goodsinfo.id){
          item.count+=parseInt(goodsinfo.count)
          flag=true
          return true
        }
      })
      //如果循环完毕，得到 flag 还是false,则直接把商品数据push到car中
      if(!flag){
        state.car.push(goodsinfo)
      }
      //当更新car 之后 把car数组,存储到本地 的 localStoreage 中
     //localStorage.setItem("car",JSON.stringify(state.car))
      
    },
    //////////////////////////////////
    ///3.购物车 点击  删除  改变数据
    delCarcount(state,delcount){
      state.delcount1=delcount
      state.cartotalSum=state.cartotalSum-state.delcount1
    },
    ///4.购物车 点击  + 改变数据
    upCarcount(state){
      state.cartotalSum=state.cartotalSum+state.totalsum
    },
    //5.购物车 点击  -  改变数据
    downCarcount(state){
       state.cartotalSum=state.cartotalSum-state.totalsum
    }
},
  // 获取vuex中全局共享数据
  getters:{//this.$store.getters.***
    getAllCount:function(state){
      var c=0;
      state.car.forEach(item=>{
       c+=item.count
      })
      return c+state.cartotalSum
    }
  }
})
// 9 将store保存vue实例中
// Vue.config.productionTip=false
// new Vue({
//   router,
//   render:h=>h(App),
//   store    
// }).$mount('#app')

Vue.config.productionTip = false
import './lib/mui/css/mui.css'
import './lib/mui/css/icons-extra.css'
new Vue({
  router,//挂在路由对象到vm实例上
  render: h => h(App),
  store, //挂在store 状态管理对象 
}).$mount('#app')

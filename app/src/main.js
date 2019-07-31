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

//4. 引入图标字体样式文件 
 //import'./font/iconfont.css'
//5. 引入axios.js文件 
import axios from './axios'
// 6 引入vuex
import Vuex from "vuex"
// 7 注册vuex组件
Vue.use(Vuex)
// 8 创建store
var store =new Vuex.Store({
  // Vuex中全局共享数据
  state:{cartCount:0},
  // 修改vuex中全局共享数据
  mutations:{
    // 购物车数量加1
    increment(state){
      state.cartCount++;
    },
    clear(state){
      state.cartCount=0;      
    },
    // 购物车数量增加指定值5
    updateCount(state,c){
      state.cartCount+=c;
    }
  },
  // 获取vuex中全局共享数据
  getters:{
    getCartCount:function(state){
      return state.cartCount;
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
  store  
}).$mount('#app')

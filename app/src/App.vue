<template>
 <div class="app-container">
    <!--顶部 Header 区域-->
    <mt-header fixed title="丢丢家的后花园"></mt-header>
    <!--中间的 路由 routers-view 区域-->
    <transition >
        <router-view></router-view>
    </transition>
    <!--底部 Tabbar 区域-->
    <mt-tabbar  fixed>
        <router-link class="mint-tab-item" id="首页" @click.native="changeState(0)" to="/Home">
            <tabbaricon
            :selectedImage="require('./assets/1.png')"
            :normalImage="require('./assets/11.png')"
            :focused="currentIndex[0].isSelect"
            ></tabbaricon>
            首页
        </router-link>
        <router-link class="mint-tab-item" id="产品" @click.native="changeState(1)" to="/Product">
            <tabbaricon
            :selectedImage="require('./assets/3.png')"
            :normalImage="require('./assets/33.png')"
            :focused="currentIndex[1].isSelect"
            ></tabbaricon>
            产品
        </router-link>
        <router-link class="mint-tab-item" id="购物车" @click.native="changeState(2)" to="/Car">
            <tabbaricon
            :selectedImage="require('./assets/5.png')"
            :normalImage="require('./assets/55.png')"
            :focused="currentIndex[2].isSelect"
            ></tabbaricon>
            购物车
        </router-link>
        <router-link class="mint-tab-item" id="我的" @click.native="changeState(3)" to="/Me">
            <tabbaricon
            :selectedImage="require('./assets/4.png')"
            :normalImage="require('./assets/44.png')"
            :focused="currentIndex[3].isSelect"
            ></tabbaricon>
             我的 
        </router-link>
  </mt-tabbar>
 </div>
</template>
<script>
import Tabbaricon from "./components/common/Tabbaricon.vue"
export default {
  data(){
      return {
        //   active:"首页",
          currentIndex:[
              {isSelect:true},
              {isSelect:false},
              {isSelect:false},
              {isSelect:false}
          ]
      }
  },
  methods:{
      changeState(n){
        //1.n当前按钮下标
        //2.创建循环数据
        for(var i=0;i<this.currentIndex.length;i++){
            if(n==i){
                this.currentIndex[i].isSelect=true
            }
            else{
                this.currentIndex[i].isSelect=false
            }
        }
      }
  },
  components:{
      "tabbaricon":Tabbaricon
     }
}
</script>


<style scoped>
   .app-container{
     padding-top:40px;
     overflow-x:hidden;
   }
   .mint-header.is-fixed{
       background-color: #e89abe;
       font-size: 16px;
   }
   /*修改tabbar 默认文字颜色*/
   .mint-tabbar>.mint-tab-item {
        font-size: 16px;
        color: #232323;
   }
 /*修改tabbar 选中文字颜色 40*/
    .mint-tabbar>.mint-tab-item.router-link-active{
    background-color:transparent;
    color:#e89abe;
    } 
    .v-enter {
        opacity: 0;
        transform: translateX(100%);
    }
    .v-leave-to{
         opacity: 0;
         transform: translateX(-100%);
         position: absolute
    }
    .v-enter-active,
    .v-leave-active{
        transition: all 0.5s ease;
    }
</style>

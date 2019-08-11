<template>
 <div class="app-container">
    <!--顶部 Header 区域-->
    <mt-header fixed title="丢丢家的后花园">
         <mt-button  icon="back" slot="left" @click="goBack" v-show="flag">返回</mt-button>
    </mt-header>
    <!--中间的 路由 routers-view 区域-->
    <transition>
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
            <span class="color" > {{$store.getters.getAllCount}}</span>
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
          ],
          flag:false,
          carList:[],//购物车产品列表
          totalSum:0,//购物车里产品件数总数
      }
  },
  created(){
    this.flag=this.$route.path==='/Home'?false:true
    this.getShopCar()
    },
  methods:{
      //购物车关联用户ID
      getShopCar(){
       
        //1.获取已经登录的用户的id
        var id=sessionStorage.getItem("uid");//console.log(id)
        var url="selShopCar";
        var obj={s_uid:id};
        //发送请求获取该用户下的购物车数据
        this.axios.get(url,{params:obj}).then(result=>{
         console.log(result.data)
          this.carList=result.data;
          ////////////
        for(var item of this.carList){
            this.totalSum+=item.s_count;
            
        }
        console.log(this.totalSum)
        var totalSum1=this.totalSum;
        //sessionStorage.setItem("totalSum",totalSum1);
         this.$store.commit("addtotalSum",totalSum1)
        //////////////
        })
      },
      goBack(){
            this.$router.go(-1);//点击后退
      },
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
  watch:{
          '$route.path':function(newVal){
             if(newVal==='/Home'){
                 this.flag=false
             }else{
                 this.flag=true
             }
          }
     },
  components:{
      "tabbaricon":Tabbaricon
     }
}
</script>


<style scoped>
.color{
    display: inline-block;
    width: 20px;
    height: 20px;border-radius: 50%;
    background-color: #e89abe;
    color: #fff;
    text-align: center;
    line-height: 20px;
    position: absolute;
    top:4px;
    left:240px;
}
   .app-container{
     padding-top:40px;
     padding-bottom: 40px;
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

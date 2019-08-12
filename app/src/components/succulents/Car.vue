<template>
<div class="shopcar" >
    <div class="carList">
      <!--  购物车列表区-->
      <div class="mui-card" v-for="(item,index) in carList" :key="item.s_pid">
          <div class="mui-card-content">
            <div class="mui-card-content-inner">
              <input type="checkbox" class="input" v-model="item.isSelect" @change="select_one(index)"/>
               <router-link :to="'/Product/ProductList/'+item.s_pid">
              <img :src="'http://127.0.0.1:3000/'+item.s_img" alt=""> </router-link>
              <div class="info"> 
                <h1>{{item.s_title}}</h1>
                <p> 
                  <span class="price">￥{{item.s_price.toFixed(2)}}</span>
                  <!-- 数量加减-->
                  <div class="mui-numbox" data-numbox-min='1' data-numbox-max='9'>
                        <button class="mui-btn mui-btn-numbox-minus" type="button" @click="down(index)">-</button>
                        <span id="test" class="mui-input-numbox"   >{{item.s_count}}</span>
                        <button class="mui-btn mui-btn-numbox-plus" type="button" @click="up(index)">+</button>
                    </div>
                  <a href="#" @click="move(index)" class="move">删除</a>
                </p>
              </div>
            </div>
          </div>
        </div>
    </div>
    <!-- 结算区-->
    <div class="mui-card ">
          <div class="mui-card-content">
            <div class="mui-card-content-inner jiesuan">
              <div class="left">
                <input type="checkbox" @click="selectAll"  v-model="allChecked"/>全选
                <p>总计（不含运费）</p>
                <p>已选商品 <span class="color">{{totalNum}}</span> 件，总价<span class="color">￥{{totalPrice.toFixed(2)}}</span></p>
              </div>
              <mt-button type="danger">结算</mt-button>
            </div>
          </div>
        </div>
  </div>
</template>
<script>

export default {
  data(){
    return{ 
     //产品件数动态加载
      carList:[],//购物车产品列表
      allChecked: false,//全选选中状态
      isSelect:false,//默认状态
      totalPrice:0,//选中产品总价
      totalNum: 0,//选中产品总数量
    }
  },
  created(){
    this.getShopCar()
   //console.log(this.$store.getters.getAllCount,12)
  },
 
  methods:{
    //计算总价
    goTotal(){
      this.totalPrice=0;
      this.totalNum=0;
      for(var i of this.carList){
        if(i.isSelect==true){
        this.totalPrice+=i.s_price*i.s_count;
        this.totalNum+=i.s_count;}
      }
    },
    //点 - 功能
    down:function(index){
      if(this.carList[index].s_count<=1){
        this.carList[index].s_count==1;
        return;
      }else{
        this.carList[index].s_count--
      }
      this.goTotal()

         //点击  + 后修改的数据传入数据库
          var s_pid=this.carList[index].s_pid;
          var s_count=this.carList[index].s_count;
          var s_uid=this.carList[index].s_uid;
          var url="updateCarCount";
          var obj={s_pid,s_count,s_uid};
          this.axios.get(url,{params:obj}).then(result=>{
            console.log(result.data)
          })
      
       //vuex 中 - 功能操作全局共享的数据
      this.$store.commit("downCarcount");
    },
     //点 + 功能
      up:function(index){
          this.carList[index].s_count ++
          this.goTotal()
          console.log( this.carList[index])
          //点击  + 后修改的数据传入数据库
          var s_pid=this.carList[index].s_pid;
          var s_count=this.carList[index].s_count;
          var s_uid=this.carList[index].s_uid;
          var url="updateCarCount";
          var obj={s_pid,s_count,s_uid};
          this.axios.get(url,{params:obj}).then(result=>{
            console.log(result.data)
          })
          /////////////
           //vuex 中 + 功能操作全局共享的数据
          this.$store.commit("upCarcount");
      },
      //删除功能
      move(index){//console.log(1213)
        //删除 点击删除的那一行
        
        var id=sessionStorage.getItem("uid");//console.log(id)
        var s_pid=this.carList[index].s_pid;// console.log(s_pid,index)
        var url="deleteCar";
        var obj={s_pid:s_pid,s_uid:id};
        this.axios.get(url,{params:obj}).then(result=>{
          //console.log(result.data)
          if(result.data==1){
              this.$toast("删除成功");
             var arr=this.carList.splice(index,1);
             //vuex 中删除功能操作全局共享的数据
             var delcount=arr[0].s_count
             //console.log(arr,delcount)
             this.$store.commit("delCarcount",delcount);
          }
        })
      },
      //购物车关联用户ID
      getShopCar(){
       
        //1.获取已经登录的用户的id
        var id=sessionStorage.getItem("uid");//console.log(id)
        var url="selShopCar";
        var obj={s_uid:id};
        //发送请求获取该用户下的购物车数据
        this.axios.get(url,{params:obj}).then(result=>{
         //console.log(result.data)
          this.carList=result.data;
        })
      },
      //全选功能
      selectAll(){
        if(this.allChecked){
          for(var item of this.carList){
           item.isSelect=false
          }
          this.allChecked=false
        }else{
          for(var item of this.carList){
            item.isSelect=true
          }
          this.allChecked=true;
        }
        this.goTotal()
      },
      //单选功能
      select_one(index){
        this.goTotal()
        this.allChecked=false;
        var num=0;
        for(var item of this.carList){
          if(item.isSelect){
             num++;
           }
           if(num==this.carList.length){
             this.allChecked=true
           }
        }
      
         
      },
  },
  
}
</script>
<style scoped>
  .jiesuan{
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px
  }
  .jiesuan p{
    margin-bottom: 0px;
  }
  .jiesuan .color{
    color:#e89abe;
    font-size: 16px;
    font-weight: bold;
  }
    .shopcar{
      background-color: #fff;
      overflow: hidden;
    }
    .carList img{
      width:60px;
      height:60px;
    }
    .info h1{
      font-size: 16px;
      color: #333
    }
    .price{
      color: #e89abe;
    }
    .mui-numbox{
      height: 25px;
     display: inline-block;
     margin-right: 20px;
    }
    .carList .mui-card-content-inner{
      display: flex;
      align-items: center
    }
    .carList  p{
      margin-bottom: 0px;
      display: inline-block;
      margin-right: 10px;
    }
    .info{
      margin-left: 10px;
    }
    input{
      outline: none;
      border: 0;
      
    }
    input[type='checkbox']{
      border: 1px solid red !important;
      background-color: #fff !important;
      margin-right: 12px;
    }
     .move,.mui-input-numbox{
      color: #333
    }
    
</style>


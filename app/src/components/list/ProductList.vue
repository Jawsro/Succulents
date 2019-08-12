<template>
  <div class="ProductList-container" v-if="ProductList[0].title!==undefined">
    <!--  点击 加入购物车 小球-->
    <transition @before-enter="beforeEnter"
                @enter="Enter"
                @after-enter="afterEnter">
        <div class="ball" v-show="ballFlag" id="ball"></div>
    </transition>     
      
      <!--产品轮播图-->
      <div class="mui-card">
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                    <mt-swipe :auto="4000" >
                        <mt-swipe-item v-for="item in ProductListImg" :key="item.iid">
                            <img :src="'http://127.0.0.1:3000/'+item.md" alt="">
                        </mt-swipe-item>
                    </mt-swipe>
                </div>
            </div>
        </div>
    <!--产品购买-->
    <div class="mui-card mui-card1">  
        <div class="mui-card-header" >{{ProductList[0].title}}</div>
        <div class="mui-card-content">
            <div class="mui-card-content-inner">
               <p class="price">
                   价格:<span>￥{{ProductList[0].price.toFixed(2)}}</span>
               </p>
               <p class="num">购买数量:
                   <div class="mui-numbox" data-numbox-min='1' data-numbox-max='9'>
                        <button class="mui-btn mui-btn-numbox-minus" type="button" @click="down">-</button>
                        <input id="test" class="mui-input-numbox" type="number"  v-model="count" @change="counten()"/>
                        <button class="mui-btn mui-btn-numbox-plus" type="button" @click="up">+</button>
                </div>
               </p>
               
                <div>
                    <mt-button size="small" type="danger">立即购买</mt-button>
                    <mt-button size="small" type="primary" @click="addToshopcar">加入购物车</mt-button>
                      <!--产品评论-->
                    <mt-button size="large" plain @click="goComment(id)" class="comment">多肉评论</mt-button>
                </div>
            </div>
        </div>
        
    </div>
  
    
  </div>
</template>
<script>
//导入数量加减框组件
import numbox from "../common/mui-numbox.vue";

export default {
  data(){
      return{
        count:1,//默认值为1
        id:this.$route.params.id,//将URL地址中传递过来的ID值，直接挂载在data上，方便以后调用
        ProductList:[''],//产品的详情 的对象
        ProductListImg:[],////产品的图片 的对象数组
        ballFlag:false//控制小球的隐藏和显示
      }
  },
  created(){
      this.getProductListImg();
      this.getProductList();
},
  methods:{
      //点 + 功能
      up(){
          this.count ++
       },
      //点 - 功能
      down(){
          if(this.count<=1){
              this.count=1;
              return;
          }
          else{
              this.count--
          }
      },
      //点击 加入购物车 小球飞 的 功能
      beforeEnter(el){
        el.style.transform="translate(0,0)"
      },
      Enter(el,done){
        el.offsetWidth;
        //优化小球飞动
        //1.获取小球的位置
        const ballposition=document.getElementById("ball").getBoundingClientRect();
        console.log(ballposition)
        // //2.获取购物车上小圈 的位置
        const colorposition=document.getElementById("color").getBoundingClientRect(); 
        console.log(colorposition)
        //获取 小圈 的横坐标 到小球横坐标的差
         const xDist=colorposition.left-ballposition.left;
         //获取 小圈 的纵坐标 到小球纵坐标的差
         const yDist=colorposition.top-ballposition.top;
        //动态添加坐标
        el.style.transform=`translate(${xDist}px,${yDist}px)`;
        el.style.transition="all 1s cubic-bezier(0.4,-0.3,1,0.68)";
        done();
      },
      afterEnter(el){
       this.ballFlag=!this.ballFlag; 
      },
      //////////////////////////////
      //添加购物车
      addToshopcar(){
           
            //点击 加入购物车
            //1.获取已经登录的用户的id
            var id=sessionStorage.getItem("uid");//console.log(id)
            //如果没有登录 ，点击购物车 ，数据保存在本地 localStorage 
            if(id==undefined){
                this.$toast("请先登录")
            }else{//如果已经登录
                //console.log(id);
                //添加购物车,小球显示
                this.ballFlag=!this.ballFlag;
                //发送请求，拿到该产品的信息
                var url="selProductList";
                var obj={id:this.id};
                this.axios.get(url,{params:obj}).then(result=>{
                //console.log(result.data);
                var pid=(result.data)[0].fid;
                var title1=(result.data)[0].s_title;
                var price1=(result.data)[0].price;
                var img1=(result.data)[0].img;
                //console.log(img1)
                //发送请求添加到购物车
                var url1="insertShopcar";
                var obj={s_uid:id,s_pid:pid,s_img:img1,s_title:title1,s_price:price1,s_count:this.count};
                this.axios.get(url1,{params:obj}).then(redult=>{
                    //console.log(result.data)
                    if(result.data.length>0){
                        this.$toast("添加成功")

                //拼接出一个要保存在 store 中car数组里的商品信息对象
                //{id:商品的id,count:商品的件数，price:商品的单价，selected:false}
                var goodsinfo={
                   id:this.id,
                    count:this.count,
                   price:this.ProductList[0].price,
                    selected:true
                }
                //调用store中的mutations 来将商品加入到购物车
                this.$store.commit("addToCar",goodsinfo)
    
                    }
                    
                })
            })
        }
    
                
    },
    goComment(id){
        //点击跳转至商品评论页面
        this.$router.push({name:"comments",params:{id}})
    },
    getProductList(){
        var url="selProductList";
        var obj={id:this.id};
        this.axios.get(url,{params:obj}).then(result=>{
          
            this.ProductList=result.data
             //console.log( this.ProductList[0].title)
              //console.log( result.data)
        })
    },
    getProductListImg(){
        var url="selProductListImg"
        var obj={id:this.id}
        this.axios.get(url,{params:obj}).then(result=>{
            // console.log(result.data)
            this.ProductListImg=result.data
        })
    }
  },
  
}
</script>
<style scoped>
.mui-card-footer{
    height: 100px;
}
    .ProductList-container{
        
        overflow: hidden;
    }
    .mui-card{
        height: 300px;
    }
    .mui-card-content{
        height: 100%;
    }
    .mui-card-content-inner{
         height: 100%;
    }
    .mint-swipe-item img{
        width:100%
    }
    .price,.num{
        font-size: 16px;
    }
    .price span{
        color: #e89abe;
    }
    .mui-numbox{
        margin-bottom: 10px;
    }
    .mint-button--danger{
        margin-right: 10px;
    }
    
    .comment{
        margin-top: 20px;
    }
    .ball{
        width: 15px;height: 15px;
        border-radius: 50%;
        background-color: red;
        position: absolute;
        z-index: 99;
        top:508px;
        left:78px;
        transform:translate(0px,0px)
    }
    .mui-card1{
        margin-bottom: 40px;
    }
</style>


<template>
<div class="shopcar">
    <div class="carList">
      <!--  购物车列表区-->
      <div class="mui-card">
          <div class="mui-card-content">
            <div class="mui-card-content-inner">
              <input type="checkbox" class="input"/>
              <img src="../../assets/12.jpg" alt="">
              <div class="info"> 
                <h1>玉露</h1>
                <p> 
                  <span class="price">￥1.20</span>
                  <!-- 数量加减-->
                  <div class="mui-numbox" data-numbox-min='1' data-numbox-max='9'>
                        <button class="mui-btn mui-btn-numbox-minus" type="button">-</button>
                        <input id="test" class="mui-input-numbox" type="number" value="1" />
                        <button class="mui-btn mui-btn-numbox-plus" type="button">+</button>
                    </div>
                  <a href="#">删除</a>
                </p>
              </div>
            </div>
          </div>
        </div>
    </div>
    <!-- 结算区-->
    <div class="mui-card ">
          <div class="mui-card-content">
            <div class="mui-card-content-inner">
              <input type="checkbox" />全选
            </div>
          </div>
        </div>
  </div>
</template>
<script>
export default {
  data(){
    return{ 
      
    }
  }
}
</script>
<style scoped>
    .shopcar{
      background-color: #fff;
      overflow: hidden;
    }
    .carList img{
      width:60px;
      height:60px;
    }
    h1{
      font-size: 16px;
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
      margin-left: 20px;
    }
    input{
      outline: none;
      border: none;
      
    }
    .input{
      border: 1px solid red !important;
      background-color: #fff !important
    }
</style>


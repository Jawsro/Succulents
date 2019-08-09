<template>
  <div>
    <!--轮播图-->
    <mt-swipe :auto="4000">
      <mt-swipe-item>
        <img src="../../assets/12.jpg" alt="">
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="../../assets/1500268673.jpg" alt="">
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="../../assets/1500268396.jpg" alt="">
      </mt-swipe-item>
    </mt-swipe>
    <!--9宫格-->
    <ul class="mui-table-view mui-grid-view mui-grid-9">
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
          <router-link to="/Home/list">
            <img src="../../assets/1500254044.jpg" alt="">
            <div class="mui-media-body">多肉养护</div>
          </router-link>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
          <router-link to="">
            <img src="../../assets/1500254096.jpg" alt="">
            <div class="mui-media-body">图片分享</div>
          </router-link>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
          <router-link to="">
            <img src="../../assets/1500255413.jpg" alt="">
            <div class="mui-media-body">留言反馈</div>
          </router-link>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
          <router-link to="">
            <img src="../../assets/1500269931.jpg" alt="">
            <div class="mui-media-body">多肉购买</div>
          </router-link>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
          <router-link to="">
            <img src="../../assets/1500255483.jpg" alt="">
            <div class="mui-media-body">视频专区</div>
          </router-link>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
          <router-link to="">
            <img src="../../assets/1500255491.jpg" alt="">
            <div class="mui-media-body">联系我们</div>
          </router-link>
        </li>
      </ul> 
  </div>
</template>
<script>
export default {
  data(){
    return{ 
      
    }
  },
  
}
</script> 
<style scoped>
    .mint-swipe{
      height: 200px;
    }
    .mint-swipe-item img {
      width: 100%;
      height:100%
      
    }
    .mui-grid-view.mui-grid-9{
      background-color: #fff;
    }
    .mui-grid-view.mui-grid-9 .mui-table-view-cell{
      border: none;
    }
    .mui-table-view-cell.mui-media a img{
      width:80px;
      height:80px;
    }
    .mui-table-view-cell.mui-media a  .mui-media-body{
      font-size: 13px;
    }
</style>


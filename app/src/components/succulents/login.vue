<template>
  <div class="login-me">
    <!--页面标题栏开始-->
    <div class="mui-navbar-inner mui-bar mui-bar-nav">
        <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
            <span class="mui-icon mui-icon-left-nav" @click="goBack()"></span>
        </button>
        <h1 class="mui-center mui-title">设置</h1>
    </div>
    <!--页面标题栏结束-->
    <!--页面主内容区开始-->
    <div class="mui-page-content">
        <div class="mui-scroll-wrapper">
            <div class="mui-scroll">
                <ul class="mui-table-view mui-table-view-chevron">
                    <li class="mui-table-view-cell mui-media">
                        <a class="mui-navigate-right" href="#account">
                            <img class="mui-media-object mui-pull-left head-img" id="head-img" src="">
                            <div class="mui-media-body">
                                Hello MUI
                                <p class='mui-ellipsis'>账号:hellomui</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <ul class="mui-table-view mui-table-view-chevron">
                    <li class="mui-table-view-cell">
                        <router-link to="/account" class="mui-navigate-right">账号与安全</router-link>
                    </li>
                </ul>
                <ul class="mui-table-view mui-table-view-chevron">
                    <li class="mui-table-view-cell">
                        <router-link to="notifications" class="mui-navigate-right">新消息通知</router-link>
                    </li>
                 </ul>
                <ul class="mui-table-view">
                    <li class="mui-table-view-cell" style="text-align: center;">
                        <a>退出登录</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--页面主内容区结束-->
  </div>
</template>
<script>
export default {
  data(){
      return{

      }
  },
  methods:{
      goBack(){
          this.$router.go(-1)
      }
  }
}
</script>

<style scoped>
    .mui-media-body{
        margin-top: 40px;
    }
</style>


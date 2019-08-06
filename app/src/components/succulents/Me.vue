<template>
<!--登录页面-->
  <div class="login-container">
    <h3>用户登录</h3>
    <mt-field label="手机号" placeholder="请输入手机号" type="tel" class="myinput"></mt-field>
    <mt-field label="密码" placeholder="请输入密码" type="password" class="myinput"></mt-field>
    <router-link to="/login" class="login">登录</router-link>
    <router-link to="/logon" class="logon"> 没有帐号？请注册</router-link>
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
.login-container{
  margin-top: 150px;
}
.mint-button{
   margin-top: 10px;
}
.logon,.login{
  display: inline-block;
  width: 100%;
  line-height: 41px;
  text-align: center;
  height: 41px;
  margin-top: 10px;
  background-color: #ef4f4f;
  color:#fff;
  font-size: 18px;
  border-radius: 4px;
}
</style>


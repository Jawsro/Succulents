<template>
<!--登录页面-->
  <div class="login-container">
    <router-link to="/login" class="login-in">设置</router-link>
    <h3>用户登录</h3>
    <mt-field label="手机号" placeholder="请输入手机号" type="tel" class="myinput" v-model="phone"></mt-field>
    <mt-field label="密码" placeholder="请输入密码" type="password" class="myinput" v-model="pwd"></mt-field>
    <mt-button size="large" type="danger" class="login" @click="login()">登录</mt-button>
    <router-link to="/logon" class="logon"> 没有帐号？请注册</router-link>
  </div>
</template>
<script>
export default {
  data(){
    return{ 
      phone:"",
      pwd:""
    }
  },
  methods:{
    login(){
      //1.获取用户登录信息
      var uphone=this.phone;
      var upwd=this.pwd;
      //2.正则表达式判断手机号和密码格式是否正确
      var reg=/^1[3-8]\d{9}$/;//手机号验证
      var reg1= /^[a-z0-9_]{6,12}$/i;//密码验证
      if(!reg.test(uphone)){
        this.$toast("手机号格式错误")
      }else if(!reg1.test(upwd)){
        this.$toast("请输入正确密码")
      }
      var url="login";
      var obj={uphone:uphone,upwd:upwd};
      this.axios.get(url,{params:obj}).then(result=>{
        console.log(result.data)
        if(result.data.length>0){
          this.$toast("登录成功");
          sessionStorage.setItem("uid",(result.data)[0].uid);//浏览器保存用户id
         
          this.$router.push({
          name: 'Home'
        })
        }else if(result.data==0){
          this.$messagebox("提示","手机号或密码错误")
        }
      })
    }
  },
}
</script>
<style scoped>
.login-in{
  color: #000;
  font-size: 24px;
  font-weight: 700;
}
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


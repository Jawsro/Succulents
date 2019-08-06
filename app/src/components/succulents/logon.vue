<template>
<!--注册页面-->
  <div class="logon-container">
      <h3>用户注册</h3>
    <mt-field label="手机号" placeholder="请输入手机号" type="tel" class="myinput" v-model="phone"></mt-field>
    <mt-field label="密码" placeholder="请输入密码" type="password" class="myinput" v-model="pwd"></mt-field>
    <mt-button size="large" type="danger" @click="logon()">注册</mt-button>
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
    logon(){console.log(1212)
        //1.完成注册
        //1.1获取用户手机号和密码
        var reg=/^1[3-8]\d{9}$/;//手机号验证
        var reg1= /^[a-z0-9_]{6,12}$/i;//密码验证
   
        var uphone=this.phone;console.log(uphone)
        var upwd=this.pwd;
        //1.2判断格式是否正确
        if(!reg.test(uphone)){
             //1.3:验证手机号 出错提示 
            this.$toast("手机号格式不正确");
            return;
        }
        if(!(reg1.test(upwd))){
            this.$toast("请输入6-12位密码");
        }
        var url="logon";
        var obj={uphone:uphone,upwd:upwd};
        this.axios.get(url,{params:obj}).then(result=>{
            console.log(result.data)
            if(result.data==1){
                this.$messagebox("提示","该手机号已注册")
            }
        })
    }
  },
}
</script>

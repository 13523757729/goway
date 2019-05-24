<template>
  <div class="app-register">
    <div class="regNav">
      <router-link to="/" class="back"><span class="mui-icon mui-icon-back"></span></router-link>
      <span class="gets">去玩吧</span>
    </div>
    <div class="regInp">
      <h1>去玩注册</h1>
      <input type="text" placeholder="输入手机号" class="phone" v-model="phone" @keyup="getInputval">
      <input type="password" placeholder="密码(8~16位字符)" class="pwd" v-model="pwd" @keyup="getInputval">
      <input type="password" placeholder="确认密码" class="pwd" v-model="pwd1" @keyup="getInputval">
      <input type="button" value="注册" class="but" :disabled="isLogin" @click="btnLogin"/>
      <div class="regOth">
        <router-link to="/login" class="right"><span>直接登录</span></router-link>
      </div>
    </div>
    <div class="regHelp"><router-link to=""><span>登录注册帮助？</span></router-link></div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      phone:"",
      pwd:"",
      pwd1:"",
      isLogin:true,
    }
  },
  created(){
  },
  methods:{
    // 按钮是否可点击
    getInputval(){
      // 如果input的value长度大于1
      if(this.phone.length>1 && this.pwd.length>1&&this.pwd1.length>1){
        // 取消禁用
        this.isLogin=false;
      }else{
        // 否则就禁用
        this.isLogin=true;
      }
    },
    btnLogin(){
      var p=this.phone;
      var w=this.pwd;
      var w1=this.pwd1;
      // 判断手机格式是否正确
      var pureg=/^1[3-8]\d{9}$/;
      if(!pureg.test(p)){
        this.$toast("手机格式不正确")
        return;
      }
      // 判断密码格式是否正确
      var wreg=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
      if(!wreg.test(w)){
        this.$toast("密码格式错误");
        return;
      }
      // 发送ajax请求
      var url="http://127.0.0.1:3000";
      url+="/register?phone="+p+"&pwd="+w;
      this.axios.get(url).then(result=>{
        if(result.data.code==1 && w1==w){
          this.$toast(result.data.msg);
          this.$router.push("/login");
        }else{
          this.$toast("密码错误");
        }
      })
    }
  },
}
</script>
<style>
  .app-register{
    /* width:100%;*/
    height:100vh;
    background-color:#fff !important; 
    text-align: center;
    box-sizing: border-box;
    padding:15px;
    position:relative;
  }
  .regNav{height:40px;margin-bottom:60px;display: flex; justify-content:start; }
  .regNav .gets{margin-left:33%;margin-top:8px;}
  .regInp h1{text-align: left; margin-bottom:50px;}
  .app-register .phone,.app-register .pwd{
    border:none;
    background:none;
    border-bottom:1px solid gainsboro;
    margin-bottom: 20px;
  }
  .regInp .but{
    width:100%;
    height:50px;
    border-radius: 35px;
    font-size:20px;
    color:white;
    background-color:#15db91;
    border:none;
    margin-bottom:20px;
  }
  .regInp a{color:gray;}
  .regInp a:hover,.regHelp a:hover{color:gray;}
  .regInp .regOth{
    display:flex;
    justify-content:flex-end;
    margin-bottom: 100px;
  }
  .regNav .mui-icon-back{font-size:35px;}
  .regHelp a{color:gray;font-size:12px;}
</style>

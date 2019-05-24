<template>
  <div class="app-login">
    <div class="loginNav">
      <router-link to="/index" class="back"><span class="mui-icon mui-icon-back"></span></router-link>
      <span class="gets">去玩吧</span>
    </div>
    <div class="loginInp">
      <h1>账户密码登录</h1>
      <input type="text" placeholder="请输入手机号" class="phone" v-model="phone" @keyup="getInputval">
      <input type="password" placeholder="请输入密码" class="pwd" v-model="pwd" @keyup="getInputval">
      <input type="button" value="登录" class="but" :disabled="isLogin" @click="btnLogin"/>
      <div class="loginOth">
        <router-link to="" class="left"><span>手机号验证登录</span></router-link>
        <router-link to="/register" class="right"><span>去注册</span></router-link>
      </div>
    </div>
    <!-- <div class="registerInp">
      <h1>用户注册</h1>
      <input type="text" placeholder="请输入手机号" class="phone" v-model="phone" @keyup="getInputval">
      <input type="password" placeholder="请输入密码" class="pwd " v-model="pwd" @keyup="getInputval">
      <input type="button" value="登录" class="but" :disabled="isLogin" @click="btnLogin"/>
      <div class="loginOth">
        <a href="javascript:;" class="left"><span>手机号登录</span></a>
        <a href="javascript:;" class="right"><span>需要帮助？</span></a>
      </div>
    </div> -->
    <div class="loginIcon">
        <router-link to=""><div class="qq"><span class="mui-icon mui-icon-qq"></span></div></router-link>
        <router-link to=""><div class="weibo"><span class="mui-icon mui-icon-weibo"></span></div></router-link>
    </div>
    <div class="loginHelp"><router-link to=""><span>登录注册帮助？</span></router-link></div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      phone:"",
      pwd:"",
      isLogin:true,
    }
  },
  created(){
  },
  methods:{
    // 按钮是否可点击
    getInputval(){
      // 如果input的value长度大于1
      if(this.phone.length>1 && this.pwd.length>1){
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
      url+="/login?phone="+p+"&pwd="+w;
      this.axios.get(url).then(result=>{
        if(result.data.code==1){
          // console.log(result);
          this.$toast(result.data.msg)
          setTimeout(() => {
            this.$router.go(-1);
          }, 2000);
        }else if(result.data.code==-1){
          this.$toast(result.data.msg);
        }
      })
    }
  },
}
</script>
<style>
  .app-login{
    /* width:100%;*/
    height:100vh;
    background-color:#fff !important; 
    text-align: center;
    box-sizing: border-box;
    padding:15px;
    position:relative;
  }
  .loginNav{height:40px;margin-bottom:60px;display: flex; justify-content:start; }
  .loginNav .gets{margin-left:33%;margin-top:8px;}
  .loginInp h1{text-align: left; margin-bottom:50px;}
  .app-login .phone,.app-login .pwd{
    border:none;
    background:none;
    border-bottom:1px solid gainsboro;
    margin-bottom: 20px;
  }
  .loginInp .but{
    width:100%;
    height:50px;
    border-radius: 35px;
    font-size:20px;
    color:white;
    background-color:#15db91;
    border:none;
    margin-bottom:20px;
  }
  .loginInp a{color:gray;}
  .loginInp a:hover,.loginHelp a:hover{color:gray;}
  .loginInp .loginOth{
    display:flex;
    justify-content:space-between;
  }
  .qq,.weibo{
    width:40px;
    height:40px;
    border-radius:50%;
    background-color:#ccc;
  }
  .qq{margin-right:65px;}
  .loginIcon .mui-icon-qq,.loginIcon .mui-icon-weibo{
    font-size:30px;
    color:white;
    text-align: center;
    line-height:40px;
  }
  .loginIcon .mui-icon-weibo, .loginNav .mui-icon-back{font-size:35px;}
  .loginIcon{display:flex;justify-content: center;margin-top:110px;margin-bottom:40px;}
  .loginHelp a{color:gray;font-size:12px;}
</style>

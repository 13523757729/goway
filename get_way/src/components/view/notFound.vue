<template>
  <div class="app-notFound">
    <header class="back">
      <div @click="back"><span class="mui-icon mui-icon-back"></span></div>
      <router-link to="/index">返回首页</router-link>
    </header>
    <div class="not">
      <div class="img">
        <img src="http://127.0.0.1:3000/img/search/timg(8).gif" alt="">
      </div>
      <p>敬请期待 ···</p>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{}
  },
  methods: {
    back(){
      this.$router.go(-1);
    }
  },
}
</script>
<style>
  .app-notFound header{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    background-color:#fff;
    box-shadow: 2px 3px 15px #acacac;
  }
  .app-notFound header .mui-icon{
    font-size:35px;
  }
  .app-notFound .back a{
    color:#07c342;
  }
  .app-notFound .back .index{
    font-size:15px;
  }
  .app-notFound .not{
    height:500px;
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }
  .img{text-align:center;}
  .app-notFound img{
    width:80%;
    margin:auto;
  }
  .app-notFound p{
    font-size:22px;
  }
</style>

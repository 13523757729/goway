<template>
  <div class="app-search">
    <div class="search_sec">
      <div class="search_form">
        <div class="back" @click="searchHidden"><span class="mui-icon mui-icon-back"></span></div>
        <input v-focus type="text"  v-model="kw"  placeholder="搜索" @keyup.13="search">
        <div @click="search" class="btn-search" >搜索</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      kw:"",
      flag:false,
    }
  },
  created() {
    // this.kw=this.$route.params.key;
  },
  methods: {
    searchHidden(){
       this.$router.go(-1)
     },
     search(){
      var kw=this.kw;
       if(!kw){
        this.$toast("请输入您要搜索的内容")
        return
      }
      // 当单击按钮时执行查询
      // 如果输入的内容不为空
      if(this.kw.trim()!==""){
        // 在vue的js程序中执行跳转
        this.$router.push(
        // 跳到/search并携带参数kwords
        `/search/${this.kw}`
        );
        if(this.$route.path.split("/")[1]=="search"){
         location.reload()
     }
      }
    }
  },
  directives:{
    focus:{
      inserted:function(elem){
        elem.focus()
      }
    }
  }
}
</script>
<style>
 .app-search .search_form{
    width:375px;
    display: flex;
  }
  .app-search .back,.app-search .search_form input,.app-search .btn-search{
    height:45px;
    border-radius: 0;
    background:#fff;
  }
  .app-search .back{
    width:12%;
    border-bottom:1px solid #ddd;
  }
  .app-search .mui-icon-back{
    font-size:30px;
    text-align: center;
    line-height: 45px;
  }
  .app-search .search_form input{
    width:70%;
    font-size:18px;
    margin:0;
  }
  .app-search .search_form .btn-search{
    width:18%;
    background-color:#258a5c;
    color:#fff;
    text-align: center;
    line-height:45px;
  }
</style>

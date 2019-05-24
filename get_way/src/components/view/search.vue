<template>
  <div class="app-search">
    <section class="search_sec">
      <div class="search_form">
         <div class="back"><span class="mui-icon mui-icon-back" @click="back"></span></div>
        <input type="text" autofocus="autofocus" v-model="kw"  placeholder="搜索" @keyup.13="search">
        <div @click="search" class="btn-search" >搜索</div>
      </div>
    </section>
    <section class="search-result" v-show="flag">
      <div>
        <ul>
          <li v-for="item of searchList" :key="item.id">
            <router-link to="/search_detail">
              <div>
                <h2>
                  <span>[目的地]</span>{{item.title}}
                </h2>
                <h3>{{item.Etitle}}</h3>
                <p>{{item.subtitle}}</p>
              </div>
              </router-link>
          </li>
      </ul> 
      </div>
    </section>
    <section class="no-result" v-show="!flag">
      <img src="http://127.0.0.1:3000/img/search/timg(2).gif"/>
      <p>很抱歉！没有找到你要查询的结果</p>
    </section>
  </div>
</template>
<script>
export default {
  data(){
    return{
     kw:"",  //专门等着接文本框输入的关键词
     searchList:[],
     hasMore:true,
     flag:true
    }
  },
  created(){
    // 组件重新加载后
      //手动从地址栏中获得参数kwords 
      // kwords要和router.js中的:kwords一致
      this.kw=this.$route.params.key;
  },
  methods:{
    back(){
      this.$router.push("/index");
    },
    search(){
      var kw=this.kw;
      var url="http://127.0.0.1:3000/searchList?title="+kw;
      this.axios.get(url).then(result=>{
        console.log(result.data.code);
         if(result.data.code==1){
           this.searchList=result.data.data;
           this.flag=true;
           console.log(this.searchList);
         }else if(result.data.code==0){
           this.flag=false;
         }
      })
      // 当单击按钮时执行查询
      // 如果输入的内容不为空
      //  if(this.kw.trim()!==""){
      //    // 在vue的js程序中执行跳转
      //    this.$router.push(
      //    // 跳到/search并携带参数kwords
      //    `/search/${this.kw}`
      //    );
      //  }
    },
  },
  watch:{
      kw(){
        this.search();
      }
    },
    load(){  
      var url="http://127.0.0.1:3000/searchList";
      this.axios.get(url,{params:{
        key:this.kw
      }}).then(result=>{
         if(result.data.code==1){
            this.searchList=result.data.data;
            this.flag=true;
          }else if(result.data.code==0){
            this.flag=false;
          }
      })
    }, 
}
</script>
<style>
  .app-search .search_form{
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
    color:#000;
    font-size:30px;
    margin-left:10px;
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
  .app-search .search-result{
    margin-top:10px;
  }
  .app-search .search-result ul{
    padding:0;
    margin:0;
  }
  .app-search .search-result ul li{
    background-color:#fff;
    border-top:1px solid #ddd;
    padding:10px;
  }
  .app-search .search-result ul li p{
    margin:0;
  }
  .app-search .search-result ul li h2{
    color:#2d2d2d;
    font-weight:600;
    font-size:15px;
  }
  .app-search .search-result ul li h2 span{
    color:#000;
    font-weight:400;
    font-size:15px;
    margin-right:5px;
  }
  .app-search .search-result ul li h3{
    font-size:14px;
    margin-bottom:5px;
    color:#8f8f94;
  }
  .app-search .search-result .cap{
    display:flex;
    flex-wrap:wrap;
  }
  .app-search .search-result .my-btn{
    padding:10px;
    background-color:#fff;
  }
  .app-search .search-result .btn{
    width:100%;
    background-color:transparent;
    border:1px solid #888;
  }
  .app-search .no-result{
    margin-top:80px;
    display:flex;
    flex-direction:column;
    align-items:center;
  }
  .app-search .no-result img{
    width:35%;
    margin-bottom:10px;
  }
  .app-search .no-result p{
    font-size:18px;
  }
</style>
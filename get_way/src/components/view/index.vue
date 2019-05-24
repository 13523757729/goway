<template>
  <div class="app-index">
    <header>
      <div class="indexNav">
        <div class="logo"><img src="http://127.0.0.1:3000/img/index/logo.png"></div>
          <div class="userBefore" style="display:block;">
            <router-link to="/login" class="indexUser">
            <div class="contact"><span class="mui-icon mui-icon-contact"></span></div>
            <p class="my">登录</p>
          </router-link>
          </div>
          <div class="userAfter" style="display:none;">
          <router-link to="/user" class="indexUserName">
          <div class="user_pic"><img :src="photo | photoFliter" alt=""></div>
          <span>{{uname | unameFliter}}</span> 
          </router-link> 
          </div>
      </div>
    </header>
    <section>
      <mt-swipe>
        <mt-swipe-item v-for="img of list" :key="img.id">
          <img :src="img.img">
        </mt-swipe-item>
      </mt-swipe>
    </section> 
    <section class="search">
      <input type="search" placeholder="搜索目的地" class="searchInp" @click="searchShow">
    </section>
    <section class="indexGrid">
      <div class="mui-content">
		    <ul class="mui-table-view mui-grid-view mui-grid-9">
		       <li class="mui-table-view-cell mui-media mui-col-xs-3 mui-col-sm-3" v-for="item of list1" :key="item.id">
            <router-link :to="item.src">
            <img :src="item.img_url" alt="">
		        <div class="mui-media-body">{{item.title}}</div></router-link></li>
		    </ul> 
		  </div>
    </section>
    <section class="indexShop">
      <div class="index_shop_nav">
        <span>玩商城</span>
        <router-link to="">更多...</router-link>
      </div>
      <div class="index_shop_sec">
        <div class="shop_item shop_item01">
          <router-link to="">
            <h4>自由行</h4>
            <p>机+酒一次购</p>
          </router-link>
        </div>
        <div class="shop_item shop_item02">
          <router-link to="">
            <h4>特价机票</h4>
            <p>机+酒一次购</p>
          </router-link>
        </div>
        <div class="shop_item shop_item03">
          <router-link to="">
            <h4>签证</h4>
            <p>机+酒一次购</p>
          </router-link>
        </div>
        <div class="shop_item shop_item04">
          <router-link to="">
            <h4>城市玩乐</h4>
            <p>机+酒一次购</p>
          </router-link>
        </div>
      </div>
      <ul class="index_shop_list mui-row">
        <li class="mui-col-xs-4 mui-col-sm-4">
          <router-link to="">
            <img src="http://127.0.0.1:3000/img/index/list/mp.png"/>
            <span>门票/票券</span>
          </router-link>
        </li>
        <li class="mui-col-xs-4 mui-col-sm-4">
          <img src="http://127.0.0.1:3000/img/index/list/gt1.png"/>
          <span>日本高铁</span>
        </li>
        <li class="mui-col-xs-4 mui-col-sm-4">
          <img src="http://127.0.0.1:3000/img/index/list/WIFI.png"/>
          <span>WiFi/电话卡</span>
        </li>
        <li class="mui-col-xs-4 mui-col-sm-4">
          <img src="http://127.0.0.1:3000/img/index/list/lc.png"/>
          <span>欧洲列车</span>
        </li>
        <li class="mui-col-xs-4 mui-col-sm-4">
          <img src="http://127.0.0.1:3000/img/index/list/bx1.png"/>
          <span>意外之险</span>
        </li>
        <li class="mui-col-xs-4 mui-col-sm-4">
          <img src="http://127.0.0.1:3000/img/index/list/jsj1.png"/>
          <span>接送机/包机</span>
        </li>
      </ul>
    </section>
    <section class="index_new_update">
      <h3>精选折扣 每日上新</h3>
      <ul>
        <li v-for="item of list2" :key="item.id">
          <router-link :to="item.src">
            <img :src="item.pic">
            <h3>{{item.title}}</h3>
            <p>{{item.price}}<span>元起</span></p>
          </router-link>
        </li>
      </ul>
    </section>
    <section class="index_travels_card">
      <div class="mui-card">
				<div class="mui-card-header travels_title">
          <span>游记与话题</span>
          <router-link to="">更多...</router-link></div>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
            <ul class="mui-table-view">
              <li class="mui-table-view-cell mui-media" v-for="item of list3" :key="item.id">
                <router-link to="">
                  <img class="mui-media-object mui-pull-left" :src="item.pic">
                  <div class="mui-media-body">
                    <p class='mui-ellipsis'>{{item.title}}</p>
                    <img class="userPic" :src="item.user_pic">
                    <span class="userName">{{item.userName}}</span>
                    <span class="counts">
                      <img src="http://127.0.0.1:3000/img/index/pinglun.png" class="pinglun">
                      <span>{{item.praiseNum}}</span>
                    </span>
                  </div>
                </router-link>
              </li>
			      </ul>
					</div>
				</div>
				<div class="mui-card-footer">
          <mt-button @click="travelsList" size="large">加载更多</mt-button>
        </div>
			</div>
    </section>
  </div>
</template>
<script>
import mySh from "@/components/common/Sh.vue";
export default {
  data(){
    return{
      photo:"",
			uname:"",
      list:[],
      list1:[],
      list2:[],
      list3:[],
      flag:false,
      pno:0,
      pageSize:6,
      kw:""  //专门等着接文本框输入的关键词
    }
  },
  created(){
      this.getInfo();
      this.carouselImg();
      this.iconImg();
      this.newUpdate();
      this.travelsList();
  },
  methods: {
    getInfo(){
      var that=this;
      var url="http://127.0.0.1:3000/getInfo"
      that.axios.get(url).then(result=>{
        if((result.data.uname==undefined && result.data.photo==undefined) || (result.data.uname=="" && result.data.photo=="")){
          that.uname="";
          that.photo="";
          document.querySelector(".userBefore").style.display="block";
          document.querySelector(".userAfter").style.display="none";
        }else{
          that.uname=result.data.uname;
          that.photo=result.data.photo;
          document.querySelector(".userBefore").style.display="none";
          document.querySelector(".userAfter").style.display="block";
        }
      })
    },
    carouselImg(){
      var url="http://127.0.0.1:3000";
      url+="/getCarousel";
      this.axios.get(url).then(result=>{
        this.list=result.data.data;
        console.log(this.list);
      })
    },
    iconImg(){
      var url="http://127.0.0.1:3000";
      url+="/iconList";
      this.axios.get(url).then(result=>{
      this.list1=result.data.data;
      })
    },
    newUpdate(){
      var url="http://127.0.0.1:3000";
      url+="/indexNewList";
      this.axios.get(url).then(result=>{
        this.list2=result.data.data;
      })
    },
    travelsList(){
      this.pno++;
      var url="http://127.0.0.1:3000";
      url+="/travelsList?pno="+this.pno;
      this.axios.get(url).then(result=>{
        var rows=this.list3.concat(result.data.data);
        this.list3=rows;
      })
    },
     searchShow(){
       this.$router.push("/search")
     },
  },
  components:{
    mySh
  }
}
</script>
<style>
  .app-index{
    height:100vh; 
    text-align: center;
    box-sizing: border-box;
    position:relative;
  }
  ul{list-style: none;}
  header{
    width:100%;
    height:45px;
    background:#258a5c;
    box-sizing: border-box;
    padding:0 8px;
  }
  .app-index .indexNav{
    display: flex;
    flex-direction: row;
    justify-content:space-between;
    align-items: center;
  }
  .app-index header .logo{margin-top:9px;}
  .app-index p.my{
    color:#fff;
    font-size:16px;
    font-weight:600;
    font-family:黑体;
    margin-top:10px;
    margin-left:5px;
  }
  .app-index .mui-icon-contact{
    color:#258a5c;
    font-size:28px;
    text-align:center;
    line-height: 30px;
  }
  .contact{
    width:30px;
    height:30px;
    background-color:white;
    border-radius: 50%;
  }
  .app-index .indexUser,.app-index .indexUserName{
    display: flex;
    flex-direction: row;  /*元素按行排整*/
    justify-content: center;  /*水平居中*/
    align-items: center;    /*垂直居中*/
  }
  .app-index .indexUserName .user_pic, .app-index .indexUserName img{
    width:30px;
    height:30px;
    border-radius:50%;
    margin-right:5px;
  }
  .app-index .indexUserName span{
    color:#fff;
    font-size:16px;
  }
  .app-index .mint-swipe{
    height:160px;
  }
  .app-index .mint-swipe img{
    width:100%;
    height:160px;
  }
  .app-index .search{
    padding:10px;
    border-bottom:1px solid rgb(201, 200, 200);
  }
  .app-index .searchInp{
    height:40px;
    margin-bottom:0;
    font-size:15px;
    padding-left: 60px;
    text-align: left; 
    background:#fff url(http://127.0.0.1:3000/img/index/search1.png) no-repeat 3%;
    border:2px solid rgb(224, 224, 224);
  }
  .app-index .search .search_page{
    width:100%;
    height:100vh;
    z-index:99999;
    position:absolute;
    background:rgba(247, 254, 255, 0.8);
    top:0;
    left:0;
  }
  .app-index .search_contant{
    width:100%;
    height:100%;
  }
  .app-index .search_form{
    display: flex;
  }
  .app-index .back,.app-index .search_form input,.app-index .btn-search{
    height:45px;
    border-radius: 0;
    background:#fff;
  }
  .app-index .back{
    width:12%;
    border-bottom:1px solid #ddd;
  }
  .app-index .mui-icon-back{
    font-size:30px;
    text-align: center;
    line-height: 45px;
  }
  .app-index .search_form input{
    width:70%;
    font-size:18px;
    margin:0;
  }
  .app-index .search_form .btn-search{
    width:18%;
    background-color:#258a5c;
    color:#fff;
    text-align: center;
    line-height:45px;
  }
  .app-index .mui-content > .mui-table-view:first-child {
    margin-top:0;
  }
  .app-index .mui-grid-view.mui-grid-9 .mui-table-view-cell{
    padding:2px 8px;
  }
  .app-index .mui-grid-view.mui-grid-9 .mui-table-view-cell img{
    width:100%;
    border-radius: 5px;
  }
  .app-index .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body{
    margin-top:-23px;
    color:#fff;
  }
  .app-login .mui-content {background-color:transparent;}
  .app-index>.indexShop>.index_shop_nav,
  .app-index>.index_travels_card>.travels_title{
    height:50px;
    background-color:white;
    display: flex;
    justify-content:flex-end;
    padding:0 10px;
    border-bottom: 1px solid rgb(230, 230, 230);
  }
  .app-index>.indexShop>.index_shop_nav>span,
  .app-index .index_travels_card .travels_title>span{
    line-height: 50px;
    font-size:22px;
    color:rgb(153, 151, 151);
    font-family: "幼圆";
    margin-right:29%;
  }
  .index_shop_nav .router-link-active,
  .travels_title .router-link-active{
    margin-top:16px;
    font-size:14px;
    color:#0adf7f; 
  }
  .app-index>.indexShop>.index_shop_sec{
    display: flex;
    flex-wrap: wrap;
    background-color:white;
  }
  .app-index>.indexShop>.index_shop_sec div.shop_item01,
  .app-index>.indexShop>.index_shop_sec div.shop_item03{
    border-left:none;
  } 
  .app-index>.indexShop>.index_shop_sec .shop_item{
    width:50%;height:80px;
    border:1px solid rgb(230, 230, 230);
    border-right:none;
    border-top:none;
    background-repeat: no-repeat;
    background-position:100% 100%;
  }
  .app-index>.indexShop>.index_shop_sec .shop_item01{
    background-image:url(http://127.0.0.1:3000/img/index/zyx.png);
    background-size:42%;
  }
  .app-index>.indexShop>.index_shop_sec .shop_item02{
    background-image:url(http://127.0.0.1:3000/img/index/jp.png);
    background-size:35%;
  }
  .app-index>.indexShop>.index_shop_sec .shop_item03{
    background-image:url(http://127.0.0.1:3000/img/index/qz.png);
    background-size:35%;
  }
  .app-index>.indexShop>.index_shop_sec .shop_item04{
    background-image:url(http://127.0.0.1:3000/img/index/wl.png);
    background-size:40%;
  }
  .app-index>.indexShop>.index_shop_sec .shop_item .router-link-active{text-align: left;}
  .app-index>.indexShop>.index_shop_sec .shop_item .router-link-active h4{
    font-size:16px;
    font-weight: 400;
    padding:8px 0px 5px 10px;
    margin:0;
  }
  .app-index>.indexShop>.index_shop_sec .shop_item01 .router-link-active h4{color:#5cd7f4;}
  .app-index>.indexShop>.index_shop_sec .shop_item02 .router-link-active h4{color:#fe8375;}
  .app-index>.indexShop>.index_shop_sec .shop_item03 .router-link-active h4{color:#ffb846;}
  .app-index>.indexShop>.index_shop_sec .shop_item04 .router-link-active h4{color:#12e3b4;}
  .app-index>.indexShop>.index_shop_sec .shop_item .router-link-active p{
    color:#ced1d5;
    padding-left: 10px;
    margin:0;
  }
  .app-index .indexShop .index_shop_list{
    background-color:white;
    padding-left:0;
    margin:0;
  }
  .app-index ul.index_shop_list li:nth-child(3),
  .app-index ul.index_shop_list li:nth-child(6){border-right:0;}
  .app-index ul.index_shop_list li{
    height:40px;
    border:1px solid rgb(230, 230, 230);
    border-left:0;
    border-top:0;
  }
  .app-index ul.index_shop_list li img{
    width:20px;
    height:20px;
    vertical-align: middle;
    margin-right:5px;
  }
  .app-index ul.index_shop_list li span{
    color:#797979;
    font-size:14px;
    line-height: 40px;
  }
  .app-index .index_new_update{
    background-color:white;
    margin-top:15px;
    padding-top:15px;
  }
  .app-index .index_new_update h3{
    font-size:18px;
    color:#666;
  }
  .app-index .index_new_update ul{
    display: flex;
    flex-wrap: wrap;
    padding:0;
    padding-right:15px;
  }
  .app-index .index_new_update ul li{
    width:50%;
    padding-left:15px;
    padding-bottom:15px;
  }
  .app-index .index_new_update ul li img{
    width:100%;
  }
  .app-index .index_new_update ul li h3{
    height:40px;
    font-weight: 400;
    font-size:16px;
    overflow: hidden;
    line-height: 20px;
    text-align: left;
    color:#3e3e3e;
  }
  .app-index .index_new_update ul li p{
    font-size:16px;
    color:#f75757;
    text-align: left;
    margin:0;
  }
  .app-index .index_new_update ul li p span{
    font-size:10px;
    color:#888888;
  } 
  .app-index .index_travels_card .travels_title>span{
    margin-left:35%;
    margin-right:0;
    font-size:20px;
    font-family:"微软雅黑";
  }
  .app-index .index_travels_card .mui-card{
    margin:0;
  }
  .app-index .index_travels_card .mui-card-header{
    padding-top:0;
    padding-bottom:0;
  }
  .app-index .mui-card .mui-card-header:after,
  .app-index .mui-card .mui-card-footer:before,
  .app-index .mui-card-header:after,
  .app-index .mui-card-footer:before{height:0;}
  .app-index .mui-card .mui-card-content-inner{
    padding:0;
  }
  .app-index .mui-card .mui-card-content-inner .mui-table-view .mui-media-object{
    max-width: 120px;
    height:80px
  }
  .app-index .mui-media-body .mui-ellipsis{
    margin-bottom:25px;
    color:#474747;
    font-size:16px;
  }
  .app-index .mui-media-body .userPic{
    width:30px;
    height:30px;
    border-radius: 50%;
    float:left;
  }
  .app-index .mui-media-body .pinglun{
    width:16px;
    height:16px;
    margin-right:5px;
    margin-top:3px;
    
  }
  .app-index .mui-media-body .counts{
    float:right;
    display: flex;
    justify-content: space-around;
    margin-top:8px;
  }
  
  .app-index .mui-media-body .userName{
    float:left;
    color:gray;
    margin-top:8px;
    margin-left:5px;
  }
  .app-index .mint-button--default{
    background:transparent;
    border:1px solid #9b9b9b;
  }
</style>
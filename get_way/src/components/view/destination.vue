<template>
  <div class="app-destination">
    <header>
      <div class="des_nav">
        <img src="http://127.0.0.1:3000/img/index/logo.png">
        <input type="search" placeholder="搜索国家、美食、景点" @click="searchShow">
      </div>
    </header>
    <div class="search_page" v-if="flag">
      <div class="search_contant">
        <section class="search_sec">
          <div class="search_form">
          <div class="back" @click="searchHidden"><span class="mui-icon mui-icon-back"></span></div>
          <input v-focus type="text" v-model="kwords"  placeholder="搜索" >
          <div @click="search" class="btn-search" >搜索</div>
          </div>
        </section>
    </div>
  <input type="text" placeholder="">
    </div>
    <section class="des_hot">
      <div class="hot_nav">
        <h3>当季热门</h3>
        <p>还没有护照?</p>
      </div>
      <div class="hot">
        <div class="swiper-container swiper1">
          <div class="swiper-wrapper">
            <div class="swiper-slide" v-for="i of pageCount" :key="i.id" @click="loadPage(i)" :class="i==parseInt(pno)?'active':''">
              <span :class="i==parseInt(pno)?'cafter':'cbefore'">{{i}}月</span>
            </div>
          </div>
        </div>
      </div>
      <div class="hotImg">
        <div class="swiper-container swiper2">
          <div class="swiper-wrapper">
            <router-link v-for="item of list" :key="item.id" to="" :style="'background:url('+item.img_url+') no-repeat center center;background-size:cover'" class="swiper-slide">
              <span>{{item.title}}</span>
            </router-link>
          </div>
        </div>
      </div>
      <router-link class="forMore" to="/*">
        <div class="more">
          <img src="http://127.0.0.1:3000/img/destination/more.jpg" alt="">
          查看全部国家
          <span class="mui-icon mui-icon-forward"></span>
        </div>
      </router-link>
      <div class="hot_nav">
        <h3>免签目的地</h3>
        <p>免签是什么?</p>
      </div>
      <div class="visa-free">
        <div class="swiper-container swiper2">
          <div class="swiper-wrapper">
            <router-link v-for="item of list1" :key="item.id" to="" :style="'background:url('+item.pic_url+') no-repeat center center;background-size:cover'" class="swiper-slide">
              <span class="title">{{item.title}}</span>
              <span>{{item.eTitle}}</span>
            </router-link>
          </div>

        </div>
      </div>
      <div class="hot_nav">
        <h3>人气海岛</h3>
        <p>廉航预定指南</p>
      </div>
      <div class="island">
        <div class="swiper-container swiper2">
          <div class="swiper-wrapper">
            <router-link v-for="item of list2" :key="item.id" to="" :style="'background:url('+item.pic_url+') no-repeat center center;background-size:cover'" class="swiper-slide">
              <span class="title">{{item.title}}</span>
              <span>{{item.eTitle}}</span>
            </router-link>
          </div>
        </div>
      </div>
      <div class="hot_nav">
        <h3>主题推荐</h3>
      </div>
      <div class="theme">
        <div class="swiper-container swiper1">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <span class="cbefore" @click="cur=0" :class="{cafter:cur==0}">俯瞰城市</span>
            </div>
            <div class="swiper-slide">
            <span class="cbefore" @click="cur=1" :class="{cafter:cur==1}">怀旧时光</span>
            </div>
            <div class="swiper-slide">
              <span class="cbefore" @click="cur=2" :class="{cafter:cur==2}">魅力夜色</span>
            </div>
            <div class="swiper-slide">
              <span class="cbefore" @click="cur=3" :class="{cafter:cur==3}">神秘遗址</span>
            </div>
            <div class="swiper-slide">
              <span class="cbefore" @click="cur=4" :class="{cafter:cur==4}">最爱小镇</span>
            </div>
          </div>
        </div>
      </div>
      <div class="theme_list" v-show="cur==0">
        <div class="theme_item" v-for="item of theme1" :key="item.id">
          <router-link to="" :style="'background:url('+item.img_url+') no-repeat center center;background-size:cover'" ></router-link>
          <span>{{item.title}}</span>
        </div>
      </div>
      <div class="theme_list" v-show="cur==1">
        <div class="theme_item" v-for="item of theme2" :key="item.id">
          <router-link to="" :style="'background:url('+item.img_url+') no-repeat center center;background-size:cover'" ></router-link>
          <span>{{item.title}}</span>
        </div>
      </div>
      <div class="theme_list" v-show="cur==2">
        <div class="theme_item" v-for="item of theme3" :key="item.id">
          <router-link to="" :style="'background:url('+item.img_url+') no-repeat center center;background-size:cover'" ></router-link>
          <span>{{item.title}}</span>
        </div>
      </div>
      <div class="theme_list" v-show="cur==3">
        <div class="theme_item" v-for="item of theme4" :key="item.id">
          <router-link to="" :style="'background:url('+item.img_url+') no-repeat center center;background-size:cover'" ></router-link>
          <span>{{item.title}}</span>
        </div>
      </div>
      <div class="theme_list" v-show="cur==4">
        <div class="theme_item" v-for="item of theme5" :key="item.id">
          <router-link to="" :style="'background:url('+item.img_url+') no-repeat center center;background-size:cover'" ></router-link>
          <span>{{item.title}}</span>
        </div>
      </div>
    </section>
  </div>
</template>
<script>
export default {
  data(){
    return{
      flag:false,
      kwords:"",
      list:[],
      pno:1,
      pageCount:0,
      pagesize:5,
      count:0,
      list1:[],
      list2:[],
      theme1:[],
      theme2:[],
      theme3:[],
      theme4:[],
      theme5:[],
      cur:0,
    }
  },
  created(){
    this.visaFree();
    this.load();
    this.loadPage();
    this.getTheme();
  },
  methods: {
    getTheme(){
      var url="http://127.0.0.1:3000/getTheme";
      // console.log(url);
      this.axios.get(url).then(result=>{
        // console.log(result.data.data);
        this.theme1=result.data.data.slice(0,6);
        this.theme2=result.data.data.slice(6,12);
        this.theme3=result.data.data.slice(12,18);
        this.theme4=result.data.data.slice(18,24);
        this.theme5=result.data.data.slice(24,30);
      })
    },
    visaFree(){
      this.list1=[
        {id:1,pic_url:"http://127.0.0.1:3000/img/destination/Jeju.jpg",title:"济州岛",eTitle:"Jeju"},
        {id:2,pic_url:"http://127.0.0.1:3000/img/destination/Kenting.jpg",title:"垦丁",eTitle:"Kenting"},
        {id:3,pic_url:"http://127.0.0.1:3000/img/destination/Ukraine.jpg",title:"乌克兰",eTitle:"Ukraine"},
        {id:4,pic_url:"http://127.0.0.1:3000/img/destination/Vietnam.jpg",title:"越南",eTitle:"Vietnam"},
        {id:5,pic_url:"http://127.0.0.1:3000/img/destination/Cambodia.jpg",title:"柬埔寨",eTitle:"Cambodia"},
        {id:6,pic_url:"http://127.0.0.1:3000/img/destination/Saipan.jpg",title:"塞班岛",eTitle:"Saipan"},
        {id:7,pic_url:"http://127.0.0.1:3000/img/destination/India.jpg",title:"印度",eTitle:"India"},
      ];
      this.list2=[
        {id:1,pic_url:"http://127.0.0.1:3000/img/destination/Mauritius.jpg",title:"毛里求斯",eTitle:"Mauritius"},
        {id:2,pic_url:"http://127.0.0.1:3000/img/destination/JeepIsland.jpg",title:"吉普岛",eTitle:"Jeep island"},
        {id:3,pic_url:"http://127.0.0.1:3000/img/destination/SaintLucia.jpg",title:"圣卢西亚",eTitle:"Saint Lucia"},
        {id:4,pic_url:"http://127.0.0.1:3000/img/destination/Palawan.jpg",title:"巴拉望群岛",eTitle:"Palawan"},
        {id:5,pic_url:"http://127.0.0.1:3000/img/destination/Maldives.jpg",title:"马尔代夫",eTitle:"Maldives"},
        {id:6,pic_url:"http://127.0.0.1:3000/img/destination/Bora.jpg",title:"博拉岛",eTitle:"Bora"},
        {id:7,pic_url:"http://127.0.0.1:3000/img/destination/Santorini.jpg",title:"圣托里尼岛",eTitle:"Santorini"},
      ];
    },
    load(){
      var url="http://127.0.0.1:3000/hotList";
      this.axios.get(url,{params:{pno:this.pno}}).then(result=>{
        this.pno=result.data.pno;
        this.list=result.data.data;
        this.pageCount=result.data.pageCount; 
      })
    },
    loadPage(i){
      this.pno=i;  
      this.load();
    },
    searchShow(){
      this.flag=true;
    },
    searchHidden(){
      this.flag=false;
    },
    search(){
      // console.log(this.kwords);
    },
  },
  mounted() {
    var swiprer1=new Swiper('.swiper1',{
      slidesPerView:'auto',
      direction:"horizontal",//横向切换
      observer:true,//开启动态检查器
      loop:false,//环路
      loopedSlides: 5,
      spaceBetween:10,//在slide之间设置距离单位px
      slidesOffsetBefore:15,//设定slide与左边框的预设偏移量
      slidesOffsetAfter:15,//设定slide与右边框的预设偏移量
    });
    var swiprer2=new Swiper('.swiper2',{
      slidesPerView:'auto',
      direction:"horizontal",//横向切换
      // centeredSlides:left,
      observer:true,//开启动态检查器
      loop:false,//环路
      spaceBetween:10,//在slide之间设置距离单位px
      slidesOffsetBefore:15,//设定slide与左边框的预设偏移量
      slidesOffsetAfter:15,//设定slide与右边框的预设偏移量
    })
  },
  watch:{
    kwords(){
      this.search();
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
  .app-destination header{
    height:45px;
    background-color:white;
    padding:0 15px;
  }
  .app-destination header .des_nav img{
    float:left;
    margin-top:10px;
    margin-right:10px;
  }
  .app-destination header .des_nav input{
    float:left;
    width:80%;
    margin-bottom:0;
    margin-top:6px;
    background-color:rgba(226,223,223,0.4);
    border-radius:20px;
    font-size:14px;
    text-align: left;
  }
  .app-destination .search_page{
    width:100%;
    height:100vh;
    z-index:99999;
    position:absolute;
    background:rgba(247, 254, 255, 0.8);
    top:0;
    left:0;
  }
   .app-destination .search_contant{
    width:100%;
    height:100%;
  }
  .app-destination .search_form{
    display: flex;
  }
  .app-destination .back,.app-index .search_form input,.app-index .btn-search{
    height:45px;
    border-radius: 0;
    background:#fff;
  }
  .app-destination .back{
    width:12%;
    border-bottom:1px solid #ddd;
  }
  .app-destination .mui-icon-back{
    font-size:30px;
    text-align: center;
    line-height: 45px;
  }
  .app-destination .search_form input{
    width:70%;
    height:45px;
    font-size:18px;
    margin:0;
    border-radius:0;
  }
  .app-destination .btn-search{
    width:18%;
    background:#258a5c;
    color:#fff;
    text-align: center;
    line-height:45px;
  }
  .app-destination .des_hot .hot_nav{
    display:flex;
    flex-direction: row;  /*元素按行排整*/
    justify-content: space-between;  /*水平居中*/
    align-items: center;    /*垂直居中*/
    padding:0 15px;
    margin-top:20px;
  }
  .app-destination .des_hot h3{
    font-size:20px;
    margin:0;
  }
  .app-destination .des_hot p{
    color:#0adf7f;
    margin-bottom:0;
  }
  .app-destination .hot{
    width:100%;
    margin-top:20px;
    overflow: hidden;
    white-space:nowrap;
  }
  .app-destination .hot .swiper-wrapper .swiper-slide{
    width:65px;
  }
  .app-destination .hot .swiper-wrapper .swiper-slide span,
  .app-destination .theme .swiper1 .swiper-slide span{
    display:block;
    width:65px;
    height:35px;
    border-radius:4px;
    text-align: center;
    line-height: 35px;
    font-size:14px;
  }
  .app-destination .swiper1 .swiper-wrapper .swiper-slide .cbefore{
    background-color: white;
    border:1px solid #d9d9d9;
  }
  .app-destination .swiper1 .swiper-wrapper .swiper-slide .cafter{
    background-color:#0adf7f;
    color:#fff;
  }
  .app-destination .hotImg{
    margin-top:5px;
    padding:10px 00;
  }
  .app-destination .swiper2 .swiper-wrapper{
    height:180px;
    position:relative;
  }
  .app-destination .hotImg a{
    display:block;
    width:160px;
    height:160px;
    border-radius:5px;
    box-shadow: 2px 9px 15px #acacac;
  }
  .app-destination .hotImg a span{
    color:#fff;
    font-size:20px;
    position:absolute;
    bottom:15px;
    left:10px;
  }
  .app-destination .more img{
    width:40px;
    height:40px;
    border-radius:50%;
    margin-right:10px;
  }
  .app-destination .forMore{
    display: block;
    padding:15px;
  }
  .app-destination .more{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    background-color:#fff;
    height:60px;
    align-items: center;
    padding:15px;
    border-radius:4px;
    font-size:18px;
    color:#000;
    margin:0;
    box-shadow: 2px 5px 15px #c1c1c1;
  }
  .app-destination .visa-free,.app-destination .island{
    margin-top:20px;
  }
  .app-destination .visa-free a,.app-destination .island a{
    display:block;
    width:150px;
    height:120px;
    border-radius:4px;
    box-shadow: 2px 9px 15px #acacac;
  }
  .app-destination .visa-free span,.app-destination .island span{
    display: block;
    color:#fff;
    font-size:20px;
    text-align: center;
  }
  .app-destination .visa-free .title,.app-destination .island .title{
    margin-top:30%;
  }
  .app-destination .theme{margin-top:20px;}
  .app-destination .theme .swiper1 .swiper-slide,
  .app-destination .theme .swiper1 .swiper-slide span{width:85px;}
  .app-destination .theme_list{
    margin-top:20px; 
    padding:0 15px;
    padding-bottom:30px;
    display: flex;
    flex-wrap: wrap;
    flex-direction:row;  /*元素按行排整*/
    justify-content: space-between;  /*水平居中*/
    align-items: center;    /*垂直居中*/
  }
  .app-destination .theme_list .theme_item{
    display: flex;
    flex-direction: column;  /*元素按行排整*/
    justify-content: space-between;  /*水平居中*/
    align-items: center;    /*垂直居中*/
    margin-bottom:15px;
  }
  .app-destination .theme_list .theme_item a{
    display:block;
    width:110px;
    height:110px;
    border-radius:4px;
    margin-bottom:5px;
    box-shadow: 2px 3px 15px #acacac;
  }
  .app-destination .theme_list .theme_item span{
    font-size:14px;
  }
</style>
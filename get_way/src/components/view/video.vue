<template>
  <div class="app-video">
    <header>
      <div><img src="http://127.0.0.1:3000/img/index/logo.png" alt=""></div>
      <router-link to="/index">返回首页</router-link>
    </header>
    <div class="video-nav">
      <p>旅游精选视频</p>
    </div>
    <section class="video-hot">
      <mt-swipe>
        <mt-swipe-item v-for="item of list" :key="item.id">
          <img :src="item.img"/>
        </mt-swipe-item>
      </mt-swipe>
      <section class="hot-sift">
        <h3>热门精选</h3>
        <div class="hotImg">
          <div class="swiper-container swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide" v-for="item of list1" :key="item.id">
                <div class="videoList">
                  <router-link to="">
                    <img :src="item.img_url">
                  </router-link>
                  <span>{{item.title}}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <h2>美食</h2>
      <section class="video-content">
        <router-link to="" class="more">
          <img src="http://127.0.0.1:3000/img/video/food_icon.jpg" alt="">
          <div>
            <span class="food">【美食篇】</span><br>
            <span>打开美食次元的新世界</span>
          </div>
          <span class="all">全部&gt;&gt;</span>
        </router-link>
        <div class="content-list">
          <ul>
            <li v-for="item of food" :key="item.id">
              <router-link :to="`/videoList/${item.id}`">
                <img :src="item.video_img" alt="">
                <span class="vtime">{{item.video_len}}</span>
                <span>{{item.video_title}}</span>
              </router-link>
            </li>
          </ul>
        </div>
      </section>
      <h2>攻略</h2>
      <section class="video-content">
        <router-link to="" class="more">
          <img src="http://127.0.0.1:3000/img/video/bag_icon.jpg" alt="">
          <div>
            <span class="food">生活旅行</span><br>
            <span>拥抱世界上的千百种生活</span>
          </div>
          <span class="all">全部&gt;&gt;</span>
        </router-link>
        <div class="content-list">
          <ul>
            <li v-for="item of travel" :key="item.id">
              <router-link :to="`/videoList/${item.id}`">
                <img :src="item.video_img" alt="">
                <span class="vtime">{{item.video_len}}</span>
                <span>{{item.video_title}}</span>
              </router-link>
            </li>
          </ul>
        </div>
      </section>
      <section class="video-content">
        <router-link to="" class="more">
          <img src="http://127.0.0.1:3000/img/video/travel_icon.jpg" alt="">
          <div>
            <span class="food">走遍全世界</span><br>
            <span>陪你来一场不俗气的旅行</span>
          </div>
          <span class="all">全部&gt;&gt;</span>
        </router-link>
        <div class="content-list">
          <ul>
            <li v-for="item of world" :key="item.id">
              <router-link :to="`/videoList/${item.id}`">
                <img :src="item.video_img" alt="">
                <span class="vtime">{{item.video_len}}</span>
                <span>{{item.video_title}}</span>
              </router-link>
            </li>
          </ul>
        </div>
      </section>
      <section class="video-content">
        <router-link to="" class="more">
          <img src="http://127.0.0.1:3000/img/video/encounter_icon.jpg" alt="">
          <div>
            <span class="food">奇遇</span><br>
            <span>探索城市，遇见最美好的事</span>
          </div>
          <span class="all">全部&gt;&gt;</span>
        </router-link>
        <div class="content-list">
          <ul>
            <li v-for="item of qiyu" :key="item.id">
              <router-link :to="`/videoList/${item.id}`">
                <img :src="item.video_img" alt="">
                <span class="vtime">{{item.video_len}}</span>
                <span>{{item.video_title}}</span>
              </router-link>
            </li>
          </ul>
        </div>
      </section>
    </section>
  </div>
</template>
<script>
export default {
  data(){
    return{
      cul:"美食",
      list:[],
      list1:[],
      food:[],
      travel:[],
      world:[],
      qiyu:[],
    }
  },
  created() {
    this.carouselImg();
    this.theArr();
    this.getvideoList();
  },
  methods: {
    getvideoList(){
      var url="http://127.0.0.1:3000/videoList";
      this.axios.get(url).then(result=>{
        this.food=result.data.food;
        this.travel=result.data.travel;
        this.world=result.data.world;
        this.qiyu=result.data.qiyu;
      })
    },
    theArr(){
      this.list1=[
        {id:1,img_url:"http://127.0.0.1:3000/img/video/video_pic1.jpg",title:"青春不散场，长期一起嗨"},
        {id:2,img_url:"http://127.0.0.1:3000/img/video/video_pic1.jpg",title:"青春不散场，长期一起嗨"},
        {id:3,img_url:"http://127.0.0.1:3000/img/video/video_pic1.jpg",title:"青春不散场，长期一起嗨"},
        ];
    },
    // getvideoList
    carouselImg(){
      var url="http://127.0.0.1:3000";
      url+="/videoCarousel";
      this.axios.get(url).then(result=>{
        this.list=result.data.data;
      })
    }
  },
  mounted() {
    this.getvideoList()
    var swiprer=new Swiper('.swiper',{
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
}
</script>
<style>
  .app-video header{
    box-shadow: 0px 0px 15px #cfcfcf;
    background-color: #fff;
    position:relative;
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    align-items: center;
  }
  .app-video header img{
    margin-top:8px;
  }
  .app-video header a{
    display: block;
    width:80px;
    height:35px;
    text-align: center;
    line-height: 35px;
    border-radius: 40px;
    background: linear-gradient(to right,#00c9ffab, #0000ff9c); /* 从左到右 */
    color:#fff;
  }
  .video-nav{
    display:flex;
    justify-content: space-between;
    padding:20px 15px;
    background-color: #fff;
  }
  .app-video a,
  .app-video .video-content .all{
    color:#0adf7f; 
    font-size:14px;
  }
  .app-video p{
    font-size:18px;
    color:#000;
    margin:0;
  }
   .app-video .mint-swipe{
    height:200px;
  }
  .app-video .mint-swipe img{
    width:100%;
    height:200px;
  }
  .app-video .mint-swipe .mint-swipe-indicator{
    width:18px;
    height:3px;
    background:rgba(33,45,67,0.3);
    border-radius:0;
    opacity:1;
  }
  .app-video .mint-swipe .mint-swipe-indicator.is-active{
    background-color:#fff;
  }
  .app-video .hot-sift{background-color: #fff;padding-bottom:10px;margin-bottom:20px;}
  .app-video .hot-sift h3{
    font-size:16px;
    padding:30px 15px 20px 15px;
    margin:0;
  }
  .app-video .swiper .swiper-wrapper{
    width:150px;
    height:140px;
    position:relative;
  }
  .app-video .swiper .videoList{
    width:150px;
    height:140px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .app-video .swiper .videoList img{
    width:150px;
    height:90px;
    border-radius:5px;
  }
  .app-video .swiper .videoList span,
  .app-video .video-content ul li a span,
  .app-video .video-content .more div span{
    width:150px;
    font-size:14px;
  }
  .app-video .swiper .videoList span,
  .app-video .video-content ul li a span{
    overflow: hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
  }
  .app-video h2{
    font-size:20px;
    padding:10px 15px 10px 15px;;
  }
  .app-video .video-content{
    padding:0 15px;
  }
  .app-video .video-content span{
    font-size:16px;
    font-weight:500;
    color:#666;
  }
  .app-video .video-content .food{
    color:#333;
    font-weight: 700;
  }
  .app-video .video-content .more img{
    width:60px;
    height:60px;
    border-radius:50%;
    /* border:1px solid black; */
    margin-right:10px;
  }
  .app-video .video-content .more{
    display:flex;
    flex-direction: row;
    align-items: center;
    margin-top:20px;
  }
  .app-video .video-content .more div,
  .app-video .video-content .more div span{
    width:230px;
    font-size:16px;
  }
  .app-video .video-content ul{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    padding:0;
    padding-top:20px;
    margin:0;
    margin-bottom:30px;
  }
  .app-video .video-content ul li:nth-child(2n-1){
    padding-right:8px;
  }
  .app-video .video-content ul li:nth-child(2n){
    padding-left:8px;
  }
  .app-video .video-content ul li{
    width:50%;
    margin-bottom:10px;
  }
  .app-video .video-content ul li a{
    display:flex;
    flex-direction:column; 
    align-items: center;
    position:relative;
  }
  .app-video .video-content ul li img{
    width:165px;
    height:100px;
    border-radius:5px;
    margin-bottom:10px;
  }
  .app-video .video-content ul li .vtime,
  .app-video .video-content ul li .vtimes{
    width:45px;
    position: absolute;
    bottom:32px;
    right:0px;
    color:#fff;
  }
  .app-video .video-content ul li .vtimes{
    bottom:10px;
  }
</style>
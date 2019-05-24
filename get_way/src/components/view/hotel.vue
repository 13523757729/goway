<template>
  <div class="app-hotel">
    <header>
      <router-link to="/index" class="back"><span class="mui-icon mui-icon-back"></span></router-link>
      <div><img src="http://127.0.0.1:3000/img/index/logo.png" alt=""></div>
    </header>
    <section class="hotel">
      <h3>全球酒店任你搜</h3>
      <p>目的地、住址、具体地址...</p>
      <input type="text" placeholder="输入你要去的地方">
      <div class="date">
      <input type="date" class="date1">
      <input type="date" class="date2">
      </div>
      <div class="personcount">
        <div class="man">
          <span>成人</span>
        <select name="" id="">
          <option value="">0</option>
          <option value="">1</option>
          <option value="">2</option>
          <option value="">3</option>
          <option value="">4</option>
          <option value="">5</option>
        </select>
        </div>
        <div class="chirldren">
          <span>儿童</span>
          <select name="" id="">
            <option value="">0</option>
            <option value="">1</option>
            <option value="">2</option>
            <option value="">3</option>
            <option value="">4</option>
            <option value="">5</option>
          </select>
        </div>
        <div class="room">
          <span>客房</span>
          <select name="" id="">
          <option value="">0</option>
          <option value="">1</option>
          <option value="">2</option>
          <option value="">3</option>
          <option value="">4</option>
          <option value="">5</option>
          </select> 
        </div>
      </div>
      <div class="trip ">
        <span class="triptitle">出行类别：</span>
        <span class="hidden" v-if="flag">如选择出差，我们会在筛选条件侧边栏置顶最热门的商旅服务设施，方便快速勾选。</span>
        <div class="chack">
          <div class="evection" @click="change">
          <input class="radiobtn" type="radio" name="trip" value="出差" :checked="check">
          出差
        </div>
        <div class="freetravel" @click="change1">
          <input class="radiobtn" type="radio" name="trip" value="自由行" :checked="check1">
          <span>自由行</span>
        </div>
        </div>
      </div>
      <div class="searbtn"><button>搜索</button></div>
    </section>
    <router-link class="advertising" to="/*">
      <img src="http://127.0.0.1:3000/img/hotel/advertising.jpg" alt="">
    </router-link>
    <div class="now">
      <div><img src="http://127.0.0.1:3000/img/hotel/right.png" alt=""></div>
      <div>
        <h4>现在预订，稍后付款！</h4>
        <p>大多数客房支持免费取消</p>
      </div>
    </div>
    <div class="now">
      <div><img src="http://127.0.0.1:3000/img/hotel/right.png" alt=""></div>
      <div>
        <h4>229个国家 2,364,119家住宿</h4>
        <p>酒店、公寓、特色旅馆、青年旅舍...</p>
      </div>
    </div>
    <section class="more">
      <p>更多目的地</p>
      <div class="swiper-container swiper1">
        <div class="swiper-wrapper">
          <div class="swiper-slide" v-for="item of list" :key="item.id">
            <router-link to="/*">
              <img :src="item.img_url" alt="">
              <h3>{{item.cityName}}</h3>
              <p>{{item.count}}</p>
            </router-link>
          </div>
          <div class="swiper-slide">
            <router-link class="gomore" to="/*">
              <span>更多目的地</span>
            </router-link>
          </div>
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
      check:false,
      check1:false,
      list:[],
    }
  },
  created() {
    this.arr();
  },
  methods: {
    arr(){
      this.list=[
        {id:1,img_url:"http://127.0.0.1:3000/img/hotel/Seoul.jpg",cityName:"首尔",count:"234,5家住宿"},
        {id:2,img_url:"http://127.0.0.1:3000/img/hotel/Enshi.jpg",cityName:"恩施",count:"23家住宿"},
        {id:3,img_url:"http://127.0.0.1:3000/img/hotel/SingPass.jpg",cityName:"新密",count:"5家住宿"},
        {id:4,img_url:"http://127.0.0.1:3000/img/hotel/zhengzhou.jpg",cityName:"郑州",count:"113,5家住宿"},
        {id:5,img_url:"http://127.0.0.1:3000/img/hotel/Sanya.jpg",cityName:"三亚",count:"264,5家住宿"},
        {id:6,img_url:"http://127.0.0.1:3000/img/hotel/daocheng.jpg",cityName:"稻城",count:"155家住宿"},
        {id:7,img_url:"http://127.0.0.1:3000/img/hotel/luoyang.jpg",cityName:"洛阳",count:"998家住宿"},
        {id:8,img_url:"http://127.0.0.1:3000/img/hotel/kaifeng.jpg",cityName:"开封",count:"665家住宿"},
      ];
    },
    change(){
      this.flag=true;
      this.check=true;
      this.check1=false;
    },
    change1(){
      this.flag=false;
      this.check1=true;
      this.check=false;
    }
  },
  mounted() {
    var swiper=new Swiper(".swiper1",{
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
  .app-hotel header{
    width: 100%;
    height:50px;
    display:flex;
    flex-direction: row;
    align-items: center;
  }
  .app-hotel header .back{
    width: 10%;
    height:50px;
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  .app-hotel header .back .mui-icon-back{
    color:#fff;
    font-size:40px;
    /* line-height: 50px; */
  }
  .app-hotel header div{
    width: 90%;
    height:50px;
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-left: -20px;
    align-items: center;
  }
  .app-hotel header div img{
    width: 51px;
    height: 32px;
  }
  /*==========主体内容===================*/
  .app-hotel .hotel{
    background-color:#fff;
    padding: 10px;
  }
  .app-hotel .hotel h3{
    padding-top:15px;
  }
  .app-hotel .hotel .date,.app-hotel .hotel .personcount,
  .app-hotel .hotel .chack{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }
  .app-hotel .hotel .date1,.app-hotel .hotel .date2{
    width:49%;
    height:40px;
  }
  .app-hotel .hotel .personcount div{
    width:32%;
    border:1px solid rgba(0,0,0,0.2) !important;
    height:55px;
    border-radius:3px;
    padding:5px;
  }
  .app-hotel .hotel .personcount div select{
    margin:0;
    height:25px;
    padding:5px;
  }
  .app-hotel .hotel .personcount div span{
    font-size:14px;
    padding:5px;
  }
  .app-hotel .hotel .trip{
    margin-top:15px; 
    border:1px solid rgba(0,0,0,0.2);
    border-radius:3px;
  }
  .app-hotel .hotel .trip .triptitle,
  .app-hotel .hotel .trip .hidden{
    display:block;
    font-size:14px;
    padding:5px;
  }
  .app-hotel .hotel .trip .triptitle{
    background:#edebeb;
  }
  .app-hotel .hotel .trip .hidden{
    background:#e5e4e4;
  }
  .app-hotel .hotel .chack .evection,
  .app-hotel .hotel .chack .freetravel{
    width:50%;
    /* border:1px solid black; */
    height:40px;
    line-height: 40px;
    padding:0 10px;
    display:flex;
    align-items: center;
  }
  .app-hotel .hotel .chack .evection{
    border-right:1px solid #ccc;
  }
  .app-hotel .hotel .chack input[type="radio"]{
    margin-right:5px;
    /* font-size:24px; */
    display:inline-block;
    width:20px;
    height:20px;
  }
  .app-hotel .hotel .searbtn{
    /* margin-top:15px;
    margin-right:0; */
    width:100%;
    padding: 20px;
  }
  .app-hotel .hotel .searbtn button{
    width:100%;
    height:50px;
    font-size:24px;
    border-radius:5px;
    text-align: center;
  }
  .app-hotel .advertising{
    width:100%;
    /* margin-top:10px; */
    display:block;
    padding:10px;
  }
  .app-hotel .advertising img{
    width:100%;
    height:150px;
  }
  .app-hotel .now{
    background-color:#fff;
    display:flex;
    flex-direction: row;
    padding:20px;
    align-items: center;
    border-bottom: 1px solid #e7e4e4;
  }
  .app-hotel .now div:last-child{
    margin-left: 10px;
  }
  .app-hotel .now h4{
    font-size:16px;
    padding:5px;
    margin:0;
  }
  .app-hotel .now p{
    font-size:14px;
    padding:5px;
    margin:0;
  }
  .app-hotel .more{
    background:#fff;
  }
  .app-hotel .more p{
    font-size:18px;
    padding:15px;
    color:#454545;
  }
  .app-hotel .more .swiper-wrapper{
    height:180px;
  }
  .app-hotel .more .swiper-slide,
  .app-hotel .more .swiper-slide .gomore{
    width:150px;
    height:120px;
  }
  .app-hotel .more .swiper-slide a h3{
    font-size:15px;
    color:#373737;
    margin-bottom:0;
  }
  .app-hotel .more .swiper-slide a p{
    font-size:13px;
    padding:0;
  }
  .app-hotel .more .swiper-slide img{
    width:100%;
    height:120px;
  }
  .app-hotel .more .swiper-slide .gomore{
    display:block;
    border:1px solid #007aff;
    text-align: center;
    line-height: 120px;
  }
</style>
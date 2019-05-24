<template>
  <div class="app-together">
    <header>
      <div><img src="http://127.0.0.1:3000/img/index/logo.png" alt=""></div>
      <router-link to="/index">返回首页</router-link>
    </header>
    <div class="title_nav">
      <h3>结伴同游</h3>
      <span>共34566篇帖子</span>
    </div>
    <mt-swipe>
      <mt-swipe-item v-for="item of swipers" :key="item.id">
        <img class="swiperImg" :src="item.img_url">
      </mt-swipe-item>
    </mt-swipe>
    <section class="togethersec">
      <ul>
        <li v-for="item of list" :key="item.id">
          <router-link to="/*">
            <img :src="item.img_url" alt="">
           <span class="usertitle">{{item.title}}</span>
           <div class="user">
             <div class="userp"><img class="userphoto" :src="item.userPic" alt=""></div>
             <div class="userl"><img class="watch" src="http://127.0.0.1:3000/img/getway/watch.png" alt=""><span>{{item.lookcount}}</span></div>
             <div class="userc"><img class="comment" src="http://127.0.0.1:3000/img/getway/comment.png" alt=""><span>{{item.commentcount}}</span></div>
           </div>
          </router-link>
        </li>
      </ul>
      <div @click="gettogether" class="btn">加载更多</div>
    </section>
  </div>
</template>
<script>
export default {
  data(){
    return{
      swipers:[],
      pno:1,
      list:[],
      hasMore:true,
    }
  },
  created() {
    this.arr();
    this.gettogether();
  },
  methods: {
    arr(){
      this.swipers=[
        {id:1,img_url:"http://127.0.0.1:3000/img/getway/swiper.jpg"},
        {id:2,img_url:"http://127.0.0.1:3000/img/getway/swiper.jpg"},
        {id:3,img_url:"http://127.0.0.1:3000/img/getway/swiper.jpg"},
        {id:4,img_url:"http://127.0.0.1:3000/img/getway/swiper.jpg"},
      ];
    },
    gettogether(){
      // if(this.hasMore==false){
      //   this.$toast("已经到底了...");
      //   return;
      // }
      this.pno++;
      var url="http://127.0.0.1:3000/gettogether?pno="+this.pno;
      this.axios.get(url).then(result=>{
        var rows=this.list.concat(result.data.data);
        this.list=rows;
        // console.log(this.pno);
        // console.log(result.data.pageCount);
        // if(this.pno>=result.data.pageCount){
        //   this.hasMore=false;
        // }
      })
    }
  },
}
</script>
<style>
  .app-together header{
    box-shadow: 0px 0px 15px #cfcfcf;
    background-color: #fff;
    position:relative;
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    align-items: center;
  }
  .app-together header img{
    margin-top:8px;
  }
  .app-together header a{
    display: block;
    width:80px;
    height:35px;
    text-align: center;
    line-height: 35px;
    border-radius: 40px;
    background: linear-gradient(to right,#00c9ffab, #0000ff9c); /* 从左到右 */
    color:#fff;
  }
  .app-together .title_nav{
    display:flex;
    justify-content: space-between;
    align-items: center;
    padding:15px;
    background-color: #fff;
  }
  .app-together .title_nav h3{
    font-size:20px;
  }
  .app-together .mint-swipe{
    height:230px;
    padding:15px;
    background:#fff;
  }
  .app-together .swiperImg{
    width:100%;
    border-radius:10px;
  }
  .app-together .mint-swipe-indicators{
    bottom:18px;
  }
  .app-together .togethersec{
    background-color: #fff;
  }
  .app-together .togethersec ul{
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    padding:0;
    padding:10px 15px;
    margin:0;
  }
  .app-together .togethersec ul li{
    width:50%;
  }
  .app-together .togethersec ul li:nth-child(odd){
    padding-right:5px;
  }
  .app-together .togethersec ul li:nth-child(even){
    padding-left:5px;
  }
  .app-together .togethersec ul li img{
    width:100%;
  }
  .app-together .togethersec ul li .usertitle{
    display: block;
    color:#1f1f1f;
    font-size:16px;
    width:100%;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }
  .app-together ul li div.user .userphoto{
    width:25px;
    height:25px;
    border-radius:50%;
  }
  .app-together ul li .userp{
    width:50%;
  }
  .app-together ul li .userl{
    width:25%;
  }
  .app-together ul li .userc{
    width:25%;
  }
  .app-together ul li div.user .watch,.app-together ul li div.user .comment{
    width:18px;
    height:18px;
  }
  .app-together ul li div.user  span{
    font-size:12px;
    color:#383838;
  }
  .app-together ul li div.user{
    margin-top:8px;
  }
  .app-together ul li div.user,
  .app-together ul li .userl,
  .app-together ul li .userc{
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  .app-together .btn{
    text-align: center;
    font-size:14px;
    padding:10px;
  }
</style>
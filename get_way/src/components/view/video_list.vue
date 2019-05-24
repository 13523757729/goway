<template>
  <div class="app-videoList">
    <header>
      <div><img src="http://127.0.0.1:3000/img/index/logo.png" alt=""></div>
      <router-link to="/index">返回首页</router-link>
    </header>
    <div class="video-nav">
      <p>旅游精选视频</p>
    </div>
    <video class="mp4" controls :src="list1.video" id="v3"></video>
    <section class="video_bg" :style="'background-image:url('+list1.video_bg+');background-repeat:no-repeat; background-size:100% 100%;'">
      <h3>{{title.video_title}}</h3>
      <p class="liCon" style="height:40px;">&nbsp;&nbsp;{{list1.video_subtitle}}</p>
      <div class="open" @click="open()">
        <div class="unfold" style="display:block;">【展开】</div>
        <div class="packup" style="display:none;">【收起】</div>
      </div>
      <section class="bg_title">
          <router-link to="" class="more">
          <img :src="list1.video_icon" alt="">
          <div>
            <span class="food">{{list1.video_icon_title}}</span><br>
            <span>{{list1.video_icon_subtitle}}</span>
          </div>
        </router-link>
        </section>
      <div class="goback">
        <span>选集</span>
        <router-link to="/index">返回首页&gt;</router-link>
      </div>
      <section class="selections">
        <div class="swiper-container swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide" v-for="item of list" :key="item.id">
                <div class="videoList">
                  <router-link to="">
                    <img :src="item.img_url">
                    <span>{{item.ctime}}</span>
                  </router-link>
                  <span>{{item.title}}</span>
                </div>
              </div>
            </div>
          </div>
      </section>
    </section>
    <section class="comment">
      <h4>评论</h4>
      <div class="comment-section">
        <div>
          <img src="http://127.0.0.1:3000/img/videoDetails/userPhoto.jpg" v-if="flag" class="loginbefore">
          <img :src="userphoto" alt="" v-if="!flag" class="loginafter">
        </div>
        <div><textarea v-model="commenttext" @keyup="iscomment" @click="cur=1" :class="cur==1?'textareaafter':''" class="comment-textarea" placeholder="快来和大家分享你的感想吧" name="" id="" cols="30" rows="10"></textarea></div>
      </div>
      <div class="commentbtn" v-show="cur">
        <span class="textlen">{{commenttext.length}} / <span>300</span></span>
        <span class="btn">
          <button @click="cur=0">取消</button>
          <button :disabled="comment" :class="{discomment:comment==false}" @click="writecomment">评论</button>
        </span>
      </div>
      <ul class="commentoth">
        <li v-for="item of getcommenttext" :key="item.id">
          <div>
            <img :src="item.usePhotos" alt="">
          </div>
          <div>
            <span class="userName">{{item.userName}}</span>
            <p class="userComment">{{item.comment}}</p>
            <span class="userCtime">{{item.commentTime}}</span>
          </div>
        </li>
      </ul>
      <span class="nomore">——·没有更多了·——</span>
    </section>
  </div>
</template>
<script>
export default {
  props:["id"],
  data(){
    return{
      subtitle:'',
      commenttext:"",
      comment:true,
      liConHeight: 40, // 两行文字的高度
      list:[],
      cur:0,
      title:{},
      list1:{id:0},
      getcommenttext:[],
      userphoto:"",
      flag:true,
    }
  },
  created() {
    this.theArr();
    this.getvideoDetails();
    this.islogin();
  },
  updated() {        
    this.getcomment();
  },
  methods: {
    islogin(){
      var url="http://127.0.0.1:3000/getInfo";
      this.axios.get(url).then(result=>{
        if(!result.data.uname && !result.data.photo){
          this.flag=true;
        }else{
          this.userphoto=result.data.photo;
          this.flag=false;
          console.log(this.userphoto);
        }
      })
    },
    getcomment(){
      var videoid=this.id;
      var url="http://127.0.0.1:3000/getcomments"
      // console.log(url);
      this.axios.get(url).then(result=>{
        this.getcommenttext=result.data;
      })
    },
    writecomment(){
      var videoId=this.id;
      console.log(videoId);
      var url="http://127.0.0.1:3000/getInfo";
      this.axios.get(url).then(result=>{
        if(!result.data.uname && !result.data.photo){
          this.$toast("请登录");
          setTimeout(() => {
            this.$router.push("/login");
          }, 500);
        }else{
          var url="http://127.0.0.1:3000/comments?comment="+this.commenttext;
          this.axios.get(url).then(result=>{
            if(result.data.code==1){
              this.getcomment();
              this.commenttext="";
            }
          })
        }
      }) 
    },
    getvideoDetails(){
      var url="http://127.0.0.1:3000/videoDetails";
      this.axios.get(url,{params:{id:this.id}}).then(result=>{
        this.title=result.data.title[0];
        this.list1=result.data.data[0];
      })
    },
    iscomment(){
      if(this.commenttext.length>0 && this.commenttext.length<300){
        this.comment=false;
      }else{
        this.comment=true;
      }
    },
    theArr(){
      this.list=[
        {id:1,img_url:"http://127.0.0.1:3000/img/video/food_list4.jpg",title:"1111111111",ctime:"2018-12-05"},
        {id:2,img_url:"http://127.0.0.1:3000/img/video/food_list4.jpg",title:"1111111111",ctime:"2018-12-05"},
        {id:3,img_url:"http://127.0.0.1:3000/img/video/food_list4.jpg",title:"1111111111",ctime:"2018-12-05"},
        {id:4,img_url:"http://127.0.0.1:3000/img/video/food_list4.jpg",title:"1111111111",ctime:"2018-12-05"},
        {id:5,img_url:"http://127.0.0.1:3000/img/video/food_list4.jpg",title:"11111111111111111111111111111111",ctime:"2018-12-05"},
      ];
    },
    open() {
        var liCon=document.querySelector(".liCon");
        var unfold=document.querySelector(".unfold");
        var packup=document.querySelector(".packup");
        var open=document.querySelector("open");
        var height = liCon.offsetHeight;
        if (height === this.liConHeight) { // 展开
          liCon.style.height = 'auto'
          height = liCon.offsetHeight
          liCon.style.height = this.liConHeight + 'px'
          var f = document.body.offsetHeight  // 必加
          liCon.style.height = height + 'px'
          unfold.style.display="none";
          packup.style.display="block";
        } else { // 收缩
          liCon.style.height = this.liConHeight + 'px'
          unfold.style.display="block";
          packup.style.display="none";
        }
      }
  },
  mounted() {
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
  .app-videoList header{
    box-shadow: 0px 0px 15px #cfcfcf;
    background-color: #fff;
    position:relative;
    display: flex;
    justify-content: space-between;
    flex-direction: row;
    align-items: center;
  }
  .app-videoList header img{
    margin-top:8px;
  }
  .app-videoList header a{
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
  .app-videoList a,
  .app-videoList .video-content .all{
    color:#0adf7f; 
    font-size:14px;
  }
  .app-videoList p{
    font-size:18px;
    color:#000;
    margin:0;
  }
  .app-videoList .mp4{
    width:100%;
  }
  .app-videoList .video_bg{
    background-color:#666;
    margin:0;
    margin-top:-5px;
  }
  .app-videoList .video_bg h3{
    width:100%;
    word-wrap: break-word;
    margin:0;
    padding:30px 15px 10px 15px;
    color:#fff;
    font-size:16px;
  }
  .app-videoList .video_bg p {
    font-size: 14px;
    color: #fff;
    overflow: hidden;
    transition: height 0.3s;
    padding:0 15px;
  }
  .app-videoList .video_bg .open{
    text-align: right;
    color:#fff;
    font-size:14px;
    padding:0 15px;
  }
  .app-videoList .video_bg .more img{
    width:60px;
    height:60px;
    border-radius:50%;
    margin-right:10px;
  }
   .app-videoList .video_bg .more,
   .app-videoList .video_bg .goback{
    display:flex;
    flex-direction: row;
    align-items: center;
    color:#fff;
  }
  .app-videoList .video_bg .bg_title{
    padding:20px 15px;
    border-bottom:1px solid #fff;
  }
  .app-videoList .video_bg .goback{
    justify-content: space-between;
    padding:15px 15px;
  }
  .app-videoList .video_bg .goback,
  .app-videoList .video_bg .goback a{
    color:#fff;
  }
  .app-videoList .video_bg .goback a{
    text-align: right;
  }
  .app-videoList .selections .swiper-slide,
  .app-videoList .selections .swiper-slide img{
    width:120px;
    height:80px;
    border-radius:5px;
  }
  .app-videoList .selections .swiper-wrapper{
    height:120px;
  }
  .app-videoList .selections .swiper-slide span{
    display:block;
    width:120px;
    overflow: hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
  }
  .app-videoList .selections .swiper-slide .videoList a span{
    position:absolute;
    bottom:0px;
    left:40px;
    background-color:rgba(0,0,0,0.5);
    width:80px;
    text-align: center;
    color:#fff;
  }
  .app-videoList .selections{
    padding-bottom:20px;
  }
  .app-videoList .comment{
    background-color:#fff;
    margin:0;
    padding:0 20px 5px 20px;
  }
  .app-videoList .comment h4{
    margin:0;
    padding:20px 0;
    font-size:18px;
    font-weight:600;
  }
  .app-videoList .comment .comment-section,
  .app-videoList .comment .commentbtn,
  .app-videoList .comment ul li{
    display: flex;
    flex-direction: row;
    /* align-items: center; */
  }
  .app-videoList .comment .comment-section img,
  .app-videoList .comment .commentoth li img{
    width:35px;
    height:35px;
    border-radius:50%;
    margin-right:8px;
  }
  .app-videoList .comment .comment-section textarea{
    width:290px;
    line-height: 30px;
    font-size:13px;
    padding:0 10px;
    background-color:#eeeeee;
    margin:0;
    height:30px;
    border-radius:5px;
    border:0;
  }
  .app-videoList .comment .comment-section .textareaafter{
    height:60px;
    border-radius:0;
    border:1px solid #0adf7f;
  }
  .app-videoList .comment .commentbtn{
    padding:10px 0 10px 40px;
    justify-content: space-between;
  }
   .app-videoList .comment .commentbtn .btn button{
     width:45px;
     height:25px;
     padding:0;
     font-size:12px;
     text-align: center;
     line-height: 25px;
     margin-left:5px;
   }
   .app-videoList .comment .commentbtn .btn button:last-child{
     background-color:#323232;
     color:#fff;
   }
   .app-videoList .comment .commentbtn .btn button.discomment{
     background-color:#0adf7f;
     border:none;
   }
   .app-videoList .comment ul{
    margin:0;
    padding:30px 0;
  }
  .app-videoList .comment ul li .userName{
    font-size:14px;
    color:#888;
  }
  .app-videoList .comment ul li .userComment{
    font-size:16px;
    padding:5px 0;
    width:290px;
    word-wrap: break-word;
  }
  .app-videoList .comment ul li .userCtime{
    font-size:12px;
    color:#aaa;
  }
  .app-videoList .nomore{
    display:block;
    text-align: center;
    font-size:14px;
    color:#888;
  }
</style>
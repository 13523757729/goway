<template>
  <div class="app-user">
    <header>
			 <div class="back" @click="back"><span class="mui-icon mui-icon-back"></span></div>
			 <div class="img"><img src="http://127.0.0.1:3000/img/index/logo.png" alt=""></div>
			 <div><span class="mui-icon mui-icon-email"></span><span class="mui-badge">5</span></div>
    </header>
		<section>
			<div class="user_bg">
				<div class="imgs"><img class="user_pic" :src="photo | photoFliter"></div>
				<div class="user_name">
					<span>{{uname | unameFliter}}</span>&nbsp;|
					<span @click="writeOff">退出登录</span>
				</div>
			</div>
			<section class="user_list">
				<ul>
					<li v-for='item of list' :key="item.id">
						<router-link to="">
							<span :style="'background:url('+item.img_url+') no-repeat 3%;background-size:30px;'">{{item.title}}</span>
						</router-link>
					</li>
				</ul>
			</section>
		</section>
		<footer>
      <p>去玩网</p>
			<p class="run">营业执照 经营许可证</p>
      <div>
        <span>移动端</span>
        <span>PC端</span>
        <span>APP</span>
      </div>
    </footer>
	</div>
</template>
<script>
import myFooter from '@/components/common/footer.vue'
export default {
  data(){
    return{
			photo:"",
			uname:"",
			list:[],
    }
	},
	created(){
		this.user_pic();
		this.getInfo();
	},
	methods:{
		writeOff(){
			var that=this;
			var url="http://127.0.0.1:3000/writeOff";
			that.axios.get(url).then(result=>{
				if((result.data.uname==undefined && result.data.photo==undefined) || (result.data.uname=="" && result.data.photo=="")){
					that.uname="";
					that.photo="";
				}else{
					that.uname=result.data.uname;
					that.photo=result.data.photo;
				}
				setTimeout(() => {
						that.$router.push("/index");
					}, 1000);
				
			})
		},
		getInfo(){
      var that=this;
      var url="http://127.0.0.1:3000/getInfo"
      that.axios.get(url).then(result=>{
				console.log(result.data);
        if((result.data.uname==undefined && result.data.photo==undefined) || (result.data.uname=="" && result.data.photo=="")){
          that.uname="";
					that.photo="";
				}else{
					that.uname=result.data.uname;
					console.log(that.uname);
					that.photo=result.data.photo;
					console.log(that.photo);
				}
      })
    },
		back(){
			this.$router.push("/index")
		},
		user_pic(){
			this.list=[
				{id:1,img_url:"http://127.0.0.1:3000/img/user/user_icon1.png",title:"我的论坛"},
				{id:2,img_url:"http://127.0.0.1:3000/img/user/user_icon2.png",title:"我的问答"},
				{id:3,img_url:"http://127.0.0.1:3000/img/user/user_icon3.png",title:"我的行程计划"},
				{id:4,img_url:"http://127.0.0.1:3000/img/user/user_icon7.png",title:"去玩商城收藏"},
				{id:5,img_url:"http://127.0.0.1:3000/img/user/user_icon9.png",title:"去玩商城优惠券"},
				{id:6,img_url:"http://127.0.0.1:3000/img/user/user_icon7.png",title:"常用旅客管理"},
				{id:7,img_url:"http://127.0.0.1:3000/img/user/user_icon10.png",title:"兑换我的玩币"},
				{id:8,img_url:"http://127.0.0.1:3000/img/user/user_icon12.png",title:"我的钱包余额"},
				{id:9,img_url:"http://127.0.0.1:3000/img/user/user_icon8.png",title:"账户与密码管理"},
			];
		}
	},
	comments:{
		myFooter
	}
}
</script>
<style>
.app-user header{
	display:flex;
	flex-direction:row;
	align-items: center;
	justify-content: space-between;
	position:relative;
}
.app-user header .img{height:30px;}
.app-user header .mui-icon-back,
.app-user header .mui-icon-email{
	font-size:35px;
	color:#fff;
}
.app-user header .mui-badge{
	position: absolute;
	top:5px;
	right:5px;
	color: #fff;
  background-color: rgb(255, 0, 0);
}
.app-user .user_bg{
	background:url(http://127.0.0.1:3000/img/user/user_bg.png) no-repeat center center;
	background-size: cover;
	width:100%;
	height:150px;
	position:relative;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.app-user .user_bg:after {
    content: ".";
    font-size: 0;
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 35px;
    background:linear-gradient(to bottom,rgba(0,0,0,0),rgba(0,0,0,0.8));
    background:-moz-linear-gradient(to bottom,rgba(0,0,0,0),rgba(0,0,0,0.8));
}
.app-user .user_bg .user_pic{
	width:60px;
	height:60px;
	border-radius:50%;
	margin-top:35px;
}
.app-user .user_bg .user_name,
.app-user .user_bg span,
.app-user .user_bg a{
	color:#fff;
	
}
.app-user .user_bg span{
	font-size:16px;
	font-weight: 600;
}
.app-user .user_bg a{
	font-size:14px;
}
.app-user .user_list{
	padding-top:10px;
}
.app-user .user_list ul{
	margin:0;
	padding:0;
}
.app-user .user_list ul li{
	background-color:#fff;
	border-bottom:1px solid #ddd;
	padding-left:10px;
}
.app-user .user_list ul li:last-child{
	margin:10px 0;
}
.app-user .user_list ul li:last-child,
.app-user .user_list ul li:nth-child(8){
	border-bottom:0;
}
.app-user .user_list ul li a{
	display: block;
	padding:10px 0;
}
.app-user .user_list ul li a:after {
    content: "";
    font-size: 0;
    float: right;
    width: 8px;
    height: 8px;
    border: 2px solid #c8c8c8;
    border-bottom: 2px solid transparent;
    border-left: 2px solid transparent;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    transform: rotate(45deg);
    margin: 14px 9px auto auto;
}
.app-user .user_list ul li span{
	/* width:70px; */
	height:40px;
	display: inline-block;
	padding-left:40px;
	line-height: 40px;
	font-size:16px;
	color:#666;
}
.app-user footer{
    background-color:#fff;
    padding-bottom:30px;
    text-align: center;
  }
  .app-user footer p{
    font-size:16px;
    color:#666;
    margin:0;
  }
	.app-user footer p.run{
		font-size:12px;
		margin-top:5px;
	}
  .app-user footer div span{
    font-size: 16px;
    padding:0px 10px;
  }
  .app-user footer div span:first-child{
    color:#666;
  }
</style>
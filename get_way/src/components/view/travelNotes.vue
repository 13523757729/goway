<template>
  <div class="app-travelNotes">
    <header>
      <router-link to="/index"><span class="mui-icon mui-icon-back"></span></router-link>
      <div class="imgs"><img src="http://127.0.0.1:3000/img/index/logo.png" alt=""></div>
    </header>
    <section class="sec1">
      <div class="travel-title">
        <span @click="cur=0" :class="{cafter:cur==0}" autohover="autohover">热门话题</span>
        <span @click="cur=1" :class="{cafter:cur==1}">一周内热帖</span>
    </div>
    <div class="tresult">
      <div class="show">
        <ul class="hot-topic" v-show="cur==0">
          <li v-for="item of list" :key="item.id">{{item.title}}</li>
        </ul>
        <ul class="hot-topic" v-show="cur==1">
          <li v-for="item of list1" :key="item.id">{{item.title}}</li>
        </ul>
      </div>
    </div>
    <h3>去玩兴趣小组</h3>
    <div class="group">
      <div class="group-item">
        <router-link to="/*" v-for="item of list2" :key="item.id">
          <img :src="item.pic_url" alt="">
          <span>{{item.title}}</span>
        </router-link>
      </div>
    </div>
    <h3>玩遍欧洲</h3>
    <div class="group">
      <div class="group-item">
        <router-link to="/*" v-for="item of list3" :key="item.id">
          <img :src="item.pic_url" alt="">
          <span>{{item.title}}</span>
        </router-link>
      </div>
    </div>
     <h3>玩遍亚洲</h3>
    <div class="group">
      <div class="group-item">
        <router-link to="/*" v-for="item of list4" :key="item.id">
          <img :src="item.pic_url" alt="">
          <span>{{item.title}}</span>
        </router-link>
        <router-link to="/*"></router-link>
      </div>
    </div>
    <h3>玩遍美洲</h3>
    <div class="group">
      <div class="group-item">
        <router-link to="/*" v-for="item of list5" :key="item.id">
          <img :src="item.pic_url" alt="">
          <span>{{item.title}}</span>
        </router-link>
      </div>
    </div>
    <h3>玩遍大洋洲</h3>
    <div class="group">
      <div class="group-item">
        <router-link to="/*" v-for="item of list6" :key="item.id">
          <img :src="item.pic_url" alt="">
          <span>{{item.title}}</span>
        </router-link>
        <router-link to="/*"></router-link>
      </div>
    </div>
    <h3>玩遍非洲</h3>
    <div class="group">
      <div class="group-item">
        <router-link to="/*" v-for="item of list7" :key="item.id">
          <img :src="item.pic_url" alt="">
          <span>{{item.title}}</span>
        </router-link>
      </div>
    </div>
    </section>
    <footer>
      <p>去玩网</p>
      <div>
        <span>移动端</span>
        <span>PC端</span>
        <span>APP</span>
      </div>
    </footer>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[],
      list1:[],
      cur:0,
      list2:[],
      list3:[],
      list4:[],
      list5:[],
      list6:[],
      list7:[],
    }
  },
  created() {
    this.moreList();
  },
  methods: {
    moreList(){
      this.list=[
        {id:1,title:'去寻找，那古老而又美丽的名字 -- 耶路撒冷'},
        {id:2,title:'【一休妈】二刷西班牙，不走寻常路（塔拉戈纳、萨拉戈萨、布尔戈斯、毕尔巴鄂、奥维耶多、拉科鲁尼亚、卢戈、萨莫拉等19城）'},
        {id:3,title:'【你的世界地图长什么样】之【北纬59度，邂逅秋日斯德哥尔摩】（北欧游记瑞典篇，附详细自由行攻略及地铁站打卡TIPS）'},
        {id:4,title:'借着亚洲杯玩转中东，整整一个月把阿联酋玩出花（含阿曼）'},
        {id:5,title:'以色列｜SHALOM, ISRAEL!（耶路撒冷/特拉维夫/海法/死海）'},
      ];
      this.list1=[
        {id:1,title:'亚庇，看这一篇攻略就足够啦'},
        {id:2,title:'就让时光停留在这里——2019塞尔维亚12日深度游（公共交通非自驾，多图）'},
        {id:3,title:'【我的退休大礼包四】阿塞拜疆的人文，格鲁吉亚的山川，亚美尼亚的修道院（50天旅行之外高加索三国17日，20城镇8世遗）'},
        {id:4,title:'【PhoebeJIA】隔断红尘三十里 ||阿根廷（4月秋布宜/伊瓜苏/卡拉法特冰川/艾尔恰登徒步）'},
        {id:5,title:'美国西部15天奇幻旅程，阅读大自然的图书馆（66号和加州1号公路，洛杉矶，拉斯维加斯，旧金山，大峡谷国家公园，羚羊谷）'},
      ];
      this.list2=[
        {id:1,pic_url:"http://127.0.0.1:3000/img/travel/group/get.jpg",title:"结伴同游"},
        {id:2,pic_url:"http://127.0.0.1:3000/img/travel/group/visa.jpg",title:"签证"},
        {id:3,pic_url:"http://127.0.0.1:3000/img/travel/group/insurance.jpg",title:"保险"},
        {id:4,pic_url:"http://127.0.0.1:3000/img/travel/group/shopping.jpg",title:"旅行购物"},
        {id:5,pic_url:"http://127.0.0.1:3000/img/travel/group/discount.jpg",title:"去玩折扣"},
        {id:6,pic_url:"http://127.0.0.1:3000/img/travel/group/sleep.jpg",title:"睡遍全球"},
        {id:7,pic_url:"http://127.0.0.1:3000/img/travel/group/pulley.jpg",title:"游轮"},
        {id:8,pic_url:"http://127.0.0.1:3000/img/travel/group/aviation.jpg",title:"航空"},
        {id:9,pic_url:"http://127.0.0.1:3000/img/travel/group/self-driving.jpg",title:"自驾"},
        {id:10,pic_url:"http://127.0.0.1:3000/img/travel/group/film.jpg",title:"旅行视频"},
        {id:11,pic_url:"http://127.0.0.1:3000/img/travel/group/camare.jpg",title:"旅行摄影"},
        {id:12,pic_url:"http://127.0.0.1:3000/img/travel/group/outdoors.jpg",title:"户外运动"},
        {id:13,pic_url:"http://127.0.0.1:3000/img/travel/group/diving.jpg",title:"潜水俱乐部"},
        {id:14,pic_url:"http://127.0.0.1:3000/img/travel/group/children.jpg",title:"带孩子旅行"},
        {id:15,pic_url:"http://127.0.0.1:3000/img/travel/group/parent.jpg",title:"带父母旅行"},
        {id:16,pic_url:"http://127.0.0.1:3000/img/travel/group/postcard.jpg",title:"明信片"},
        {id:17,pic_url:"http://127.0.0.1:3000/img/travel/group/tuniu.jpg",title:"途牛"},
        {id:18,pic_url:"http://127.0.0.1:3000/img/travel/group/Discovery.jpg",title:"Discover频道"},
      ];
      this.list3=[
        {id:1,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Europe.jpg",title:"环游欧洲"},
        {id:2,pic_url:"http://127.0.0.1:3000/img/travel/Europe/France.jpg",title:"法国/摩纳哥"},
        {id:3,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Germany.jpg",title:"德国"},
        {id:4,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Switzerland.jpg",title:"瑞士/列支敦士登"},
        {id:7,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Austria.jpg",title:"奥地利"},
        {id:8,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Hungary.jpg",title:"捷克/斯洛伐克/匈牙利"},
        {id:9,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Espana.jpg",title:"西班牙/葡萄牙/安道尔"},
        {id:10,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Greece.jpg",title:"希腊/塞浦路斯"},
        {id:11,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Italy.jpg",title:"意大利/梵蒂冈/圣马力诺/马耳他"},
        {id:12,pic_url:"http://127.0.0.1:3000/img/travel/Europe/England.jpg",title:"英国/爱尔兰"},
        {id:13,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Holland.jpg",title:"荷兰/比利时/卢森堡"},
        {id:14,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Poland.jpg",title:"波兰/立陶宛/拉脱维亚/爱沙尼亚"},
        {id:15,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Denmark.jpg",title:"挪威/瑞典/芬兰/丹麦/冰岛"},
        {id:16,pic_url:"http://127.0.0.1:3000/img/travel/Europe/Russia.jpg",title:"俄罗斯/乌克兰/白俄罗斯"},
        {id:17,pic_url:"http://127.0.0.1:3000/img/travel/Europe/ThreeCountry.jpg",title:"外高加索三国"},
        {id:18,pic_url:"http://127.0.0.1:3000/img/travel/Europe/turkey.jpg",title:"土耳其"},
        {id:19,pic_url:"http://127.0.0.1:3000/img/travel/Europe/SoutheastEurope.jpg",title:"东南欧地区"},
        {id:20,pic_url:"http://127.0.0.1:3000/img/travel/Europe/train.jpg",title:"欧洲交通"},
      ];
      this.list4=[
        {id:1,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Asian.jpg",title:"环游亚洲"},
        {id:2,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Japan.jpg",title:"日本"},
        {id:3,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Korea.jpg",title:"韩国/朝鲜"},
        {id:4,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Taiwan.jpg",title:"台湾"},
        {id:5,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Macao.jpg",title:"香港/澳门"},
        {id:6,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Thailand.jpg",title:"泰国"},
        {id:7,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Malaysia.jpg",title:"马来西亚/文莱"},
        {id:8,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Singapore.jpg",title:"新加坡"},
        {id:10,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Philippines.jpg",title:"菲律宾"},
        {id:11,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Cambodia.jpg",title:"柬埔寨"},
        {id:12,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Vietnam.jpg",title:"越南"},
        {id:13,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Laos.jpg",title:"老挝"},
        {id:14,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Burma.jpg",title:"缅甸"},
        {id:15,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Nepal.jpg",title:"尼泊尔"},
        {id:16,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Bhutan.jpg",title:"不丹"},
        {id:17,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Indonesia.jpg",title:"印度尼西亚/东帝汶"},
        {id:18,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Maldives.jpg",title:"马尔代夫"},
        {id:19,pic_url:"http://127.0.0.1:3000/img/travel/Asian/SriLanka.jpg",title:"斯里兰卡"},
        {id:20,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Bangladesh.jpg",title:"印度/孟加拉"},
        {id:21,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Iran.jpg",title:"伊朗"},
        {id:22,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Afghanistan.jpg",title:"巴基斯坦/阿富汗"},
        {id:23,pic_url:"http://127.0.0.1:3000/img/travel/Asian/UAE.jpg",title:"阿联酋/卡塔尔"},
        {id:24,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Israel.jpg",title:"以色列"},
        {id:25,pic_url:"http://127.0.0.1:3000/img/travel/Asian/westAsia.jpg",title:"西亚其他国家"},
        {id:26,pic_url:"http://127.0.0.1:3000/img/travel/Asian/CentralAsia.jpg",title:"中亚各国"},
        {id:27,pic_url:"http://127.0.0.1:3000/img/travel/Asian/Mongolia.jpg",title:"蒙古"},
        {id:28,pic_url:"http://127.0.0.1:3000/img/travel/Asian/GreatWall.jpg",title:"中国内地"},
      ];
      this.list5=[
        {id:1,pic_url:"http://127.0.0.1:3000/img/travel/America/America.jpg",title:"美国"},
        {id:2,pic_url:"http://127.0.0.1:3000/img/travel/America/Canada.jpg",title:"加拿大"},
        {id:3,pic_url:"http://127.0.0.1:3000/img/travel/America/UC.jpg",title:"中美地区"},
        {id:4,pic_url:"http://127.0.0.1:3000/img/travel/America/SouthAmerica.jpg",title:"南美/南极"},
      ];
      this.list6=[
        {id:1,pic_url:"http://127.0.0.1:3000/img/travel/Oceania/Australian.jpg",title:"澳大利亚"},
        {id:2,pic_url:"http://127.0.0.1:3000/img/travel/Oceania/NewZealand.jpg",title:"新西兰"},
        {id:3,pic_url:"http://127.0.0.1:3000/img/travel/Oceania/thePacific.jpg",title:"太平洋海岛"},
      ];
      this.list7=[
        {id:1,pic_url:"http://127.0.0.1:3000/img/travel/Africa/NorthAfrica.jpg",title:"北非地区"},
        {id:2,pic_url:"http://127.0.0.1:3000/img/travel/Africa/EastAfrica.jpg",title:"东非地区"},
        {id:3,pic_url:"http://127.0.0.1:3000/img/travel/Africa/Africa.jpg",title:"非洲海岛"},
        {id:4,pic_url:"http://127.0.0.1:3000/img/travel/Africa/other.jpg",title:"非洲其他国家"},
      ];
    }
  },
}
</script>
<style>
  .app-travelNotes header{
    display: flex;
    flex-direction: row;
    align-items: center;
  }
  .app-travelNotes header .mui-icon{
    font-size:35px;
    color:#fff;
    line-height:45px;
  }
  .app-travelNotes header .imgs{
    text-align: center;
    height:30px;
    margin:33%;
  }
  .app-travelNotes .travel-title{
    margin-right:10px;
    padding:10px;
    border-bottom:1px solid #ddd;
  }
  .app-travelNotes .travel-title span{
    padding:0 10px;
    font-size:14px;
    position: relative;
  }
  .app-travelNotes .travel-title span.cafter::after{
    content:"";
    position: absolute;
    left: 50%;
    bottom: -5px;
    display: block;
    width: 8px;
    height: 8px;
    margin-left: -4px;
    margin-bottom:-12px;
    border-right: 1px solid #e6e8ea;
    border-bottom: 1px solid #e6e8ea;
    background-color: #fff;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
  }
  .app-travelNotes .travel-title span.cbefore{
    color:#444;
  }
  .app-travelNotes .travel-title span.cafter{
    color:#2bab79;
  }
  .app-travelNotes .sec1{
    background-color:#fff;
  }
  .app-travelNotes .sec1 .hot-topic{
    margin:0;
    padding:0;
  }
  .app-travelNotes .sec1 .hot-topic li{
    height:40px;
    margin-left:10px;
    border-bottom:1px solid #ddd;
    font-size: 14px;
    line-height: 40px;
    color:#666;
    overflow: hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
  }
  .app-travelNotes .sec1 .hot-topic li:last-child{
    border-bottom:0;
  }
  .app-travelNotes .sec1 h3{
    font-size:18px;
    padding:15px;
    margin:0;
    border-top:1px solid #ddd;
    border-bottom:1px solid #ddd;
    color:#4b4b4b;
  }
  .app-travelNotes .sec1 .group-item{
    display: flex;
    flex-direction:row;
    flex-wrap: wrap;
    padding:3px 15px;
  }
  .app-travelNotes .sec1 .group-item a{
    width:50%;
    display: flex;
    flex-direction:row;
    flex-wrap: wrap;
    align-items: center;
    padding:20px 5px;
    border-bottom:1px solid #ddd;
  }
  .app-travelNotes .sec1 .group-item a:nth-child(even){
    border-left:1px solid #ddd;
    padding-left:15px;
  }
  .app-travelNotes .sec1 .group-item img{
    width:50px;
    height:40px;
    margin-right:10px;
  }
  .app-travelNotes .sec1 .group-item span{
    display: inline-block;
    width:90px;
    font-size:12px;
    color:#666;
  }
  .app-travelNotes footer{
    background-color:#fff;
    padding-bottom:30px;
    text-align: center;
  }
  .app-travelNotes footer p{
    font-size:16px;
    color:#666;
    margin:0;
  }
  .app-travelNotes footer div span{
    font-size: 12px;
    padding:0px 10px;
  }
  .app-travelNotes footer div span:first-child{
    color:#666;
  }
</style>
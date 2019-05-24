<template>
  <div class="app-travelDetails">
    <div class="imgTop">
      <router-link to="/index"><span class="mui-icon mui-icon-back"></span></router-link> 
    </div>
    <section class="listTitle">
      <h3>郑州飞往澳大利亚+悉尼歌剧院6日往返游</h3>
      <div class="price">
        <div>
        <span class="pricen">799</span>元起
      </div>
      <div><router-link to="/*">低价指南</router-link></div>
      <span class="look">浏览524821</span>
      <span class="sell">已售524份</span>
      </div>
      <ul class="discounts">
        <li>砍价</li>
        <li>秒杀</li>
        <li>赠电话卡</li>
      </ul>
    </section>
  </div>
</template>
<script>
export default {
  data(){
    return{
    }
  },
  created() {
    
  },
  methods: {
  },
}
</script>
<style>
  .app-travelDetails .imgTop{
    width:100%;
    height:200px;
    background-image: url(http://127.0.0.1:3000/img/travelDetails/Australia.jpg);
    background-repeat:no-repeat;
    background-size:100% 100%;  
  }
  .app-travelDetails .mui-icon-back{
    font-size:35px;
    color:#fff;
  }
  .app-travelDetails h3{
    font-weight: 500;
    font-size:20px;
    padding:15px;
    line-height:25px;
    margin:0;
  }
  .app-travelDetails .listTitle{
    background-color:#fff;
  }
  .app-travelDetails .listTitle .price{
    display:flex;
    flex-direction: row;
    color:#828282;
    padding:0 15px 0 15px;
    justify-content: space-between;
    align-items: center;
  }
  .app-travelDetails .listTitle .price .pricen{
    font-size:24px;
    color:#f14500;
  }
  .app-travelDetails .listTitle .price a,
  .app-travelDetails .listTitle .price .look,
  .app-travelDetails .listTitle .price .sell{
    font-size:16px;
  }
  .app-travelDetails .listTitle ul{
    padding:0;
  }
  .app-travelDetails .listTitle .discounts .text{
    font-size:14px;
    color:#0adf7f;
    border:1px solid #0adf7f;
  }
</style>
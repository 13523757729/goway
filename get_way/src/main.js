import Vue from 'vue'
import App from './App.vue'
import router from './router'

import'mint-ui/lib/style.css'
Vue.config.productionTip = false
//main.js 引入mui组件库所需样式文件
import './lib/mui/css/mui.css'
import './lib/mui/css/icons-extra.css'
import './lib/swiper/dist/js/swiper.min.js'
import './lib/swiper/dist/css/swiper.min.css'
//按需加载mint-ui组件库中一个组件Header
//1:按需引入Header,Button,Swipe,SwipeItem
/*
import {Header,Button,Swipe,SwipeItem,Lazyload} from "mint-ui"
//2:全局注册Header
Vue.use(Lazyload);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Header.name,Header);
Vue.component("mt-button",Button);
*/
//完整引入 mint-ui组件库
import MintUI from "mint-ui";
Vue.use(MintUI);
//3:引入axios库 main.js
//3.1:引入axios库
import axios from "axios"
//3.2:配置跨域访问保存session中数据
axios.defaults.withCredentials=true
//3.3:将axios配置为Vue实例属性
Vue.prototype.axios = axios
Vue.filter("unameFliter",function(val){
  var str=String(val);
  return str;
})
Vue.filter("photoFliter",function(val){
  var pic=val;
  return pic;
})
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')

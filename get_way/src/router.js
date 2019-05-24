import Vue from 'vue'
import Router from 'vue-router'
import index from './components/view/index.vue'
import login from './components/view/login.vue'
import register from './components/view/register.vue'
import user from './components/view/user.vue'
import destination from './components/view/destination.vue'
import video from './components/view/video.vue'
import search from './components/view/search.vue'
import NotFound from './components/view/notFound.vue'
import travelNotes from './components/view/travelNotes.vue'
import videoList from './components/view/video_list.vue'
import travelDetails from './components/view/travel_details.vue'
import Hotel from './components/view/hotel.vue'
import togther from './components/view/together.vue'
Vue.use(Router)
export default new Router({
  // model:history
  routes: [
    {path:'/',component:index},
    {path:'/index',component:index},
    {path:'/search/:key',component:search,props:true},
    {path:'/login',component:login},
    {path:'/register',component:register},
    {path:'/user',component:user},
    {path:'/destination',component:destination},
    {path:'/video',component:video},
    {path:'/search',component:search},
    {path:'/travelNotes',component:travelNotes},
    {path:'/videoList/:id',component:videoList,props:true},
    {path:'/travelDetails',component:travelDetails},
    {path:'/Hotel',component:Hotel},
    {path:'/together',component:togther},
    {path:"*",component:NotFound}
  ]
})

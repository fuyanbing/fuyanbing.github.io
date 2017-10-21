import Vue from 'vue'

//引入路由
import VueRouter from 'vue-router'

//引入mint-ui
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
import App from './App.vue'

//引入字体图标
import './font-awesome/css/font-awesome.css'

//引入自定义css样式
import './customer/customer.css'

//引入路由配置
import routerConfig from './router.js'

//使用路由
Vue.use(VueRouter);
//const router=new VueRouter(routerConfig);
const router = new VueRouter({
	mode: 'history',
	routes:routerConfig.routes
})

console.log(routerConfig.routes)

//use mint-ui
Vue.use(MintUI)

new Vue({
	router,
  el: '#app',
  render: h => h(App)
})

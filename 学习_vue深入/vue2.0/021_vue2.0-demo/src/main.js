//Vue模块编译
import Vue from 'vue'
import VueRouter from 'vue-router'

//引入主页模块，路由
import App from './App.vue'
import routerConfig from './router.js'

//引入ccs模块
import './assets/css/animate.css'
import './assets/css/1.css';


Vue.use(VueRouter);
const router=new VueRouter(routerConfig);


new Vue({
	router,
  el: '#app',
  render: h => h(App)
})

import Vue from 'vue'
import VueRouter from 'vue-router'
//引入需要的模块
import Home from './components/Home.vue'
import News from './components/News.vue'

//返回出去
export default{
	routes:[
		{path:'/home',component:Home},
		{path:'/news',component:News},
		{path:'*',redirect:'/home'}
	]
}

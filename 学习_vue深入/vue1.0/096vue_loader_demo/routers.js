import Vue from 'vue'
import VueRouter from 'vue-router'

import App from './App.vue'
import Home from './components/Home.vue'
import News from './components/News.vue'
import Menu from './components/Menu.vue'
import Login from './components/Login.vue'
import Reg from './components/Reg.vue'
import Detail from './components/Detail.vue'

//使用组件，模块
Vue.use(VueRouter)

const router = new VueRouter({
    mode: 'history',
    base: __dirname,
    routes: [
        { path: '/home', component:Home,
			children:[
				{path:'',redirect:'login'},
				{path:'login', component:Login},
				{path:'reg', component:Reg}
			]
       },
        { path: '/news', component:News,
        	children:[
				{path:'detail/:num', component:Detail},
				{path:'detail/', name:'news2', component:Detail}//不显示在url中，这样无形中就存在安全隐患，未成功
			]
        },
        { path: '/menu', component:Menu }
    ]
})

export default router
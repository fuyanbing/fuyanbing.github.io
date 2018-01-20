import Vue from 'vue'
import Router from 'vue-router'

let router = new Router({
	mode:'history',
	routes:[{
		path:'/',
		redirect:'/home'
	},{
		path:'/home',
		component:resolve => require(["@page/leftNav"],resolve),
		redirect:'/element-upload',
		children:[{
			path:'/rich-edit',
			component:resolve => require(["@page/rightContent/richEdit"],resolve),
		},{
			path:'/element-upload',
			component:resolve => require(["@page/rightContent/elementUpload"],resolve),
		},{
			path:'/rich-edit03',
			component:resolve => require(["@page/rightContent/richEdit03"],resolve),
		}]
	}]
})

Vue.use(Router)
export default router

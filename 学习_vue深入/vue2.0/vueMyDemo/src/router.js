import TodayNew from './components/TodayNew.vue'
import LoaclNew from './components/LoaclNew.vue'
import Column from './components/Column.vue'
import UserInfo from './components/UserInfo.vue'
import Article from './components/Article.vue'

export default[{
	path:'/todayNew',
	component:TodayNew
},{
	path:'/loaclNew',
	component:LoaclNew
},{
	path:'/column',
	component:Column
},{
	path:'user-info',
	component:UserInfo
},{
	path:'/artical/:id',
	component:Article
},{
	path:'/',
	redirect:'/todayNew'
},{
	path:'*',
	redirect:'/todayNew'
}]

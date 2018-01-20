import {
	saveImgListServer,
	findImgListServer
} from './questionServer'
const question = {
	state: {
		imgList:[],//获取的图片列表
	},
	mutations: { 
		GET_IMGLIST(state,data){
			state.imgList = data
		}
	},
	actions: {
		saveImgList({commit,dispatch},obj){
			saveImgListServer(obj)
			.then(res=>{
				dispatch('findImgList')
			})
		},
		findImgList({commit}){
			findImgListServer()
			.then(res=>{
				commit('GET_IMGLIST',res.messages.data[0].introImages)
			})
		}
	}
}
export default question
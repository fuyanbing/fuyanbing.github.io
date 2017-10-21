import LoadingComponent from './Loading.vue'
import LoadingMove from './Loading-move.vue'


const Loading ={
	install:function (Vue) {
		Vue.component('Loading',LoadingComponent)
		Vue.component('Loading-move',LoadingMove)
	}
};

export default Loading

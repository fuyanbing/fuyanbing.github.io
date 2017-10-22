<template> 
	<div id="app">
		<Loading v-show="loading"></Loading>
		<HeaderView v-show="headerShow"></HeaderView>
		<transition name="slide-down">
			<keep-alive>
				<router-view class="router-view"></router-view>
			</keep-alive>
		</transition>
		<FooterView></FooterView>
	</div>
</template>
<script>
	import HeaderView from './components/Header.vue'
	import FooterView from './components/Footer.vue'
	
	import {mapGetters,mapActions} from 'vuex'
	export default{
		computed:mapGetters([
			'headerShow',
			'loading'
		]),
		watch:{
			$route(to,from){
				if(to.path=='/user-info'){
					this.$store.dispatch('hideHeader');
				}else{
					this.$store.dispatch('showHeader');
				}
			}
		},
		components:{
			HeaderView,
			FooterView
		}
	}
</script>
<style>
	@import url("./assets/css/index.css");
	.slide-down-enter-active,.slide-down-leave-active{
		transition: .4s all ease;
		opacity: 0.2;
		transform: translate3d(0,6em,0);
	}
	.slide-down-enter,.slide-down-leave{
		opacity: 1;
		transform: translate3d(0,6em,0);
	}
</style>
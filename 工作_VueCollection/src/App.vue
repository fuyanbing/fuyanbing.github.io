<template>
  <div id="app" :style="styleH">
  	<to-nav></to-nav>
    <router-view/>
  </div>
</template>

<script>
import topNav from '@components/topNav'
export default {
  data(){
  	return{
  		msg:'dadsa',
  		styleH:{
  			height:''  		
  		}
  	}
  },
  mounted(){
		this.styleH.height = window.innerHeight + 'px'
  },
  components:{
  	'to-nav':topNav,
  }
}
</script>

<style lang="less">
@import "./style/index";
#app {
	min-width:1200px;
	display: flex;
	flex-flow: column;
	#leftNav{
		flex:1
	}
}
</style>

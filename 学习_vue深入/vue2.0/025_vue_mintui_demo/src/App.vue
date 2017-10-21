<template>
	<div id="app">
		<!--
      	作者：1204689638@qq.com
      	时间：2017-09-25
      	描述：头部
      -->
		<mt-header fixed title="Mint_UI学习"></mt-header>
		<!--
      	作者：1204689638@qq.com
      	时间：2017-09-25
      	描述：内容
      -->
			<!--<mt-button @click.native="handleClick">按钮</mt-button>-->
		<div id="conent">
			<ul>
			<li>
				<router-link to="/home">主页</router-link>
				<router-link to="/news">新闻</router-link>
			</li>
		</ul>
		<div>
		    <router-view></router-view>
		</div>
			<mt-cell title="Toast" to="/home" is-link value="提示信息"> 
				<i slot="icon" class="fa fa-comment-o fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Indicator" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Pull down" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Pull up" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Infinite scroll" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Message box" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Action sheet" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Popup" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Swipe" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Lazy load" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Range" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Progress" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Picker" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Datetime Picker" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Index List" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Palette Button" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			
			
			
			
			<mt-cell title="Header" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Tabbar" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Navbar" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Button" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Cell" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Cell Swipe" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Spinner" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="TabContainer" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Search" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			
			
			
			
			
			<mt-cell title="Swich" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Checklist" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Radio" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Field" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
			<mt-cell title="Badge" to="###" is-link value=""> 
				<i slot="icon" class="fa fa-camera-retro fa-lg ft-color"></i>
			</mt-cell>
		</div>
		<!--
      	作者：1204689638@qq.com
      	时间：2017-09-25
      	描述：底部
      -->
		<mt-tabbar v-model="selected">
			<mt-tab-item id="外卖">
				<img slot="icon" src="./assets/logo.png"> 外卖 </mt-tab-item>
			<mt-tab-item id="订单">
				<img slot="icon" src="./assets/logo.png"> 订单 </mt-tab-item>
			<mt-tab-item id="发现">
				<img slot="icon" src="./assets/logo.png"> 发现 </mt-tab-item>
			<mt-tab-item id="我的">
				<img slot="icon" src="./assets/logo.png"> 我的 </mt-tab-item>
		</mt-tabbar>
	</div>
</template>
<script>
	export default {
		name: 'app',
		data() {
			return {
				msg: 'Welcome to Your Vue.js App',
				selected: ''
			}
		},
		methods: {
			handleClick: function() {
				this.$toast('Hello world!')
			}
		}
	}
</script>
<style>
	#conent {
		padding-top: 50px;
	}
</style>
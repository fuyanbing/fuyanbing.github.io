<template>
	<div id="aaa">
		<h1>这里是首页</h1>
		<div>
			<router-link to="/home">主页</router-link>
			<router-link to="/news">新闻</router-link>
			<router-link to="/menu">菜单页</router-link>
		</div>
		<router-view></router-view>
	</div>
</template>

<script>
</script>

<style>
	body{
		background-color: #F7F7F7;
	}
	a{
		padding: 10px 5px;
	}
	.router-link-active{
		font-size: 18px;
		color: #FF6600;
	}
</style>
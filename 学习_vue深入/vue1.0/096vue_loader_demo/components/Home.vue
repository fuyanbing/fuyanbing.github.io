<template>
	<div>
		<h3>我是主页</h3>
		<ul>
			<router-link to="/home/login">用户登录</router-link>
			<router-link to="/home/reg">用户注册</router-link>
		</ul>
		<div class="box">
			<router-view></router-view>
		</div>
	</div>
</template>

<script>
</script>

<style scope>
	.box{
		border: dashed 1px #000000;
		padding: 10px;
	}
</style>
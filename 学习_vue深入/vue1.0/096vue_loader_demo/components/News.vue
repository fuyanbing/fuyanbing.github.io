<template>
	<div>
		<h3>我是新闻页</h3>
		<ul>
			<router-link to="/news/detail/001">第一条新闻</router-link>
			<router-link to="{name:'news2',params:{num:002}}">第二条新闻</router-link>
		</ul>
		<div class="box">
			<router-view></router-view>
		</div>
	</div>
</template>

<script>
</script>

<style>
</style>
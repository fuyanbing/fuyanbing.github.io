<template>
	<div id="header">
		<div class="header">
			<router-link to='/todayNew' tag='li' active-class='active'>
				<a href="javascript:;">今日头条</a>
			</router-link>
			<router-link to='/loaclNew' tag='li' active-class='active'>
				<a href="javascript:;">本地新闻</a>
			</router-link>
			<router-link to='/music' tag='li' active-class='active'>
				<a href="javascript:;">网易音乐</a>
			</router-link>
		</div>
	</div>
</template>
<script>
</script>
<style scoped="scoped">
	#header {
		position: fixed;
		width: 100%;
		height: 48px;
		line-height: 48px;
		top: 0;
		left: 0;
		z-index: 100;
		background-color: #DDDDDD;
		background-image: -webkit-linear-gradient(top, transparent, transparent 40%, #ddd 40%);
	}
	.header li{
		float: left;
		width: 32%;
		margin-left: 1%;
	}
	.header a{
		color: #505050;
		display: block;
		width: 100%;
		text-align: center;
		font-size: 16px;
		height: 45px;
		font-family: "微软雅黑";
		border-bottom: 3px solid transparent;
	}
	.header .active a{
		color: #f85959;
		border-bottom: 3px solid #f85959;
	}
</style>
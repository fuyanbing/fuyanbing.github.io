<template>
	<div id="leftNav">
		<div class="leftBox">
			<ul>
				<li v-for="(ele,index) in navlist" :key="index">
					<router-link :to="ele.path">{{ele.name}}</router-link>
				</li>
			</ul>
		</div>
		<div class="rightBox">
			<router-view></router-view>
		</div>
	</div>
</template>
<script>
export default{
	data(){
		return{
			navlist:[{
				path:"/rich-edit",
				name:"简单富文本"
			},{
				path:"/element-upload",
				name:"Upload 上传"
			},{
				path:"/rich-edit03",
				name:"简单富文本"
			}]
		}
	}
}
</script>
<style scoped="scoped" lang="less">
#leftNav{
	display: flex;
	width: 100%;
	box-sizing: border-box;
	min-height: 800px;
}
.leftBox{
	background: #2A333C;
	width: 180px;
	li a{
		color: #fff;
		display: block;
		width: 100%;
		padding-left: 15px;
		box-sizing: border-box;
		height: 45px;
		line-height: 45px;
	}
	.router-link-active{
		background-color: #027EC9;
	}
}
.rightBox{
	flex: 1;
	background-color: lightgoldenrodyellow;
}
</style>
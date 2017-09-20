<template>
	<div id="aaa">
		<ul>
			<li v-for="val in list">{{val}}</li>
		</ul>
		<router-view></router-view>
	</div>
</template>

<script>
	export default{
		data(){
			return{
				list:['apple','orange','banana']
			}
		}
	}
</script>

<style>
</style>
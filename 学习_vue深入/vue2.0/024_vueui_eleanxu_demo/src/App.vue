<template>
	<div id="app">
		<img src="./assets/logo.png">
		<h1>{{ msg }}</h1>
		<el-button @click=get>默认按钮</el-button>
		<el-button type="primary">主要按钮</el-button>
		<el-button type="text">文字按钮</el-button>
		<el-radio class="radio" v-model="radio" label="1">备选项</el-radio>
		<el-radio class="radio" v-model="radio" label="2">备选项</el-radio>
		<div class="block">
			<span class="demonstration">默认</span>
			<el-date-picker v-model="value1" type="date" placeholder="选择日期" :picker-options="pickerOptions0"> </el-date-picker>
		</div>
		<div class="block">
			<span class="demonstration">带快捷选项</span>
			<el-date-picker v-model="value2" align="right" type="date" placeholder="选择日期" :picker-options="pickerOptions1"> </el-date-picker>
		</div>
		<div>
			<myButton @click.native="get"></myButton>
			<div style="padding: 10px; border: 1px dashed #0099FF;">
				{{myMessage}}
			</div>
		</div>
	</div>
</template>
<script>
	import myButton from './components/Button.vue'
	import axios from 'axios'
	export default {
		name: 'app',
		data() {
			return {
				myMessage:'默认数据',
				msg: 'Vue插件Element-ui按需加载',
				radio: '1',
				pickerOptions0: {
					disabledDate(time) {
						return time.getTime() < Date.now() - 8.64e7;
					}
				},
				pickerOptions1: {
					shortcuts: [{
						text: '今天',
						onClick(picker) {
							picker.$emit('pick', new Date());
						}
					}, {
						text: '昨天',
						onClick(picker) {
							const date = new Date();
							date.setTime(date.getTime() - 3600 * 1000 * 24);
							picker.$emit('pick', date);
						}
					}, {
						text: '一周前',
						onClick(picker) {
							const date = new Date();
							date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
							picker.$emit('pick', date);
						}
					}]
				},
				value1: '',
				value2: '',
			};
		},
methods: {
	get() {
//		axios.get('get.txt').then(function (res) {
//		axios.get('https://api.github.com').then(function (res) {
		axios.get('https://api.github.com/users/tomtt').then(function (res) {
			console.log(res.data)//成功请求的数据
			this.myMessage = res.data.name;
		}.bind(this)).catch(function (err) {
			console.log(err)//失败的数据
		})
	}
},
components:{
	myButton
}
	}
</script>
<style>
	#app {
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		text-align: center;
		color: #2c3e50;
		margin-top: 60px;
	}
	h1, h2 {
		font-weight: normal;
	}
	ul {
		list-style-type: none;
		padding: 0;
	}
	li {
		display: inline-block;
		margin: 0 10px;
	}
	a {
		color: #42b983;
	}
</style>
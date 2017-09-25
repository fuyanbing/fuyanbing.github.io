<template>
	<div id="app">
		<!--Layout布局-->
		<h2>Layout布局</h2>
		<el-row>
			<el-col :span="24">
				<div class="grid-content bg-purple-dark"></div>
			</el-col>
		</el-row>
		<el-row>
			<el-col :span="6">
				<div class="grid-content bg-purple"></div>
			</el-col>
			<el-col :span="6">
				<div class="grid-content bg-purple-light"></div>
			</el-col>
			<el-col :span="6">
				<div class="grid-content bg-purple"></div>
			</el-col>
			<el-col :span="6">
				<div class="grid-content bg-purple-light"></div>
			</el-col>
		</el-row>
		<!--Icon图标-->
		<h2>Icon图标</h2>
		<i class="el-icon-edit"></i>
		<i class="el-icon-share"></i>
		<i class="el-icon-delete"></i>
		<el-button type="primary" icon="search">搜索</el-button>
		<!--按钮-->
		<div class="block">
			<h2>按钮/按钮组</h2>
			<el-button type="success">成功按钮</el-button>
			<el-button type="warning">警告按钮</el-button>
			<el-button type="danger">危险按钮</el-button>
			<el-button type="info">信息按钮</el-button>
			<el-button type="text">文字按钮</el-button>
			<el-button>默认按钮</el-button>
			<el-button-group>
				<el-button type="primary" icon="arrow-left">上一页</el-button>
				<el-button type="primary">下一页
					<i class="el-icon-arrow-right el-icon--right"></i>
				</el-button>
			</el-button-group>
			<el-button-group>
				<el-button type="primary" icon="edit"></el-button>
				<el-button type="primary" icon="share"></el-button>
				<el-button type="primary" icon="delete"></el-button>
			</el-button-group>
		</div>
		<div class="block">
			<h2>单选按钮</h2>
			<el-radio class="radio" v-model="radio" label="1">备选项</el-radio>
			<el-radio class="radio" v-model="radio" label="2">备选项</el-radio>
			<el-radio-group v-model="radio2">
				<el-radio-button label="上海"></el-radio-button>
				<el-radio-button label="北京" :disabled="true"></el-radio-button>
				<el-radio-button label="广州"></el-radio-button>
				<el-radio-button label="深圳"></el-radio-button>
			</el-radio-group>
			<h2>多选框组 复选</h2>
			<el-checkbox-group v-model="checkList">
				<el-checkbox label="复选框 A"></el-checkbox>
				<el-checkbox label="复选框 B"></el-checkbox>
				<el-checkbox label="复选框 C"></el-checkbox>
				<el-checkbox label="禁用" disabled></el-checkbox>
				<el-checkbox label="选中且禁用" disabled></el-checkbox>
			</el-checkbox-group>
			<div style="margin: 15px 0;"></div>
			<el-checkbox-group v-model="checkboxGroup1">
				<el-checkbox-button v-for="city in cities" :label="city" :key="city">{{city}}</el-checkbox-button>
			</el-checkbox-group>
			<div style="margin: 15px 0;"></div>
			<el-checkbox-group v-model="checkboxGroup2" size="small">
				<el-checkbox-button v-for="city in cities" :label="city" :disabled="city === '深圳'" :key="city">{{city}}</el-checkbox-button>
			</el-checkbox-group>
			<div style="margin: 15px 0;"></div>
			<el-checkbox-group v-model="checkboxGroup3" size="large" fill="#324057" text-color="#a4aebd" :min="1" :max="3">
				<el-checkbox-button v-for="city in cities" :label="city" :key="city">{{city}}</el-checkbox-button>
			</el-checkbox-group>
		</div>
		<h2>输入框</h2>
		<div>
			<el-input placeholder="请输入内容" v-model="input3">
				<template slot="prepend">Http://</template>
			</el-input>
		</div>
		<div style="margin-top: 15px;">
			<el-input placeholder="请输入内容" v-model="input4">
				<template slot="append">.com</template>
			</el-input>
		</div>
		<div style="margin-top: 15px;">
			<el-input placeholder="请输入内容" v-model="input5">
				<el-select v-model="select" slot="prepend" placeholder="请选择">
					<el-option label="餐厅名" value="1"></el-option>
					<el-option label="订单号" value="2"></el-option>
					<el-option label="用户电话" value="3"></el-option>
				</el-select>
				<el-button slot="append" icon="search"></el-button>
			</el-input>
		</div>
		<h2>下拉列表</h2>
		<el-select v-model="value" placeholder="请选择">
			<el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"> </el-option>
		</el-select>
		<h1><strong style="color: red;"><i>引用组件</i></strong></h1>
		<h2>Cascader 级联选择器组件</h2>
		<Cascader></Cascader>
		<h2>日历组件</h2>
		<Date></Date>
		<h2>Form表单</h2>
		<Form01></Form01>
		<h2>Dialog 对话框</h2>
		<Dialog01></Dialog01>
		<h2>Carousel 走马灯</h2>
		<Carousel></Carousel>
		<h2>Collapse 折叠面板</h2>
		<Collapse></Collapse>
	</div>
</template>
<script>
	import Cascader from './components/Cascader.vue'
	import Date from './components/Date.vue'
	import Form01 from './components/Form.vue'
	import Dialog01 from './components/Dialog.vue'
	import Carousel from './components/Carousel.vue'
	import Collapse from './components/Collapse.vue'
	
	const cityOptions = ['上海', '北京', '广州', '深圳'];
	export default {
		name: 'app',
		data() {
			return {
				radio: '1',
				radio2: '上海',
				checkList: ['选中且禁用', '复选框 A'],
				checkboxGroup1: ['上海'],
				checkboxGroup2: ['北京'],
				checkboxGroup3: ['广州'],
				cities: cityOptions,
				input3: '',
				input4: '',
				input5: '',
				select: '',
				options: [{
					value: '选项1',
					label: '黄金糕'
				}, {
					value: '选项2',
					label: '双皮奶'
				}, {
					value: '选项3',
					label: '蚵仔煎'
				}, {
					value: '选项4',
					label: '龙须面'
				}, {
					value: '选项5',
					label: '北京烤鸭'
				}],
				value: ''
			}
		},
		components: {
			Date,Cascader,Form01,Dialog01,Carousel,Collapse
		}
	}
</script>
<style>
	.el-row {
		margin-bottom: 20px;
		&:last-child {
			margin-bottom: 0;
		}
	}
	.el-col {
		border-radius: 4px;
	}
	.bg-purple-dark {
		background: #99a9bf;
	}
	.bg-purple {
		background: #d3dce6;
	}
	.bg-purple-light {
		background: #e5e9f2;
	}
	.grid-content {
		border-radius: 4px;
		min-height: 36px;
	}
	.row-bg {
		padding: 10px 0;
		background-color: #f9fafc;
	}
	.el-select .el-input {
		width: 110px;
	}
</style>
<template>
	<div id="elementUpload">
		<div class="ngl_img_div">
			<img v-for="(ele,index) in imglist" :key="index" :src="ele.url"/> 
		</div>
		<!--图片列表上传-->
		<el-dialog :visible.sync="dialogVisible">
			<img width="100%" :src="dialogImageUrl">
		</el-dialog>
		<el-upload id="from_img" 
			:action = newimgurl 
			list-type="picture-card"  
			:on-success="handleAvatarSuccess" 
			:on-preview="handlePictureCardPreview"
			:file-list="imglist" 
			:on-remove="handleRemove">
			<img src=""></img>
			<span>添加图片</span>
		</el-upload>
	</div>
</template>
<script>
import {mapState} from 'vuex'
import imgUrl from '@commonJS/const'
export default{
	data(){
		return{
			dialogVisible: false,//控制弹出层显示
			dialogImageUrl: '',//弹出图片链接地址
			newimgurl: imgUrl.aliyunoss+'ossController/uploadImageOss?accessToken=aaaa&folder=test/',//阿里上传图片
		}
	},
	mounted(){
		$("#elementUpload").click(function () {
			console.log(111)
		})
		this.$store.dispatch("findImgList")
	},
	computed:{
		...mapState({
		    imglist:state => state.question.imgList
		})
	},
	methods:{
		handleAvatarSuccess(response, file, fileList) {//上传成功
			let obj = {
				name:file.name,
				url:response.messages.firsKey
			}
			let arr = JSON.parse(JSON.stringify(this.imglist));
			let newArr = [];
			for (let {name,url} of arr) {
				let newObj={
					name:name,
					url:url
				}
				newArr.push(newObj)
			}
			newArr.push(obj)
			this.$store.dispatch("saveImgList",newArr)
		},
		handleRemove(file, fileList) {//删除
			let arr = [];
			for (let {name,url} of fileList) {
				let obj={
					name:name,
					url:url
				}
				arr.push(obj)
			}
			this.$store.dispatch("saveImgList",arr)
	    },
	    handlePictureCardPreview(file) {//放大
	        this.dialogImageUrl = file.url;
	        this.dialogVisible = true;
	    },
	}
}
</script>
<style lang="less" scoped="scoped">
.elementUpload{
	background-color: navajowhite;
}
.ngl_img_div{
	background:#027EC9;
	img{
		display: inline-block;
		width: 25%;
		box-sizing: border-box;
		padding: 10px;
	}
}
</style>
<style  lang="less">
#from_img{
	.el-upload-list--picture-card .el-upload-list__item{
		height: 175px;
	}
	.el-upload--picture-card{
		height: 175px;
	}
}
</style>
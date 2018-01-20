<template>
	<div class="readComprehend" id="readComprehend">
		<div class="qBlockContent">
			<div class="qBlockContentTitle">
				<div class="mark">
					例:The air hostess would<span>﹝1﹞</span>food and drinks
				</div>
				<div class="btn"><el-button type="primary" size="mini" @click="getPos()">插入空白</el-button><el-button type="success" size="mini" @click="getTextContent()">获取内容</el-button></div>
			</div>
			<div class="qBlockContentHtml" ref="myText" @paste="pasteFilter" contenteditable="true" placeholder="添加题目描述，100字以内"  spellcheck="false" @keydown.8="jianPanEvent($event)">
				Allan was worried. This was his first time to go traveling <span  contenteditable='false'>﹝01﹞</span>. He didn‘t know how to find his seat，<span contenteditable='false'>﹝02﹞</span> he went to the air hostess(空姐) and asked，“Could you help me? I can’t find my seat.” The air hostess showed <span contenteditable='false'>﹝03﹞</span> the seat and told him <span contenteditable='false'>﹝04﹞</span> and fasten the seat belt(系好安全带)。She told Allan not to move about when the plane was going up. And she also said that Allan‘s ears might feel <span contenteditable='false'>﹝05﹞</span> strange，but he didn’t need to <span contenteditable='false'>﹝06﹞</span> it because many people felt <span contenteditable='false'>﹝07﹞</span> that. When the plane was flying very high， Allan could stand up and walk around. He could <span contenteditable='false'>﹝08﹞</span> read books，newspapers or see films. The air hostess would <span contenteditable='false'>﹝09﹞</span></span> food and drinks. Allan would enjoy the flight and <span contenteditable='false'>﹝10﹞</span> soon.
			</div>
		</div>
		<div class="qBlock">
			<span class="answer" v-for="(item,index) in inputNumData">选项{{item}}答案:<input type="text" /></span>
		</div>
	</div>
</template>
<script>
export default{
	data(){
		return{
			inputNumData:[],//存放序号的个数
		}
	},
	mounted(){
		this.reHandle()
	},
	methods:{
		getTextContent(){
			let txtContent = this.$refs.myText.innerText;
			console.log(txtContent)
		},
		getPos(){//插入
	        if (this.inputNumData.length<20) {
	        	let range = window.getSelection().getRangeAt(0);
	        	let span = `<span style="padding:0 10px; border-bottom:1px solid #409EFF; color:#409EFF"  contenteditable="false">﹝${this.inputNumData.length+1}﹞</span>`
		        let spanDom = this.parseDom(span)
		        range.insertNode(spanDom[0]);
		        range.collapse(true)
		        let orderNum = ('0'+(this.inputNumData.length+1)).slice(-2)
		        this.inputNumData.push(orderNum)
	        } else{
	        	this.$message({
	        		type:'warning',
	        		message:'插入最大数为20个'
	        	})
	        	return false;
	        }
	        this.reHandle()
		},
		pasteFilter(e){//粘贴事件
		    e.preventDefault();
		    var text = null;
		    //得到剪贴板中的文本
		    if(window.clipboardData && clipboardData.setData) {// IE
		        text = window.clipboardData.getData('text');
		    } else {
		        text = (e.originalEvent || e).clipboardData.getData('text/plain');
		    };
		    if (document.body.createTextRange){//IE
		        if (document.selection) {
		            textRange = document.selection.createRange();
		        } else if (window.getSelection) {
		            sel = window.getSelection();
		            var range = sel.getRangeAt(0);
		            // 创建临时元素，使得TextRange可以移动到正确的位置
		            var tempEl = document.createElement("span");
		            tempEl.innerHTML = "&#FEFF;";
		            range.deleteContents();
		            range.insertNode(tempEl);
		            textRange = document.body.createTextRange();
		            textRange.moveToElementText(tempEl);
		            tempEl.parentNode.removeChild(tempEl);
		        };
		        textRange.text = text;
		        textRange.collapse(false);
		        textRange.select();
		    } else {// Chrome之类浏览器
		        document.execCommand("insertText", false, text);
		    };
		},
		jianPanEvent(){//回格事件
			setTimeout(()=>{
				this.reHandle()
			},100)
		},
		reHandle(){//正则处理事件
			let txtContent = this.$refs.myText.innerText;
			let newStr='',newArr=[];//存放最终返回给页面的值
			for(;;){
				if (/(﹝\d{1,2}﹞)/.test(txtContent)) {
					//处理新字符串
					let index = txtContent.indexOf(RegExp.$1);
					let startIndex = index+RegExp.$1.length;
					newStr = newStr + txtContent.slice(0,index) + `<span style="padding:0 10px; border-bottom:1px solid #409EFF; color:#409EFF"  contenteditable='false'>${RegExp.$1}</span>`
					txtContent = txtContent.slice(startIndex)
					//处理数组
					let na = RegExp.$1.match(/\d+/)[0];
					newArr.push(na)
				} else{
					newStr = newStr + txtContent
					break
				}
			}
			document.execCommand("InsertTextArea", false, newStr);
			this.inputNumData = newArr;
		},
		parseDom(arg){//字符串转dom
			let objE = document.createElement('span');
			objE.innerHTML = arg;
			return objE.childNodes;
		}
	},
}
</script>
<style lang="less" scoped="scoped">
.readComprehend{
	padding: 20px;
	.qBlock{
		span,input{
			display: inline-block;
		}
		input{
			width: 50px;
			border-bottom: 1px solid #e5e5e5;
		}
		.qBlockName{
			width: 60px;
		}
		.questionDescribe{
			width: 680px;
		}
		.add{
			color: #4070B2;
			border-radius: 100%;
			border:1px solid #4070B2;
			width: 25px;
			height: 25px;
			cursor: pointer;
			font-size: 25px;
			text-align: center;
			line-height: 23px;
		}
		.answer{
			padding-right: 20px;
			padding-bottom: 10px;
		}
	}
	.qBlockContent{
		background-color: #f2f4f7;
		padding: 20px;
		width: 100%;
		box-sizing: border-box;
		overflow: hidden;
		margin: 25px 0;
		border-radius: 5px;
		.qBlockContentTitle{
			display: flex;
			height: 40px;
			line-height: 40px;
			margin-top: -10px;
			border-bottom: 1px solid #e5e5e5;
			.mark{
				flex: 1;
				width: 0;
				color: #999;
				span{
					padding: 0 10px;
					border-bottom:1px solid #999;
				}
			}
			.btn{
				width: 170px;
			}
		}
		.qBlockContentHtml{
			min-height: 200px;
			line-height: 25px;
			outline: none;
			text-decoration: none;
			span{
				padding: 0 10px;
				color:#409EFF;
				border-bottom: 1px solid #409EFF;
			}
		}
		.qBlockContentHtml:empty:before{
			content: attr(placeholder);
		}
	}
}
</style>
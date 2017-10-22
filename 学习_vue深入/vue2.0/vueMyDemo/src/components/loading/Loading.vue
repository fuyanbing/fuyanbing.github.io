<template>
	
	<div class="zns-loading">
		<div class="zns-loading-inner">
			<div class="ball-spin-fade-loader">
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
	</div>
</template>

<script>
</script>

<style scoped="scoped">
	.zns-loading{
		position: fixed;
		z-index: 1000;
		width: 100%;
		box-sizing: border-box;
	}
	.zns-loading-inner{
		height: 100px;
		box-sizing: border-box;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	@-webkit-keyframes ball-spin-fade-loader{
		50%{
			opacity: 0.3;
			-webkit-transform: scale(0.4);
			transform: scale(0.4);
		}
		100%{
			opacity: 1;
			-webkit-transform: scale(1);
			transform: scale(1);
		}
	}
	@keyframes ball-spin-fade-loader{
		50%{
			opacity: 0.3;
			-webkit-transform: scale(0.4);
			transform: scale(0.4);
		}
		100%{
			opacity: 1;
			-webkit-transform: scale(1);
			transform: scale(1);
		}
	}
	.ball-spin-fade-loader{
		position: relative;
	}
	.ball-spin-fade-loader>div:nth-child(1){
		top: 25px;
		left: 0;
		animation: ball-spin-fade-loader 1s linear 0s infinite;/*动画名称,时长,播放函数,延迟,循环*/
		-webkit-animation: ball-spin-fade-loader 1s linear 0s infinite;/*动画名称,时长,播放函数,延迟,循环*/
	}
	.ball-spin-fade-loader>div:nth-child(2){
		top: 17.6px;
		left: 17.6px;
		animation: ball-spin-fade-loader 1s linear 0.12s infinite;/*动画名称,时长,播放函数,延迟,循环*/
		-webkit-animation: ball-spin-fade-loader 1s linear 0.12s infinite;/*动画名称,时长,播放函数,延迟,循环*/
	}
	.ball-spin-fade-loader>div:nth-child(3){
		top: 0;
		left:25px;
		animation: ball-spin-fade-loader 1s linear 0.24s infinite;/*动画名称,时长,播放函数,延迟,循环*/
		-webkit-animation: ball-spin-fade-loader 1s linear 0.24s infinite;/*动画名称,时长,播放函数,延迟,循环*/
	}
	.ball-spin-fade-loader>div:nth-child(4){
		top: -17.6px;
		left: 17.6px;
		animation: ball-spin-fade-loader 1s linear 0.36s infinite;/*动画名称,时长,播放函数,延迟,循环*/
		-webkit-animation: ball-spin-fade-loader 1s linear 0.36s infinite;/*动画名称,时长,播放函数,延迟,循环*/
	}
	.ball-spin-fade-loader>div:nth-child(5){
		top: -25px;
		left: 0;
		animation: ball-spin-fade-loader 1s linear 0.48s infinite;/*动画名称,时长,播放函数,延迟,循环*/
		-webkit-animation: ball-spin-fade-loader 1s linear 0.48s infinite;/*动画名称,时长,播放函数,延迟,循环*/
	}
	.ball-spin-fade-loader>div:nth-child(6){
		top: -17.6px;
		left: -17.6px;
		animation: ball-spin-fade-loader 1s linear 0.6s infinite;/*动画名称,时长,播放函数,延迟,循环*/
		-webkit-animation: ball-spin-fade-loader 1s linear 0.6s infinite;/*动画名称,时长,播放函数,延迟,循环*/
	}
	.ball-spin-fade-loader>div:nth-child(7){
		top: 0px;
		left: -25px;
		animation: ball-spin-fade-loader 1s linear 0.72s infinite;/*动画名称,时长,播放函数,延迟,循环*/
		-webkit-animation: ball-spin-fade-loader 1s linear 0.72s infinite;/*动画名称,时长,播放函数,延迟,循环*/
	}
	.ball-spin-fade-loader>div:nth-child(8){
		top: 17.6px;
		left: -17.6px;
		animation: ball-spin-fade-loader 1s linear 0.84s infinite;/*动画名称,时长,播放函数,延迟,循环*/
		-webkit-animation: ball-spin-fade-loader 1s linear 0.84s infinite;/*动画名称,时长,播放函数,延迟,循环*/
	}
	.ball-spin-fade-loader>div{
		background-color: #5477b2;
		width: 15px;
		height: 15px;
		border-radius: 100%;
		margin: 2px;
		position: absolute;
		animation-fill-mode: both;
		-webkit-animation-fill-mode: both;
	}
</style>
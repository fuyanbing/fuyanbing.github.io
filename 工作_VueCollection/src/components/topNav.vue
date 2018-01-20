<template>
  <div class="topNav">{{msg}}</div>
</template>
<script>
export default {
  name: 'topNav',
  data () {
    return {
      msg: '这是头部(公共组件)'
    }
  }
}
</script>
<style scoped lang="less">
.topNav{
	width: 100%;
	box-sizing: border-box;
	height: 65px;
	line-height: 65px;
	color: #FFFFFF;
	font-size: 20px;
	padding-left: 20px;
	background-image: url(../images/girl.jpg);
	background-position: left -150px; 
}
</style>

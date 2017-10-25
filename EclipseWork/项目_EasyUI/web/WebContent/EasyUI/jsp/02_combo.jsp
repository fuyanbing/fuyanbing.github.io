<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>表单增删改查</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="EasyUI/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="EasyUI/css/icon.css" />
<script type="text/javascript" src="EasyUI/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="EasyUI/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="EasyUI/js/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="EasyUI/css/yemian.css" />
<script type="text/javascript">
	$(function(){
		$('#cc').combo({
			required:true,
			aditable:false,
			width:255,
			panelHeight:300
		});
		$('#sp').appendTo($('#cc').combo('panel'));
		$('#sp img').click(function(){
			var s = $(this).attr('text');
			$('#cc').combo('setText', s).combo('hidePanel');//hidePanel 隐藏下拉面板
		})
	})
</script>
</head>
<body>
<select id="cc"></select>
<div id="sp">
	<div style="color:#99bbe8; background:#fafafa; padding:5px">选择一个语言</div>
	<div>
		<img src="EasyUI/img/001.jpg" value="001.jpg" text="图片1" />
	</div>
	<div>
		<img src="EasyUI/img/002.jpg" value="002.jpg" text="图片2" />
	</div>
	<div>
		<img src="EasyUI/img/003.jpg" value="003.jpg" text="图片3" />
	</div>
	<div>
		<img src="EasyUI/img/004.jpg" value="004.jpg" text="图片4" />
	</div>
	<div>
		<img src="EasyUI/img/005.jpg" value="005.jpg" text="图片5" />
	</div>
</div>
</body>
</html>
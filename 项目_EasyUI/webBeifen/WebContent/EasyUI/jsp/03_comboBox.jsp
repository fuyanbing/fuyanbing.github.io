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
<title>省份市区  自动搜索</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="EasyUI/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="EasyUI/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="EasyUI/css/icon.css" />
<script type="text/javascript" src="EasyUI/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="EasyUI/js/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="EasyUI/css/yemian.css" />
<script type="text/javascript">
	$(function(){
		$('#sel_1').combobox({
			onSelect:function(){
				var pid = $('#sel_1').combobox('getValue');
				$('#sel_2').combobox('setValue','');
				$('#sel_2').combobox('reload','ProvinceServlet?method=getCity&pid=' + pid);
			}
		});
		
		//搜索
		$('#search').combobox({
			mode:'remote',
			url:'UserServlet?method=searchName',
			valueField:'id',
			textField:'username',
			delay:1000
		})
	})
</script>
</head>
<body>
<!-- //valueField 绑定到 ComboBox 的 value 上的基础数据的名称。textField 绑定到 ComboBox 的 text 上的基础数据的名称。 -->
<select id="sel_1" class="easyui-combobox" url="ProvinceServlet?method=getPro" valueField="id" textField="name"></select>  
<select id="sel_2" class="easyui-combobox" valueField="id" textField="name"></select>
<br />
自动搜索:<input id="search" />
</body>
</html>
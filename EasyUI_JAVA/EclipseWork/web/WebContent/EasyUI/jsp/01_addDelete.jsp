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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="EasyUI/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="EasyUI/css/icon.css" />
<script type="text/javascript" src="EasyUI/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="EasyUI/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="EasyUI/js/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="EasyUI/css/yemian.css" />
<script type="text/javascript">
$(function(){
	/**
		表单验证
	**/
	//自定义的效验器
	$.extend($.fn.validatebox.defaults.rules,{
		//a<value<b
		midLength:{
			validator:function(value,param){
				return value.length >= param[0] && value.length <= param[1];
			},
			message:''
		},
		//value == c
		equalLength:{
			validator:function(value,param){
				return value.length == param[0];
			},
			message:''
		}
	})
	//年龄验证
	$('#age').numberbox({
		min:0,
		max:150,
		required:true,							//定义是否字段应被输入。
		missingMessage:'年龄必填！',				//当文本框是空时出现的提示文字。
		precision:0								//显示在小数点后面的最大精度。
	});
	
	//出生日期验证
	$('#birthday').datebox({
		required:true,
		missingMessage:'生日必填！',
		editable:false							//定义是否用户可以往文本域中直接输入文字。
	});
	
	//薪水验证
	$('#salary').numberbox({
		min:1000,
		max:20000,
		required:true,
		missingMessage:'薪水必填！',
		precision:2
	});
	
	//开始时间结束时间验证
	$('#startTime,#endTime').datetimebox({
		required:true,
		missingMessage:'时间必填！',
		editable:false
	});
	/**
		初始化数据表格
	**/
	var flag ; //undefined 判断新增和修改方法
	$('#t_user').datagrid({
		idField:'id',									//标识字段。
		title:'用户列表',									//列的标题文字。
		fit:true,										//Calendar 当设置为 true 时，则设置日历的尺寸以适应它的父容器
		height:450,
		url:'UserServlet?method=getList',//从远程站点请求数据的 URL。
		fitColumns:true,//True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
		striped:true,//True 就把行条纹化。（即奇偶行使用不同背景色）
		loadMsg:'数据正在加载,请耐心等待.......',//当从远程站点加载数据时，显示的提示信息。
		rownumbers:true,//True 就会显示行号的列。
		rowStyler:function(index,record){//返回例如 'background:red' 的样式，该函数需要两个参数：	rowIndex： 行的索引，从 0 开始。rowData： 此行相应的记录。
			if(record.age > 25){
				return "background:red";
			}
		},
		frozenColumns:[[						//冻结列特性，不要与fitColumns特性一起使用
			{
				field:'ck',
				width:50,
				checkbox:true
			}
		]],
		columns:[[
			{
				field:'username',
				title:'用户名',
				width:100,
				align:'center',
				styler:function(value,record){
					if(value == 'admin'){
						return 'background:blue;';
					}
				}
			},{
				field:'password',
				title:'密码',
				width:100,
				//hidden:true  隐藏当前列
			},{
				field:'age',
				title:'年龄',
				width:100,
				sortable:true
			},{
				field:'sex',
				title:'性别',
				width:50,
				formatter:function(value,record,index){
					if(value == 1){
						return '<span style=color:red; >男</span>';
					}else if(value == 2){
						return '<span style=color:green; >女</span>';
					}
				}
			},{
				field:'birthday',
				title:'生日',
				width:100,
				sortable:true
			},{
				field:'startTime',
				title:'开始时间',
				width:150
			},{
				field:'endTime',
				title:'结束时间',
				width:150
			},{
				field:'city' ,
				title:'所属城市' ,
				width:100 ,
				formatter:function(value , record , index){
					/*  if(value==1){
						return '北京';
					} else if(value == 2){
						return '上海';
					} else if(value == 3){
						return '深圳';
					} else if(value == 4){
						return '长春';
					}  */
					var str = '';
					$.ajax({
						type:'post',
						url:'UserServlet?method=getCityName',
						cache:false,
						async:false, //同步请求
						data:{id:value},
						dataType:'json',
						success:function(result){
							str = result.name;
							//console.info(result);
						}
					});
					return str; 
				}
			},{
				field:'salary' ,
				title:'薪水' ,
				width:100
			},{
				field:'description' ,
				title:'个人描述' ,
				width:150 , 
				formatter:function(value , record , index){
					return '<span title='+value+'>'+value+'</span>';
				}
			}
		]],
		pagination:true,
		pageSize:10,
		pageList:[5,10,15,20,50],
		toolbar:[
			{
				text:'新增用户',
				iconCls:'icon-add',
				handler:function(){
					flag = 'add',
					$('#mydialog').dialog({
						title:'新增用户'
					});
					$('#myform').get(0).reset();			//重置表格
					$('#mydialog').dialog('open');
				}
			},{
				text:'修改用户',
				iconCls:'icon-edit',
				handler:function(){
					flag = 'edit';
					var arr = $('#t_user').datagrid('getSelections');//过去所有选中的面板（panel）
					if(arr.length != 1){
						$.messager.show({
							title:'提示信息！',
							msg:'只能选择一行记录进行修改！'
						});
					}else{
						$('#mydialog').dialog({
							title:'修改用户'
						});
						$('#mydialog').dialog('open');//打开窗口
						$('#myform').get(0).reset();//重置表单
						$('#myform').form('load',{  	//装载数据
							id:arr[0].id,
							username:arr[0].username,
							password:arr[0].password,
							sex:arr[0].sex,
							age:arr[0].age,
							birthday:arr[0].birthday,
							city:arr[0].city,
							salary:arr[0].salary,
							startTime:arr[0].startTime,
							endTime:arr[0].endTime,
							description:arr[0].description
						});
					}
				}
			},{
				text:'删除用户',
				iconCls:'icon-remove',
				handler:function(){
					var arr = $('#t_user').datagrid('getSelections');
					if(arr.length<=0){
						$.messager.show({
							title:'提示信息！',
							msg:'至少选择一行记录进行删除！'
						});
					} else {
						$.messager.confirm('提示信息','确认删除？',function(r){
							if(r){
								var ids = '' ;
								for(var i=0; i<arr.length; i++){
									ids += arr[i].id + ',' ;
								}
								ids = ids.substring(0,ids.length-1);
								$.post('UserServlet?method=delete' ,{ids:ids},function(result){
									//1、刷新表格数据
									$('#t_user').datagrid('reload');
									//2、清空选中的
									$('#t_user').datagrid('unselectAll');
									//3、提示成功
									$.messager.show({
										title:'提示信息！',
										msg:'操作成功！'
									});
								});
							}else{
								return ;
							}
						});
					}
				}
			},{
				text:'查询用户',
				iconCls:'icon-search',
				handler:function(){
					//展开指定的面板（panel），'region' 参数可能的值是：'north'、'south'、'east'、'west'。
					$('#lay').layout('expand' , 'north');
				}
			}
		]
		
	});
	
	/***
	*	表单提交方法
	*/
	$('#btn1').click(function(){
		if($('#myform').form('validate')){		//validate 进行表单字段验证，当全部字段都有效时返回 true 。这个方法和 validatebox 插件一起使用。
			$.ajax({
				type:'post',
				url:flag=='add'?'UserServlet?method=save':'UserServlet?method=update',
				cache:false,
				data:$('#myform').serialize(),
				dataType:'json',
				success:function(result){
					//1 关闭窗口
					$('#mydialog').dialog('close');
					//2 刷新 datagrid
					$('#t_user').datagrid('reload');
					//3、清空选中的
					$('#t_user').datagrid('unselectAll');
					//4 提示信息
					$.messager.show({
						title:result.status,
						msg:result.message
					});
				},
				error:function(result){
					$.messager.show({
						title:result.status,
						msg:result.message
					});
				}
			});	 
		}else{
			$.messager.show({
				title:'提示信息！',
				msg:'数据验证不通过,不能保存！'
			})
		}
	})
	
	/***
	*	关闭窗口
	*/
	$('#btn2').click(function(){
		$('#mydialog').dialog('close');
	});
	
	/***
	*	搜索查询
	*/
	$('#searchbtn').click(function(){
		$('#t_user').datagrid('load',serializeForm($('#mysearch')));
	});
	
	/***
	*	重置搜索
	*/
	$('#clearbtn').click(function(){
		$('#mysearch').form('clear');
		$('#t_user').datagrid('load',{});
	})

});
//js方法： 序列化表单
function serializeForm(form){
	var obj = {};
	$.each(form.serializeArray(),function(index){
		if(obj[this['name']]){
			obj[this['name']] = obj[this['name']] + ',' + this['value'];
		}else{
			obj[this['name']] = this['value'];
		}
	});
	return obj;
}

</script>
<title>DataGrid 数据表格 增删改查</title>
</head>
<body>
<div id="lay" class="easyui-layout" style="width:1200px;height:475px; margin: 0 auto;" > 
    <div region="north" title="用户查询"   style="height:100px;">
    	<form id="mysearch" method="post">
    		用户名 <input name="username" class="easyui-validatebox" value="" /> &nbsp; &nbsp;
    		开始时间 <input name="startTime" class="easyui-datetimebox" style="width:160px" editable="false" value="" /> &nbsp; &nbsp;
    		结束时间 <input name="endTime" class="easyui-datetimebox" style="width:160px" editable="false" value="" /> &nbsp; &nbsp;
    		<a id="searchbtn" class="easyui-linkbutton">查询</a>
    		<a id="clearbtn" class="easyui-linkbutton">清空</a>
    	</form>
    </div>
    <div region="center" style="height:375px;"><table id="t_user"></table></div>
</div>
<div id="mydialog"  title="新增用户"  modal=true  class="easyui-dialog"  closed=true  style="width:300px">
	<form id="myform" action="" method="post">
	    <input type="hidden" name="id" value="" />
	    <table>
	    	<tr>
	    		<td>用户名:</td>
	    		<td><input type="text" name="username" class="easyui-validatebox" required=true validType="midLength[2,5]" missingMessage="用户名必填！" invalidMessage="用户名必须在2到5个字符之间！" value="" /></td>
	    	</tr>
	    	<tr>
	    		<td>密码:</td>
	    		<td><input type="text" name="password" class="easyui-validatebox" required=true validType="equalLength[4]" missingMessage="密码必填！" invalidMessage="密码必须为4位" value="" /></td>
	    	</tr>
	    	<tr>
	    		<td>性别:</td>
	    		<td>
	    			男:<input type="radio" checked="checked" name="sex" value="1" />
	    			女:<input type="radio" name="sex" value="2" />
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>年龄:</td>
	    		<td><input type="text" id="age" name="age" value="" /></td>
	    	</tr>
	    	<tr>
	    		<td>出生日期:</td>
	    		<td><input type="text" id="birthday" name="birthday" style="width:160px;" value="" /></td>
	    	</tr>
	    	<tr>
	    		<td>所属城市:</td>
	    		<td><input type="text" name="city" class="easyui-combobox" url="UserServlet?method=getCity" valueField="id" textField="name" value="" /></td>
	    	</tr>
	    	<tr>
	    		<td>薪水:</td>
	    		<td><input type="text" id="salary" name="salary" value="" /></td>
	    	</tr>
	    	<tr>
	    		<td>开始时间:</td>
	    		<td><input type="text" id="startTime" name="startTime" style="width:160px;" value="" /></td>
	    	</tr>
	    	<tr>
	    		<td>结束时间:</td>
	    		<td><input type="text" id="endTime" name="endTime" style="width:160px;" value="" /></td>
	    	</tr>
	    	<tr>
	    		<td>个人描述:</td>
	    		<td><input type="text" name="description" class="easyui-validatebox" required=true validType="midLength[5,50]" missingMessage="个人描述必填" invalidMessage="描述必须在5到50个字符之间！" value="" /></td>
	    	</tr>
	    	<tr align="center">
				<td colspan="2">
					<a id="btn1" class="easyui-linkbutton">确定</a>&nbsp;
					<a id="btn2" class="easyui-linkbutton">关闭</a>
				</td>
			</tr>
	    </table>
	</form>
</div>
</body>
</html>
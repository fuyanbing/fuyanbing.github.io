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
<title>数据表格的增删改查编辑</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="EasyUI/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="EasyUI/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="EasyUI/css/icon.css" />
<script type="text/javascript" src="EasyUI/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="EasyUI/js/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="EasyUI/css/yemian.css" />
<script type="text/javascript" src="EasyUI/js/commons.js"></script>
<script type="text/javascript">
$(function(){
	var editing; //判断用户是否处于编辑状态
	var flag; //判断新增和修改方法
	$('#t_user').datagrid({
		idField:'id',
		title:'可编辑的数据表格',
		fitColumns:true,
		url:'UserServlet?method=getList',
		striped:true,//True 就把行条纹化。（即奇偶行使用不同背景色）
		loadMsg:'数据正在加载，请耐心等待...',
		frozenColumns:[[
			{field:'ck',checkbox:true}
		]],
		columns:[[
			{
				field:'username',
				title:'用户名',
				width:100,
				align:'center',
				style:function(value,record){
					if(value == 'admin'){
						return 'background:blue;';
					}
				},
				editor:{
					type:'validatebox',
					options:{
						required:true,
						missingMessage:'用户名必填！'
					}
				}
			},
			{
				field:'password',
				title:'密码',
				width:100,
				editor:{
					type:'validatebox', //并未验证 等待中。。。。。。。。
					options:{
						required:true,
						missingMessage:'密码必填!'
					}
				}
			},
			{
				field:'age',
				title:'年龄',
				width:100,
				sortable:true,
				editor:{
					type:'numberbox',
					options:{
						required:true,
						missingMessage:'年龄必填!',
						min:0,
						max:150,
						precision:0
					}
				}
			},{
				field:'sex',
				title:'性别',
				width:50,
				formatter:function(value,record,index){
					if(value==1){
						return '<span style=color:red;>男</span>';
					}else if (value == 2){
						return '<span style=color:green;>女</span>';
					}
				},
				editor:{
					type:'combobox',
					options:{
						data:[{id:1,val:'男'},{id:2,val:'女'}],
						valueField:'id',
						textField:'val',
						required:true,
						missingMessage:'性别必填!'
					}
				}
			},{
				field:'birthday',
				title:'生日',
				width:100,
				sortable:true,
				editor:{
					type:'datebox',
					options:{
						required:true,
						missingMessage:'生日必填!',
						editable:false //禁止手动输入
					}
				}
			},{
				field:'startTime',
				title:'开始时间',
				width:150,
				editor:{
					type:'datetimebox',
					options:{
						required:true,
						missingMessage:'时间必填!',
						editor:false
					}
				}
			},{
				field:'endTime',
				title:'结束时间',
				width:150,
				editor:{
					type:'datetimebox',
					options:{
						required:true,
						missingMessage:'时间必填!',
						editor:false
					}
				}
			},{
				field:'city',
				title:'城市',
				width:100,
				formatter:function(value,record,index){
					if(value==1){
						return '北京';
					}else if(value==2){
						return '上海';
					}else if(value==3){
						return '深圳';
					}else if(value==4){
						return '长春';
					}
				},
				editor:{
					type:'combobox',
					options:{
						url:'UserServlet?method=getCity',
						valueField:'id',
						textField:'name',
						required:true,
						missingMessage:'城市必填!'
					}
				}
			},{
				field:'salary',
				title:'薪水',
				width:100,
				editor:{
					type:'numberbox',
					options:{
						required:true,
						missingMessage:'薪水必填!',
						min:1000,
						max:20000,
						precision:2
					}
				}
			},{
				field:'description',
				title:'个人描述',
				width:150,
				formatter:function(value,record,index){
					return '<span title='+ value +'>' + value +'</span>';
				},
				editor:{
					type:'validatebox',
					options:{
						required:true,
						missingMessage:'描述必填!'
					}
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
					if(editing == undefined){
						flag = 'add';
						editing = 0;
						//1.先取消所有的选中状态
						$('#t_user').datagrid('unselectAll');
						
						$('#t_user').datagrid('insertRow',{
							index: 0,
							row: {}
						});
						$('#t_user').datagrid('beginEdit', 0);
						
					}
				}
			},{
				text:'修改用户',
				iconCls:'icon-edit',
				handler:function(){
					//获取所有选中的行数 返回数组
					var arr = $('#t_user').datagrid('getSelections');
					//console.info(arr);
					if(arr.length != 1){
							$.messager.show({
								title:'提示信息',
								msg:'只能选择一条记录进行修改!' 
							});
					} else {
						if(editing == undefined){
							flag = 'edit';
							
							//根据行记录对象获取该行的索引位置
							//返回指定行的索引，row 参数可以是一个行记录或者一个 id 字段的值。
							editing = $('#t_user').datagrid('getRowIndex',arr[0]);
							//console.info(editing);
							//开启编辑状态
							$('#t_user').datagrid('beginEdit',editing);
						}
					}
				}
			},{
				text:'保存用户',
				iconCls:'icon-save',
				handler:function(){
					//保存之前进行数据的校验，然后结束编辑并释放编辑状态字段
					if($('#t_user').datagrid('validateRow',editing)){
						//validateRow 验证指定的行，有效时返回 true。
						$('#t_user').datagrid('endEdit', editing);
						editing = undefined;
					}
				}
			},{
				text:'删除用户',
				iconCls:'icon-remove',
				handler:function(){
					var arr = $('#t_user').datagrid('getSelections');
					if(arr.length == 0 ){
						$.messager.show({
							title:'提示信息',
							msg:'请至少选择一条删除操作!'
						});											
					} else {
						$.messager.confirm('提示信息',' 确认删除？',function(r){
							if(r){
								var ids = '';
								//console.info(arr);
								//console.info(arr[0].id);
								for(var i=0; i<arr.length; i++){
									ids += arr[i].id + ","
								}
								ids = ids.substring(0,ids.length-1);
								//console.info(ids);
								$.post('UserServlet?method=delete',{ids:ids},function(result){
									$('#t_user').datagrid('reload');
									$('#t_user').datagrid('unselectAll');
									$.messager.show({
										title:'提示信息',
										msg:'操作成功!'
									});
								});
							}else{
								return ;
							}
						})
					}
				}
			},{
				text:'取消操作',
				iconCls:'icon-cancel',
				handler:function(){
					//rejectChanges回滚数据  回滚自从创建以来或最后一次调用 acceptChanges 以来所有更改的数据。
					$('#t_user').datagrid('rejectChanges');
					editing = undefined;
				}
			}
		],
		//onAfterEdit 当用户完成编辑一行时触发，参数包括：
		onAfterEdit:function(index,record){
			$.post(flag=='add'?'UserServlet?method=save':'UserServlet?method=update',record,function(result){
				$.messager.show({
					title:'提示信息',
					msg:'操作成功'
				});
			});
		}
	
	
	
	
	
	
	
	
	})
	
	
	
	
	
	
	
})
</script>
</head>
<body>
<table id="t_user"></table>
</body>
</html>













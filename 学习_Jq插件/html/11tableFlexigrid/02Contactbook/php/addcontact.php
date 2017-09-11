<?php
//打开会话设置
session_start();  
//输入UTF-8文档类型
header('Content-Type: text/html; charset=utf-8');
//包含网站配置文件和通用的函数文件
include_once 'config.inc.php';
//如果包含了提交的数据
if(isset($_POST['name'])){  
	$record = array(                        //构造插入数组
		'name'		=>$_POST ['name'],
		'company'	=>$_POST ['company'],
		'job'   	=>$_POST ['job'],
		'mobile'	=>$_POST ['mobile'],
		'office_phone'=>$_POST ['office_phone'],				
		'msn'	=>$_POST ['msn'],
		'email' =>$_POST ['email'],				
		'birthday' =>$_POST ['birthday'],
		'email'=>$_POST ['email'],				
		'address' =>$_POST ['address'],
		'memo'=>$_POST ['memo'],
	);
	//$record['birthday'] = 'new()';
	$id = $db->insert('contactbook',$record);//调用insert方法进行插入
	$arr['id']='';
	if($id){
		$arr['id']=$id;                    //返回新插入的数组
	}
	$arr['status']="successed";
	echo json_encode($arr);	               //返回json数组
}
?>
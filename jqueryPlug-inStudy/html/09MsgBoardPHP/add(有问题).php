<?php
//打开会话设置
session_start();
//输出UTF-8文档类型
header('Content-Type:text/html; charset=utf-8');
//包含网站配置文件和通用的函数文件
include_once 'config.inc.php';
include_once 'common.function.php';
//如果包含了提交的数据
if(isset($_POST['ipt_title'])){
	$record = array(		//构造更新数组
		'title' => $_POST['ipt_title'],
		'name'	=> $_POST['ipt_name'],
		'content' => $_POST['ipt_content'],
		'time'	=> date("Y-m-d H:i:s")
	);
	$id = $db -> insert('guestbook',$record);//调用insert方法更新
	$arr['id']='';
	if($id){
		$arr['id']=$id;
	}
	$total = getGuestbookCount(); //记录总数
	$pageSize = 6; //每页显示个数
	$totalPage = ceil($total/$pageSize); //总页数
	$arr['totalPage'] = $totalPage;
	echo json_encode($arr);
}
?>
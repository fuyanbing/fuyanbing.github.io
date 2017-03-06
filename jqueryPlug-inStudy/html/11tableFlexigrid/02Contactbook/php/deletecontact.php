<?php
	//包含网站配置文件和通用的函数文件
	include_once 'config.inc.php';
	$id = $_POST['id'];	
	$db->delete('contactbook','id in('.$id.')');
	echo "成功删除";
	exit();
?>
<?php
	/*
	 标题，描述(可选)
	 首页上出现 标题和回答中最热门的部分
	 评论
	*/
	
	/*
		标题，描述+ 评论 （用评论代替回答）
	*/
	
	sleep(1);
	require 'config.php';
	
	$title=trim($_POST['title']);
	$content=trim($_POST['content']);
	$user=trim($_POST['user']);
	
	if(empty($title) or empty($content)){
		return false;
	}
	
	
	//$query = "INSERT INTO `php`.`question` (title, content, user, date) VALUES ('{$_POST['title']}', '{$_POST['content']}', '{$_POST['user']}', NOW())";
	
	$query = "INSERT INTO `php`.`jqquestion` (title, content, user, date) VALUES ('{$title}', '{$content}', '{$user}', NOW())";
	
	mysql_query($query) or die('新增失败！'.mysql_error());
	
	echo mysql_affected_rows();
	
	mysql_close();
?>
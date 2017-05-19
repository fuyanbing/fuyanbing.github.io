<?php
	
	sleep(1);
	require 'config.php';
	
	$titleid=trim($_POST['titleid']);
	$comment=trim($_POST['comment']);
	$user=trim($_POST['user']);
	
	
	if(empty($titleid) or empty($comment) or empty($user)){
		return false;
	}
	
	
	$query = "INSERT INTO `php`.`jqcomment` (titleid, user, comment, date) VALUES ('{$titleid}', '{$user}', '{$comment}', NOW())";
	
	
	mysql_query($query) or die('新增失败！'.mysql_error());
	
	echo mysql_affected_rows();
	
	mysql_close();
?>
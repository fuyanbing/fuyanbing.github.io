<?php
	sleep(3);
	require 'config.php';
	
	
	if(empty($user) or empty($_POST['pass'])){
		return false;
	}
	
	$user = trim($_POST['user']);
	
	$query = "INSERT INTO `php`.`jquser` (user, pass, email, sex, birthday, date) 
			VALUES ('{$user}', '{$_POST['pass']}', '{$_POST['email']}', '{$_POST['sex']}', '{$_POST['birthday']}', NOW())";
/*	加密密码		VALUES ('{$_POST['user']}', sha1('{$_POST['pass']}'), '{$_POST['email']}', '{$_POST['sex']}', '{$_POST['birthday']}', NOW())";*/
	
	mysql_query($query) or die('新增失败！'.mysql_error());
	
	echo mysql_affected_rows();
	
	mysql_close();
?>
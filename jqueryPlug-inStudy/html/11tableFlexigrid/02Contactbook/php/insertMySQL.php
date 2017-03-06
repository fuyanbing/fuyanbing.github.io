<?php
	header("Content-type: text/html; charset=utf-8");

	$dbh = new PDO('mysql:host=localhost;dbname=php', 'root', 'root');  
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  
	$dbh->exec('set names utf8'); 
	$rd = rand(0,100);
	$sql = "INSERT INTO `php`.`contactbook` (`id`, `name`, `company`, `job`, `mobile`, `phone`, `office_phone`, `qq`, `msn`, `email`, `birthday`, `address`, `memo`) VALUES (NULL, '姓名".$rd."', '百度".$rd."', '前端工程师','13512894542','15712894542','010-1234567','1204689638','abc123','1204689638@qq.com',now(),'北京朝阳','无')"; 
	
	$stmt = $dbh->prepare($sql); 
	$stmt->execute(array(':login'=>'kevin2',':password'=>''));  
	echo $dbh->lastinsertid();  
?>
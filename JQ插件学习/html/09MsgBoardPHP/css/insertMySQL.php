<?php
	header("Content-type: text/html; charset=utf-8");

	$dbh = new PDO('mysql:host=localhost;dbname=php', 'root', 'root');  
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  
	$dbh->exec('set names utf8'); 
	$rd = rand(0,100);
	$sql = "INSERT INTO `php`.`guestbook` (`id`, `title`, `content`, `name`, `time`) VALUES (NULL, '汉子".$rd."', '333333333333333', '333333333333', now())"; 
	
	$stmt = $dbh->prepare($sql); 
	$stmt->execute(array(':login'=>'kevin2',':password'=>''));  
	echo $dbh->lastinsertid();  
?>
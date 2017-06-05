<?php
	header('Content-Type:text/html; charset=utf-8');
	$dbh = new PDO('mysql:host=localhost;dbname=php', 'root', 'root');  
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  
	$dbh->exec('set names utf8'); 
	//如果包含了提交的数据
	$record = array(		//构造更新数组
		'title' => $_POST['ipt_title'],
		'name'	=> $_POST['ipt_name'],
		'content' => $_POST['ipt_content'],
	);
	if(empty($record['title']) or empty($record['name']) or empty($record['content'])){
		return false;
	}
	$sql = "INSERT INTO `php`.`guestbook` (`id`, `title`, `name`, `content`, `time`) VALUES (NULL, '".$record['title']."', '".$record['name']."', '".$record['content']."', now())"; 
	
	$stmt = $dbh->prepare($sql); 
	$stmt->execute(array(':login'=>'kevin2',':password'=>''));  
?>
<?php

	header("Content-type: text/html; charset=utf-8");
	
	$record = array(
		'name' => $_POST['ipt_name'],
		'subject' => $_POST['ipt_subject'],
		'content' => $_POST['ipt_content'],
	);
	
	//返回表单数据
	echo '姓名:'.$record['name'].'<br/>留言标题:'.$record['subject'].'<br/>留言内容:'.$record['content'].'<br/>';

?>
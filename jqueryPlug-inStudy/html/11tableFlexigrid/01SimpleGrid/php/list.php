<?php
//包含网站配置文件和通用的函数文件
include_once 'config.inc.php';
include_once 'common.function.php';
//获取当前分页内容
$page=0;
if(isset($_POST['page'])){
	$page = $_POST['page'];
}else{
	$page=1;
}
//获取当前设定的每页显示记录条数
if(isset($_POST['rp'])){
	$rp = $_POST['rp'];
}else{
	$rp=10;
}
//得到当前的记录总数
$total = getGuestbookCount();
//获取当前的留言的记录的数组
$mlist = getGuestbookList($page,$rp);
//输出json头
header("Content-type:application/json");
//构建一个Flexigrid显示的数组
$jsonData = array('page'=>$page,'total'=>0,'rows'=>array());
//循环留言记录，构建json数组
foreach($mlist AS  $row){
	$entry = array('id' => $row['id'],
		'cell'=>array(
			'id'  => $row['id'],
			'title'  => $row['title'],
			'content'  => $row['content'],
			'time'  => $row['time'],
			'name'  => $row['name']
		)
	);
	$jsonData['rows'][] = $entry;
}
$jsonData['total'] = count($mlist);
//向客户端输出一个json数组
echo json_encode($jsonData);

?>
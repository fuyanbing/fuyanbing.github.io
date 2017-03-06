<?php
//包含网站配置文件和通用的函数文件
include_once 'config.inc.php';
//获取数据库表的记录总行数
function countRec($fname,$tname,$where) {
    global $db;	
	$sql = "SELECT count($fname) FROM $tname $where";
	return $db->getOneField($sql);
}
//声明config.inc.php中定义的全局变量
global $db;
$page = $_POST['page'];            //获取分页页码
$rp = $_POST['rp'];                //获取每页记录数
$sortname = $_POST['sortname'];    //排序字段
$sortorder = $_POST['sortorder'];  //排序顺序
//得到排序字段名和排序顺序
if (!$sortname) $sortname = 'name';
if (!$sortorder) $sortorder = 'asc';
//下面判断用户是否在搜索框中输入了搜索关键字和类型，如果包含则构建WHERE条件查询
	if($_POST['query']!=''){
		$where = "WHERE `".$_POST['qtype']."` LIKE '%".$_POST['query']."%' ";
	}else{
		$where ='';
	}
	if($_POST['letter_pressed']!=''){
		$where = "WHERE `".$_POST['qtype']."` LIKE '".$_POST['letter_pressed']."%' ";	
	}
	if($_POST['letter_pressed']=='#'){
		$where = "WHERE `".$_POST['qtype']."` REGEXP '[[:digit:]]' ";
	}
//构建排序字符串		
$sort = "ORDER BY $sortname $sortorder";
//构建分页字符串
if (!$page) $page = 1;
if (!$rp) $rp = 10;
//计算起始分页位置
$start = (($page-1) * $rp);
//构建分页查询LIMIT子句
$limit = "LIMIT $start, $rp";
//构建SELECT语句查询字符串
$sql = "SELECT id,name,company,job,mobile,phone,office_phone,qq,msn,email,birthday,address,memo FROM contactbook $where $sort $limit";
//调用getList查询数据库并返回查询数组
$mlist = $db->getList($sql);
//输出json头
header("Content-type:application/json");
//构建一个Flexigrid显示的数组
$jsonData = array('page'=>$page,'total'=>0,'rows'=>array());
//循环留言记录，构建json数组
foreach($mlist AS  $row){
	$entry = array('id' => $row['id'],
		'cell'=>array(
			'id'       => $row['id'],
			'name'     => $row['name'],
			'company'  => $row['company'],
			'job'      => $row['job'],
			'mobile'   => $row['mobile'],			
			'office_phone' => $row['office_phone'],
			'msn'   => $row['msn'],				
			'email'      => $row['email'],
			'birthday'   => $row['birthday'],									
			'address'      => $row['address'],
			'memo'   => $row['memo'],	
		)
	);
	$jsonData['rows'][] = $entry;
}
$jsonData['total'] = count($mlist);
//向客户端输出一个json数组
echo json_encode($jsonData);

?>
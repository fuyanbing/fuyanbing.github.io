<?php
/**
 * 公用函数库
 * */
/**
 * 获取所有的留言记录
 */
function getGuestbookCount(){
	global $db;
	
	//查询guestbook表，并返回查询结果数组
	$arr=$db->getList("select * from guestbook");
	//返回数组的元素个数
	return count($arr);
}
/**
 * 从数据库表中获取分页后的留言数据
 */
function getGuestbookList($StartPage=1,$PageSize=10){
	global $db; //申明函数体内使用的$db变量为global全局变量
	//调用getList函数返回SELECT函数的查询结果
	return $db->getList("select id,title,content,name,time from guestbook order by id asc limit $StartPage,$PageSize");
}
?>
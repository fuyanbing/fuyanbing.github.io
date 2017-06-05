<?php
/*
 * 从数据库表中取出图片列表数据
 */ 
function getImagesList(){
	global $db;          //申明函数体内使用的$db变量为global全局变量 
	//调用getList函数返回SELECT函数的查询结果
	return $db->getList("select id,title,path,memo,thumb_path,group_name from images order by id asc");
}
?>
<?php
/**
 * 公用函数库
 */

 /**
 * 获取所有的评分记录
 */ 
 function getRatingList(){
    global $db;
	return $db->getList("select * from rating");
 }

/**
 * 获取平均评分记录
 */ 
function getAvgRating(){
	global $db;          //申明函数体内使用的$db变量为global全局变量 
	//调用getOneRow函数返回SELECT函数的查询结果
	$row=$db->getOneRow("SELECT IFNULL(AVG(rating_value),0) avgrating FROM `rating` WHERE 1");
	//返回其中的AVG平均计算结果
	return $row["avgrating"];
}
?>
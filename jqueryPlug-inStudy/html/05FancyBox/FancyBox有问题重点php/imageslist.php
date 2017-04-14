<?php
//打开会话设置
session_start();  
//输入UTF-8文档类型
header('Content-Type: text/html; charset=utf-8');
//包含网站配置文件和通用的函数文件
include_once 'config.inc.php';
include_once 'common.function.php';
$arr['list']= getImagesList();
//返回被json序列化后的数组数据到客户端
echo json_encode($arr);
?>
<?php
header('Content-Type: text/html; charset=utf-8');
require_once 'database.inc.php';		                    //数据库配置文件
require_once 'db_mysql.php';		                        //数据库操作类
$db = new db_mysql();                                       //构建数据库操作对象实例
$db->connect(DB_HOST,DB_USER,DB_PWD,DB_NAME,DB_CHARSET);    //连接到数据库，保存连接为变量$db
/*防止 PHP 5.1.x 使用时间函数报错*/
if(function_exists('date_default_timezone_set')) date_default_timezone_set('PRC');
?>
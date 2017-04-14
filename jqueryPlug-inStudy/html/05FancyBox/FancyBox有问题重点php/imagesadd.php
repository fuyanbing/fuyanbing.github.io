<?php

/* 上传文件函数，$file_var是文件类型的input的名称，$filepath是服务器端的物理路径 */
function upfile($file_var,$filepath){
	//检查文件是否存在，如不存在则返回false
	if(!is_writable($filepath)){
		echo"$filepath 目录不存在或不可写";
		return false;
		exit;
	}
	//获取文件的名称
	$tofile=$_FILES["$file_var"]['name'];
	//获取文件的类型，在这里可以检测文件的类型，为简化示例进行了省略。
	$Filetype=substr(strrchr($_FILES["$file_var"]['name'],"."),1);
	//得表完整的上传文件名
	($tofile==='')?($uploadfile = $_FILES["$file_var"]['name']):($uploadfile = $tofile);
	//检测上传的文件名是否存在
	if(!($uploadfile==='')){
		//判断指定的文件是否是通过HTTP POST上传的
		if (!is_uploaded_file($_FILES["$file_var"]['tmp_name'])){
			//如果不是HTTP上传的则提示失败
			echo $_FILES["$file_var"]['tmp_name']." 上传失败.";
			return false;
			exit;
		}
        //将上传的临时文件保存到指定的服务器端地址中
		if (!move_uploaded_file($_FILES["$file_var"]['tmp_name'],$filepath.'/'.$uploadfile)){
			echo "上传失败。错误信息:\n";
			print_r($_FILES);
			exit;
		}else{
			//如果上传成功则返回true
			return true;
		}
	}else{
		return false;
		echo"无法上传";
	}
}
//包含网站配置文件，以便引用全局的$db变量操纵MySQL数据库
include_once 'config.inc.php';
//获取当前的文件所在的物理路径
$CurrentPath= dirname(__FILE__);
//替换物理路径中的斜线为反斜线
$CurrentPath= realpath(str_replace('\\','/',$CurrentPath));
//定义图片上传路径
$CurrentPath=$CurrentPath.'/images';
//获取客户端上传的相片标题和备注
$title=$_POST['ipt_title'];
$memo=$_POST['ipt_memo'];
//获取上传的原始图像名和缩略图图像名
$tofile='images/'.$_FILES["ipt_file"]['name'];
$tothumbfile='images/'.$_FILES["ipt_thumbfile"]['name'];
//调用upfile保存原始图像
if(!(upfile("ipt_file",$CurrentPath))){
	return false;
}
//调用upfile保存缩略图图像
if(!(upfile("ipt_thumbfile",$CurrentPath))){
	return false;
}
//如果包含了提交的数据，则调用insert方法插入数据
if(isset($_POST['ipt_title'])){  
	$record = array(                        //构造插入数组
		'title'	=>$title,
		'memo'  =>$memo,
		'path'	=>$tofile,
		'thumb_path' =>$tothumbfile,
		'group_name'	=>'group1'						
	);
	print_r($record);
	$id = $db->insert('images',$record);//调用insert方法进行插入
	$arr['id']='';
	if($id){
		$arr['id']=$id;                    //返回新插入的数组
	}
}
//重定向到imagesGallery.html页面
header('Location: imagesGallery.html');
?>
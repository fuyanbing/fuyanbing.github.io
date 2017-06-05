<?php
//打开会话设置
session_start();  
//输入UTF-8文档类型
header('Content-Type: text/html; charset=utf-8');
//包含网站配置文件和通用的函数文件
include_once 'config.inc.php';
include_once 'common.function.php';
//如果包含了提交的数据
if(isset($_POST['ipt_jrating'])){  
	$record = array(                        //构造更新数组
		'rating_title'			=>$_POST ['ipt_title'],
		'rating_value'			=>$_POST ['ipt_jrating'],
		'rating_content'		=>$_POST ['ipt_content'],
	);
	$id = $db->insert('rating',$record);   //调用insert方法进行更新
	if($id){
		echo "<script>alert('评分成功！')
		window.location='bookdetail.php';</script>";
	}
}
  $rating=getAvgRating();               //获取评分平均值
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="bookstyle.css">
<!--在这里包含jRating要使用的 -->
<!-- CSS文件 -->
<link rel="stylesheet" type="text/css" href="jquery/jRating.jquery.css" media="screen" />
<!-- jQuery文件 -->
<script type="text/javascript" src="jquery/jquery.js"></script>
<!--jRating插件文件-->
<script type="text/javascript" src="jquery/jRating.jquery.js"></script>
<title>图书详细信息页面</title>
</head>

<body>
<div id="main">
  <div id="header">
     <div id="logo">
        <div id="logo_text">
          <h1><a href="bookrating.php">图书<span class="logo_colour">详细信息页面</span></a></h1>
          <h2>jRating评分插件使用示例</h2>
      </div>
    </div>
  </div>
  <div id="site_content">
      <div class="sidebar">
        <!-- insert your sidebar items here -->
        <h3>jQuery案例实战</h3>
        <h4>一本介绍jQuery插件使用的图书</h4>
        <h5><div class="basic" data-average="<?php echo round($rating)*2 ?>" data-id="1"></h5><br/>
            评分值：<?php echo round($rating) ?>分
        <p>本书介绍了数十个jQuery插件的使用案例，内容简洁易懂，操作实用性强，是一本不可多得的jQuery插件参考书。</p>
        <p>jRating是一款非常灵活的评分插件，它可以非常快速的创建一个基于AJAX的星形的评分系统，它也被广泛用于互联网上的各类网站中，这个插件是开源且免费使用的，它灵活可配置，可被用于各种脚本语言，比如可以使用PHP和jRating来轻松的创建评分系统。</p>
<p><a href="#">查看详细</a></p>

      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1>评论列表</h1>
        <p>已经评论列表</p>
        <?php
		//查询rating表中已经存在的评论
        $mlist = getRatingList();
		//循环查询结果
		foreach($mlist as $list){
		?>
          <table width="515" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <!--输出评论标题-->
              <th width="261" height="30" align="left">
              <span>评论标题：</span>
			  <?php echo $list['rating_title']?></th>
              <th width="437" align="left">
               <!--输出评分值-->              
              <span>评分：</span>                           
			  <?php echo $list['rating_value']?>分;
            </tr>
            <tr>
              <!--输出评论内容内容-->
              <td height="50" colspan="2" align="left" valign="top">
			  <?php echo $list['rating_content']?>&nbsp;</td>
              </tr>
          </table>        
		<?php
		}
		?>
      </div>
    </div>
</div>
<script type="text/javascript">
        //页面加载时执行的代码
		$(document).ready(function(){	  
		      //在页面加载时，显示五星评分插件
			  $(".basic").jRating({
				 showRateInfo:true, //显示评分信息
				 length:10,          //长度为10颗星
                 isDisabled : true  //禁止选择评分
			   });		 
		});
</script>	

</body>
</html>
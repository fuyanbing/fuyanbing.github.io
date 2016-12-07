<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--页面使用的CSS样式-->
<link rel="stylesheet" type="text/css" href="bookstyle.css">
<!--在这里包含jRating要使用的 -->
<!-- jRating使用的CSS文件 -->
<link rel="stylesheet" type="text/css" href="jquery/jRating.jquery.css" media="screen" />
<!-- jQuery文件 -->
<script type="text/javascript" src="jquery/jquery.js"></script>
<!--jRating插件文件-->
<script type="text/javascript" src="jquery/jRating.jquery.js"></script>
<title>图书点评页面</title>
</head>

<body>
<div id="main">
  <div id="header">
     <div id="logo">
        <div id="logo_text">
          <h1><a href="bookrating.php">图书<span class="logo_colour">点评页面</span></a></h1>
          <h2>jRating评分插件使用示例</h2>
      </div>
      </div>
    </div>
  <div id="site_content">
      <div class="sidebar">
        <!-- insert your sidebar items here -->
        <h3>jQuery案例实战</h3>
        <h4>一本介绍jQuery插件使用的图书</h4>
        <h5>&nbsp;</h5>
        <p>本书介绍了数十个jQuery插件的使用案例，内容简洁易懂，操作实用性强，是一本不可多得的jQuery插件参考书。</p>
        <p>jRating是一款非常灵活的评分插件，它可以非常快速的创建一个基于AJAX的星形的评分系统，它也被广泛用于互联网上的各类网站中，这个插件是开源且免费使用的，它灵活可配置，可被用于各种脚本语言，比如可以使用PHP和jRating来轻松的创建评分系统。</p>
<p><a href="#">查看详细</a></p>

      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1>写评论</h1>
        <p>请选择评分星型为此图书打分</p>
        <form action="bookdetail.php" method="post">
          <div class="form_settings">
            <p><span>评论标题:</span>
            <input class="contact" type="text" name="ipt_title" value="" /></p>
            <p><span>评分:</span>
            <div class="basic" data-average="12" data-id="1"></div></p><div style="margin-left:100px" id="start_text"></div>
            <p><span>评论内容:</span>
            <textarea class="contact textarea" rows="8" cols="50" name="ipt_content"></textarea>
            <input type="hidden" name="ipt_jrating" id="ipt_jrating">
            </p>
            <p style="padding-top: 15px"><span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="提交评论" /></p>
          </div>
        </form>
        <p>&nbsp;</p>
      </div>
    </div>
</div>

<script type="text/javascript">
		$(document).ready(function(){	  
			  $(".basic").jRating({
				 step:true,
				 length : 10,         //五角星个数，默认为5个，在这里指定为10个
				 rateMax:10,          //指定最大评分分数为10
				 canRateAgain:true,  //可以重复评分
				 nbRates:20,          //可以重复评分20次
				 sendRequest:false,  //不向服务器端发送数据
				 //当评分星被单击时的显示
				 onClick : function(ele,rate){
					 if(rate){
           			  $("#ipt_jrating").val(rate);
					  $("#start_text").html("当前的评分值为:"+rate);
					 }
				 }
			   });		 
		});
		</script>		
</body>
</html>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/weibo.css"> </head>
<body>
<div class="input">
	<textarea class="input_detail" title="微博输入框">0</textarea>
	<span class="arrow">0</span>
</div>
<div class="func_area clearfix">
	<div class="func">
		<div class="limits">
			<a href="javascript:void(0)">
				<span class="W_autocut">公开</span>
				<span class="W_arrow">
					<em>◆</em>
				</span>
			</a>
		</div>
		<a href="javascript:void(0);" class="send_btn">发布</a>
	</div>
	<div class="kind_v2 S_txt3">
		<span class="kind_detail">
			<a class="S_func1" href="javascript:void(0);">
				<i class="W_ico16 icon_sw_face"></i>表情</a>
			<a class="S_func1" href="javascript:void(0);">
				<i class="W_ico16 icon_sw_img"></i>图片</a>
			<a class="S_func1" href="javascript:void(0);">
				<i class="W_ico16 icon_sw_movie"></i>视频</a>
			<a class="S_func1" href="javascript:void(0);">
				<i class="W_ico16 icon_sw_qing"></i>话题</a>
			<a class="S_func1" href="javascript:void(0);">
				<i class="W_ico16 icon_sw_chang"></i>长微博</a>
		</span>
		<i class="S_txt2">|</i>
		<div class="more">
			<a href="javascript:void(0);" title="查看更多">
				<span class="W_autocut">更多</span>
				<span class="W_arrow">
					<em class="down">◆</em>
				</span>
			</a>
		</div>
	</div>
</div>
<div class="W_layer">
	<div class="bg">
		<div class="content">
			<a class="W_close" href="javascript:void(0);" title="关闭"></a>
			<div class="title"> 本地上传</div>
			<div class="layer_pic_list clearfix">
				<div class="pic_list_count">共
					<i class="J_count"></i>张
					<em class="S_txt2">（按住ctrl可选择多张）</em>
				</div>
				<ul class="pic_list clearfix">
					<li class="add">
						<a href="javascript:;">+</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="arrow arrow_t" style="left: 72px;"></div>
	</div>
</div>
</body>
<script type="text/javascript">
	var textarea = document.querySelector('textarea');
	var W_layer = document.querySelector('div.W_layer');
	var W_close = document.querySelector('a.W_close');
	var W_add = W_layer.querySelector('li.add');
	var W_list = W_add.parentNode;
	var p_count = document.querySelector('i.J_count');

	function render_one(file0) {
		console.info(file0);
		var reader; // reader变量存放FileReader实例
		if(file0.type.toLowerCase().match(/image.*/)) { // 正则判断文件是否为图片类型
			reader = new FileReader(); // 实例化FileReader对象，用于读取文件数据
			reader.addEventListener('load', function(e) { // 监听FileReader实例的load事件
				var li = document.createElement('li');
				li.className = 'pic';
				li.innerHTML = '<img src="' + e.target.result + '">';
				W_list.insertBefore(li, W_add);
				p_count.innerHTML = (p_count.innerHTML >> 0) + 1;
			});
			reader.readAsDataURL(file0); // 读取文件为DataURL
		};
	}
	document.addEventListener('dragenter', function(e) {
		textarea.classList.add('textarea-enter');
		//为 textarea 元素添加 class:
	}, false);
	document.addEventListener('dragover', function(e) {
		e.preventDefault();
	}, false);
	document.addEventListener('dragleave', function(e) {
		textarea.classList.remove('textarea-enter');
	}, false);
	document.addEventListener('drop', function(e) {
		e.preventDefault();
		W_layer.style.display = 'block';
		textarea.classList.remove('textarea-enter');
		var files = e.dataTransfer.files;
		console.info(files);
		for(var i = 0, l = files.length; i < l; i++) {
			render_one(files[i]);
		};
	}, false);
	//关闭
	W_close.addEventListener('click', function(e) {
		e.preventDefault();
		W_layer.style.display = 'none';
	}, false);
</script>
</html>
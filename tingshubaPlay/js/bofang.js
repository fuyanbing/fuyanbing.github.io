$(function() {
	//添加动感音符位置
	var span = '<span class="listening-icon"></span>';
	$(".tName_title").after(span);

	//歌曲名字点击时所触发的事件
	$(".tName").click(function() {
		//获取下载地址
		var dlink = $(this).siblings(".tDownload").children("a").attr("href");
		//转化为播放地址
		var link = dlink.replace(/\?attname=/, '');
		//获取播放器
		var player = $(".bofangqi").get(0);
		//添加颜色标识符，转化为16进制
		var rgb = $(this).css("color");
		rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);

		function hex(x) {
			return("0" + parseInt(x).toString(16)).slice(-2);
		}
		rgb = "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
		if(rgb == "#333333") {
			//说明并未播放过词曲
			//初始化颜色，图标
			$(".tName").css("color", "#333333");
			$(".tName").children(".listening-icon").css('background-image', '')

			//设置当前颜色 图标
			$(this).css("color", "#4AA7E4");
			$(this).children(".listening-icon").css('background-image', 'url(img/qd3ODGuq.gif)');

			//为播放器设置播放地址，并播放
			$(".bofangqi").attr("src", link);
			player.play();
		} else if(player.paused) {
			player.play();
			$(this).children(".listening-icon").css('background-image', 'url(img/qd3ODGuq.gif)');
		} else {
			player.pause();
			$(this).children(".listening-icon").css('background-image', 'url(img/qd3ODGuq.png)');
		}

	})

});
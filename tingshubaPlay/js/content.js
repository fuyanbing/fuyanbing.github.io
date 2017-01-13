$(function () {
	
	//页面初始化/////////////////////////////
	$(".titleL").height($(window).height());
	$(".contentR").height($(window).height());
	var lis=$(".titleL li");
	var showHide=$(".showHide");
	lis.click(function () {
		lis.removeClass();
		$(this).addClass("titleLCfouse");
		showHide.eq(lis.index(this)).show().siblings().hide();
		$("#contentR").scrollTop(0);
	});
	$(".titleL li:first").click();
	///////////////////////////////////////////////
	
	var ua = navigator.userAgent.toLowerCase();	
	if(/iphone|ipad|ipod/.test(ua)) {
		//微信弹出层
		$( "#dialog,#dialog01" ).dialog({
			autoOpen: false,
			modal: true,
			show: {
				effect: "blind",
				duration: 500
			},
			hide: {
				effect: "blind",
				duration: 500
			}
		});
	}
	$( ".tDownload a" ).click(function() {
		//第一步判断是否是苹果手机
		var ua = navigator.userAgent.toLowerCase();	
		if(/iphone|ipad|ipod/.test(ua)) {
			//第二步判断是否是苹果版微信，若是则只能长按复制
			if (ua.match(/MicroMessenger/i)=="micromessenger") {
				$( "#dialog" ).dialog( "open" );
			} else{
				//第二步判断若不是苹果微信内置浏览器，则可直接打开APP，或者去下载
				$( "#dialog01" ).dialog( "open" );
				window.location.href="WCFriend://";
				setTimeout(function() {
					$( "#dialog01" ).dialog( "close" );
				},15000);
			}
			return false;
		}
	});
})
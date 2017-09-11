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
	

	//声明标识确认微信还是苹果
	var ua = navigator.userAgent.toLowerCase();
	var pingguo = false;
	var weixin = false;
	if(/iphone|ipad|ipod/.test(ua)) {
		pingguo = true;
	}
	if(ua.match(/MicroMessenger/i)=="micromessenger") {
		weixin = true;
	}
	
	if(pingguo) {
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
	
	
	//下载按钮触发的事件
	$( ".tDownload a" ).click(function() {
		//如果是苹果版微信，弹出红色复制
		if (weixin && pingguo) {
			$( "#dialog" ).dialog( "open" );
			
			return false;
		//如果是苹果手机，掌中校园等弹出去苹果商店
		} else if(pingguo){
			$( "#dialog01" ).dialog( "open" );
			window.open("WCFriend://","_self");
			setTimeout(function() {
				$( "#dialog01" ).dialog( "close" );
			},15000);
			
			return false;
		//如果是微信打开此网页弹出遮罩层
		} else if(weixin){
			$(".wenxinLayer").show();
			
		}
	});
	
	//关闭微信遮罩层
	$(".wenxinLayer").click(function () {
		$(this).hide();
	})
})
$(function () {
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

	
var ua = navigator.userAgent.toLowerCase();	
if(/iphone|ipad|ipod/.test(ua)) {
	$( ".tDownload a" ).attr("href","WCFriend://")
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
			//window.location.href="WCFriend://";
//			window.open('WCFriend://', '_blank');
			setTimeout(function() {
				$( "#dialog01" ).dialog( "close" );
			},15000);
		}
		//return false;
	}
});	
	

})

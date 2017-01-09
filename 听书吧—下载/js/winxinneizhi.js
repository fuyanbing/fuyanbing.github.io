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
	
})

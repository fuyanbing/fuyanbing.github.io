export const normalTime = (time) => {
	if(time){
		var oDate = new Date();
		oDate.setTime(time);
		
		var y = oDate.getFullYear();
		var m = oDate.getMonth();
		var d = oDate.getDay();
		var h = oDate.getHours();
		var mm = oDate.getMinutes();
		var s = oDate.getSeconds();
		retue y+'-'+m+'-'+d+' '+h+':'+mm+':'+s;
	}
}

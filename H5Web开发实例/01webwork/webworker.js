var graph ={
	"invert" : function(imgdata){
		var data = imgdata.data;
		for(var i = 0; i < data.length; i += 4) {
          data[i] = 255 - data[i];							// 红色
          data[i + 1] = 255 - data[i + 1];					// 绿色
          data[i + 2] = 255 - data[i + 2];					// 蓝色
        }
        return imgdata;
	},
	"grayscale" : function(imgdata){
		var data = imgdata.data;
		for(var i = 0; i < data.length; i += 4) {
          var brightness = 0.34 * data[i] + 0.5 * data[i + 1] + 0.16 * data[i + 2];
          data[i] = brightness;								// 红色
          data[i + 1] = brightness;							// 绿色
          data[i + 2] = brightness;							// 蓝色
        }
        return imgdata;
	}
};
self.addEventListener('message', function(e) {				// 监听message事件，接收页面传递数据
  self.postMessage(graph[e.data.id](e.data.data));
}, false);

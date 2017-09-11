var start_time, // 点击开始时间
	time_spend, // 时差（毫秒）
	time_stop = 0, // 停顿时的时差（毫秒）
	interval; // 轮询变量
function runtime() { // 计算时差，返回指定格式时间hh:MM:ss:SSS
	time_spend = (new Date() - start_time + time_stop) || 0; // 时差，默认为0
	var hour,
		minute,
		second,
		millisecond,
		temp_time_spend = time_spend; // 临时变量，存放是差值
	millisecond = temp_time_spend % 1000; // 取1000的模获取毫秒
	temp_time_spend = parseInt(temp_time_spend / 1000); // 获取剔除毫秒后的秒
	second = temp_time_spend % 60; // 取60的模获取秒
	temp_time_spend = (temp_time_spend - second) / 60; // 获取剔除秒后的分
	minute = temp_time_spend % 60; // 取60的模获取分
	hour = (temp_time_spend - minute) / 60; // 获取剔除分后的小时
	second = second < 10 ? ('0' + second) : second; // 不足2位补0
	minute = minute < 10 ? ('0' + minute) : minute;
	hour = hour < 10 ? ('0' + hour) : hour;
	return [hour, minute, second, millisecond].join(':');
};
onmessage = function(e) { // 监听消息传送，接收数据
	var data = e.data,
		type = data.type;
	if(type == 'start') { // 开始操作
		if(!interval) {
			start_time = new Date();
			interval = setInterval(function() { // 每10毫秒执行一次
				postMessage({
					date: runtime()
				}); // 向页面传回计时数据
			}, 10)
		};
	} else if(type == 'stop') { // 暂停操作
		time_stop = time_spend; // 缓存停止时候的时差
		clearInterval(interval);
		interval = null;
	} else if(type == 'reset') { // 复位操作
		time_stop = 0; // 清零时差
		clearInterval(interval);
		interval = null;
		postMessage({
			date: 0
		}); // 向页面传回初始数据
	}
}
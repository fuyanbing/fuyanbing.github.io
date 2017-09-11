function exec(id, callback) { // 模拟订单处理过程
	postMessage({
		id: id,
		msg: id + '订单处理中'
	}) // 向页面传回提示信息
	setTimeout(function() { // 模拟处理时间
		postMessage({
			id: id,
			msg: id + '订单处理完毕'
		}); // 向页订单处理结束信息
		setTimeout(function() {
			callback(id);
		}, 500);
	}, 1000);
};
onmessage = function(e) { // 监听消息传送，接收数据
	var ids = e.data.ids, // 订单数组
		index = 0;

	function execute(i) { // 按数组前后顺序执行订单
		if(ids[i]) {
			exec(ids[i], function() { // 回调函数中索引加1
				execute(++index);
			});
		} else {
			postMessage({
				msg: '所有订单处理完毕'
			}); // 返回页面所有订单处理完毕信息
		};
	};
	execute(index); // 开始处理队列中的订单
}
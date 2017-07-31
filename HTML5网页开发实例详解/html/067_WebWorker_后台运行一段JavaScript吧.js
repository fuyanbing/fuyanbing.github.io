var list = []; // 记录历史数据
function equal(orgin, dest) { // 判断单个对象数据是否相同
	return orgin && orgin.age === dest.age && orgin.name === dest.name && orgin.sex === dest.sex;
};

function getData() {
	var xmlhttp = new XMLHttpRequest(); // 获取远端数据
	xmlhttp.onreadystatechange = function() { // 新建XMLHttpRequest实例
		if(xmlhttp.readyState == 4) { // 判断请求是否加载完毕
			if(xmlhttp.status == 200) { // 判断请求是否成功
				var data = JSON.parse(xmlhttp.responseText), // 将获取对象解析为JSON
					isSame = true;
				for(var i = 0; i < data.length; i++) { // 循环判断数据是否相同
					isSame = equal(list[i], data[i]);
					if(!isSame) {
						list = data; // 记录返回数据
						postMessage(data); // 返回页面数据对象
						break;
					};
				};
				setTimeout(getData, 1500) // 1500毫秒后重新请求
			}
		}
	}; // 异步请求远端数据
	xmlhttp.open("GET", '003.data.json?data=' + new Date().getTime(), true);
	xmlhttp.send(); // 发送请求
};
getData();
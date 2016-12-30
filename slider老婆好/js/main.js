//定义一个JSON对象，保存分类的照片
var images = {
	'小老婆':[
		'小老婆01.jpg',
		'小老婆02.jpg',
		'小老婆03.jpg',
		'小老婆04.jpg',
		'小老婆05.jpg',
		'小老婆06.jpg',
		'小老婆07.jpg',
		'小老婆08.jpg',
		'小老婆09.jpg',
		'小老婆10.jpg',
		'小老婆11.jpg',
		'小老婆12.jpg',
		'小老婆13.jpg',
		'小老婆14.jpg',
		'小老婆15.jpg',
		'小老婆16.jpg'
	],
	'大老婆':[
		'大老婆01.jpg',
		'大老婆02.jpg',
		'大老婆03.jpg',
		'大老婆04.jpg',
		'大老婆05.jpg',
		'大老婆06.jpg',
		'大老婆07.jpg',
		'大老婆08.jpg',
		'大老婆09.jpg',
		'大老婆10.jpg',
		'大老婆11.jpg',
		'大老婆12.jpg',
		'大老婆13.jpg',
		'大老婆14.jpg',
		'大老婆15.jpg',
		'大老婆16.jpg'
	],
	'宝宝':[
		'宝宝01.jpg',
		'宝宝02.jpg',
		'宝宝03.jpg',
		'宝宝04.jpg',
		'宝宝05.jpg'
	],
	'老婆母校':[
		'老婆母校01.jpg',
		'老婆母校02.jpg',
		'老婆母校03.jpg',
		'老婆母校04.jpg',
		'老婆母校05.jpg',
		'老婆母校06.jpg',
		'老婆母校07.jpg',
		'老婆母校08.jpg',
		'老婆母校09.jpg',
		'老婆母校10.jpg',
		'老婆母校11.jpg',
		'老婆母校13.jpg',
		'老婆母校14.jpg',
		'老婆母校15.jpg',
		'老婆母校16.jpg',
		'老婆母校17.jpg',
		'老婆母校18.jpg',
		'老婆母校19.jpg',
		'老婆母校20.jpg'
	]
}
//页面加载完成后,执行此代码
$(function () {
	var slider = window.slider = new Slider("#slider").setDuration(3000).stop();
	//设置幻灯片的大小
	slider.setSize(450,600);
	//定义一个转场数组
	var transitions=['squares','cricles','circle','diamond','verticalSunblind','verticalOpen','clock','horizontalOpen','horizontalSunblind','transition-flip','transition-left','transition-zoomout'];
	//使用setInterval定时设置每隔5秒随机更改转场效果
	setInterval(function () {
		//随机获取转场效果名称
		var transition = transitions[Math.floor(Math.random()*transitions.length)];
		if (SliderTransitionFunctions[transition])
			//设置Canvas转场效果
			slider.setTransitionFunction(SliderTransitionFunctions[transition]);
			//设置CSS转场效果
		else slider.setTransition(transition);
	},5000);
	//开始加载并播放图像
	$('#gallery').gallery();
});

//jQuery的实例扩展
$.fn.gallery = function () {
	//获取该实例的调用对象
	var self = this;
	//保存图像列表
	var setimgs;
	//保存JSON图像信息的数组
	var data=[];
	//使用jQuery的each方法，对$('#gallery')进行循环，仅执行一次
	this.each(function () {
		var g=this;
		//定义一个load_sets方法加载图片分类和缩略图
		g.load_sets = function (el) {
			//调用jQuery的each方法循环images数组，el指传入的<ul>标签
			$.each(images,function (key,value) {
				//向HTML的ul元素中加入li子元素
				$(el).append('<li><a id="'+key+'" href="#" title="'+key+'">'+key+'</a></li>');
			});
			//使用jQuery的find方法查找每种图片分类
			var sets = $(el).find('li a');
			//统一为每种分类的a元素添加事件处理代码
			$(sets).click(function () {
				//获取链接的id属性值
				var set = $(this).attr('id');
				//根据id属性得到图片集数组
				g.setimgs = images[set];
				//清除缩略图子元素
				$(g).find('#thumbs').html('');
				//重置图片数组
				data = [];
				//加载缩略图
				g.load_thumbs($(g).find('#thumbs')[0],0);
				//显示加载信息
				$(g).find('#loading').html('正在加载<strong>1</strong> of'+g.setimgs.length+'图片');
			});
			//单击第1个相册分类以便于开始幻灯片播放效果
			sets[0].click();
		}
		
		//加载缩略图，el表示缩略图ul元素，index是缩略图索引
		g.load_thumbs = function (el,index) {
			//向ul追加缩略图li标签
			$(el).append('<li><img id="'+index+'" src="images/'+g.setimgs[index]+'" /></li>');
			//向data数组添加JSON缩略图信息
			data.push({"src":"images/"+g.setimgs[index],"name":g.setimgs[index],"link":"#"});
			//在内存中构建一个Image对象
			var tn = new Image();
			//调用jQuery的load方法异步加载缩略图
			$(tn).load(function () {
				//获取图像对象
				var a = $($(el).find('li')[index]).find('img')[0];
				//加载Image对象中
				$(a).append(this);
				//为<li>标签添加click事件
				$(a).click(function () {
					//获取图片索引值
					var i = $(this).attr('id');
					//调用slider的slider方法播放指定的相片
					slider.slide(i);
					return false;
				});
				//如果当前索引值小于图片组总长度
				if ((index+1)<g.setimgs.length) {
					//递归调用load_thumbs加载图像
					g.load_thumbs(el,(index+1));
					$(g).find('#loading strong').html(index+2);
				} else{
					//如果加载完成则显示成功加载的信息
					$(g).find('#loading').html('已经成功加载<strong>'+g.setimgs.length+'</strong>张图片');
					//此时调用Slider的setPhotos播放JSON数组
					slider.setPhotos(data);
					//跳到第一张相片位置
					slider.slide(0);
				}
			});
			//指定图片的src属性
			tn.src = 'images/'+g.setimgs[index];
		}
		//页面初始化时，加载相册分类和缩略图
		g.load_sets($(g).find('#sets')[0])
	})
}
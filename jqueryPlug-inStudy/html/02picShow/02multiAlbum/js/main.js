//定义一个JSON对象，保存分类的照片
var images = {
	'新西兰风景':[
		'xinxilan01.jpg',
		'xinxilan02.jpg',
		'xinxilan03.jpg',
		'xinxilan04.jpg',
		'xinxilan05.jpg',
		'xinxilan06.jpg',
		'xinxilan07.jpg',
		'xinxilan08.jpg',
		'xinxilan09.jpg',
		'xinxilan10.jpg',
		'xinxilan11.jpg',
		'xinxilan12.jpg'
	],
	'昆虫特写蜻蜓':[
		'qinting01.jpg',
		'qinting02.jpg',
		'qinting03.jpg',
		'qinting04.jpg',
		'qinting05.jpg',
		'qinting06.jpg',
		'qinting07.jpg',
		'qinting08.jpg',
		'qinting09.jpg',
		'qinting10.jpg',
		'qinting11.jpg',
		'qinting12.jpg',
		'qinting13.jpg'
	],
	'军用直升机':[
		'zhishengji01.jpg',
		'zhishengji02.jpg',
		'zhishengji03.jpg',
		'zhishengji04.jpg',
		'zhishengji05.jpg',
		'zhishengji06.jpg',
		'zhishengji07.jpg',
		'zhishengji08.jpg',
		'zhishengji09.jpg',
		'zhishengji10.jpg',
		'zhishengji11.jpg',
		'zhishengji12.jpg',
		'zhishengji13.jpg',
		'zhishengji14.jpg',
		'zhishengji15.jpg',
		'zhishengji16.jpg',
		'zhishengji17.jpg',
		'zhishengji18.jpg',
		'zhishengji19.jpg',
		'zhishengji20.jpg'
	]
}
//页面加载完成后,执行此代码
$(function () {
	var slider = window.slider = new Slider("#slider").setDuration(3000).stop();
	//设置幻灯片的大小
	slider.setSize(800,450);
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
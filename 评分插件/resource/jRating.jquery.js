/************************************************************************
*************************************************************************
@Name :       	jRating - jQuery Plugin
@Revison :    	3.1
@Date : 		13/08/2013
@Author:     	 ALPIXEL - (www.myjqueryplugins.com - www.alpixel.fr)
@License :		 Open Source - MIT License : http://www.opensource.org/licenses/mit-license.php

**************************************************************************
*************************************************************************/
(function($) {
	$.fn.jRating = function(op) {
		var defaults = {
			/** String vars **/
			bigStarsPath : 'resource/stars.png', // 五星大图的相对路径
			smallStarsPath : 'resource/small.png', // 五星小图的相对路径
			phpPath : 'php/jRating.php', // PHP页面的相对路径，在此可以指出任何服务器端脚本页面，比如ASP
			type : 'big', // 呈现类型，可以设置为small或big

			/** Boolean vars **/
			step:false, // 如果设置为true,则一星一星地进行填充
			isDisabled:false, // 如果设置为true，则jRating被禁用
			showRateInfo: true, // 禁止显示评分信息
			canRateAgain : false, // if true, the user could rates {nbRates} times with jRating.. Default, 1 time
			sendRequest: true, // 每次评分时，发送评分结果到服务器

			/** Integer vars **/
			length:5, // 显示五角星的个数
			decimalLength : 0, // 在评分中的二进制位数（即小数点位数）
			rateMax : 20, // 评分最大值
			rateInfosX : -45, // 以像素为单位，当鼠标移动时，信息框的左侧相对位置{提示框}
			rateInfosY : 5, // 以像素为单位，当鼠标移动时，信息框的顶部侧相对位置{提示框}
			nbRates : 1,

			/** 回调函数 Functions **/
			//这两个方法是在与服务器端进行异步的AJAX调用后的回调方法，默认情况下，当完成评分，即单击鼠标左键后，将完成一个到phpPath后台页面的提交，提交成功表示成功评分，则调用onSuccess方法，如果评分失败，则调用onError方法返回失败信息。
			onSuccess : null, // 当评分成功完成时，调用该方法
			onError : null, // 当评分失败时，调用该方法
			onClick: null // Fires when clicking on a star
		};

		if(this.length>0)
		return this.each(function() {
			/*vars*/
			var opts = $.extend(defaults, op),
			newWidth = 0,
			starWidth = 0,
			starHeight = 0,
			bgPath = '',
			hasRated = false,
			globalWidth = 0,
			nbOfRates = opts.nbRates;

			if($(this).hasClass('jDisabled') || opts.isDisabled)
				var jDisabled = true;
			else
				var jDisabled = false;

			getStarWidth();
			$(this).height(starHeight);

			var average = parseFloat($(this).attr('data-average')), // get the average of all rates
			idBox = parseInt($(this).attr('data-id')), // get the id of the box
			widthRatingContainer = starWidth*opts.length, // Width of the Container
			widthColor = average/opts.rateMax*widthRatingContainer, // Width of the color Container

			quotient =
			$('<div>',
			{
				'class' : 'jRatingColor',
				css:{
					width:widthColor
				}
			}).appendTo($(this)),

			average =
			$('<div>',
			{
				'class' : 'jRatingAverage',
				css:{
					width:0,
					top:- starHeight
				}
			}).appendTo($(this)),

			 jstar =
			$('<div>',
			{
				'class' : 'jStar',
				css:{
					width:widthRatingContainer,
					height:starHeight,
					top:- (starHeight*2),
					background: 'url('+bgPath+') repeat-x'
				}
			}).appendTo($(this));


			$(this).css({width: widthRatingContainer,overflow:'hidden',zIndex:1,position:'relative'});

			if(!jDisabled)
			$(this).unbind().bind({
				mouseenter : function(e){
					var realOffsetLeft = findRealLeft(this);
					var relativeX = e.pageX - realOffsetLeft;
					if (opts.showRateInfo)
					var tooltip =
					$('<p>',{
						'class' : 'jRatingInfos',
						html : getNote(relativeX)+' <span class="maxRate">/ '+opts.rateMax+'</span>',
						css : {
							top: (e.pageY + opts.rateInfosY),
							left: (e.pageX + opts.rateInfosX)
						}
					}).appendTo('body').show();
				},
				mouseover : function(e){
					$(this).css('cursor','pointer');
				},
				mouseout : function(){
					$(this).css('cursor','default');
					if(hasRated) average.width(globalWidth);
					else average.width(0);
				},
				mousemove : function(e){
					var realOffsetLeft = findRealLeft(this);
					var relativeX = e.pageX - realOffsetLeft;
					if(opts.step) newWidth = Math.floor(relativeX/starWidth)*starWidth + starWidth;
					else newWidth = relativeX;
					average.width(newWidth);
					if (opts.showRateInfo)
					$("p.jRatingInfos")
					.css({
						left: (e.pageX + opts.rateInfosX)
					})
					.html(getNote(newWidth) +' <span class="maxRate">/ '+opts.rateMax+'</span>');
				},
				mouseleave : function(){
					$("p.jRatingInfos").remove();
				},
				click : function(e){
                    var element = this;

					/*set vars*/
					hasRated = true;
					globalWidth = newWidth;
					nbOfRates--;

					if(!opts.canRateAgain || parseInt(nbOfRates) <= 0) $(this).unbind().css('cursor','default').addClass('jDisabled');

					if (opts.showRateInfo) $("p.jRatingInfos").fadeOut('fast',function(){$(this).remove();});
					e.preventDefault();
					var rate = getNote(newWidth);
					average.width(newWidth);


					/** ONLY FOR THE DEMO, YOU CAN REMOVE THIS CODE **/
						$('.datasSent p').html('<strong>idBox : </strong>'+idBox+'<br /><strong>rate : </strong>'+rate+'<br /><strong>action :</strong> rating');
						$('.serverResponse p').html('<strong>Loading...</strong>');
					/** END ONLY FOR THE DEMO **/

					if(opts.onClick) opts.onClick( element, rate );

					if(opts.sendRequest) {
						$.post(opts.phpPath,{
								idBox : idBox,
								rate : rate,
								action : 'rating'
							},
							function(data) {
								if(!data.error)
								{
									/** ONLY FOR THE DEMO, YOU CAN REMOVE THIS CODE **/
										$('.serverResponse p').html(data.server);
									/** END ONLY FOR THE DEMO **/


									/** Here you can display an alert box,
										or use the jNotify Plugin :) http://www.myqjqueryplugins.com/jNotify
										exemple :	*/
									if(opts.onSuccess) opts.onSuccess( element, rate );
								}
								else
								{

									/** ONLY FOR THE DEMO, YOU CAN REMOVE THIS CODE **/
										$('.serverResponse p').html(data.server);
									/** END ONLY FOR THE DEMO **/

									/** Here you can display an alert box,
										or use the jNotify Plugin :) http://www.myqjqueryplugins.com/jNotify
										exemple :	*/
									if(opts.onError) opts.onError( element, rate );
								}
							},
							'json'
						);
					}

				}
			});

			function getNote(relativeX) {
				var noteBrut = parseFloat((relativeX*100/widthRatingContainer)*parseInt(opts.rateMax)/100);
				var dec=Math.pow(10,parseInt(opts.decimalLength));
				var note = Math.round(noteBrut*dec)/dec;
				return note;
			};

			function getStarWidth(){
				switch(opts.type) {
					case 'small' :
						starWidth = 12; // width of the picture small.png
						starHeight = 10; // height of the picture small.png
						bgPath = opts.smallStarsPath;
					break;
					default :
						starWidth = 23; // width of the picture stars.png
						starHeight = 20; // height of the picture stars.png
						bgPath = opts.bigStarsPath;
				}
			};

			function findRealLeft(obj) {
			  if( !obj ) return 0;
			  return obj.offsetLeft + findRealLeft( obj.offsetParent );
			};
		});

	}
})(jQuery);

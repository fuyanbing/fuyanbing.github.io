$(function() {
	//设置方法宽高
	var winHeight = $(window).height();
	var winWidth = $(window).width() > 720 ? 720 : $(window).width() < 320 ? 320 : $(window).width();
	var margin = parseInt(($(".modal-content").css('margin'))) * 2;
	$(".modal-content").css({
		"width": winWidth - margin,
		"height": winHeight - margin
	});

	/*内容点击时进行相关操作*/
	$(".modal-body li").click(function() {
		var addrTotal = ''; //**存放总地址**//
		var parentFlag = $(this).parent().attr('flag');
		thisAddr = $(this).attr('flag'); /*获取当前点击地址*/
		thisGrade = $(this).attr('grade'); /*获取层级关系*/
		if(thisGrade < 0) { /*判断是否为最后一次*/
			$('.modal-header h4').each(function(index, domEle) {
				var h4Grade = $(domEle).attr('grade');
				if(!!h4Grade) {
					addrTotal = addrTotal + $(domEle).text() + ' ';
				}
			})
			addrTotal = addrTotal + thisAddr;
			$('#resultText').text(addrTotal);
			$('.modal-header h4').eq(0).click();
			$('.modal-header h4').slice(1).text('');
			$('#myModal').modal('hide');
			return
		}
		/*点击li修改对应的h3内容*/
		$('.modal-header h4').eq(thisGrade - 2).text(thisAddr).css('display', 'block').removeClass('cTitle').attr({
			'grade': thisGrade,
			'flag': parentFlag
		});
		/*点击li显示下一个请选择*/
		$('.modal-header h4').eq(thisGrade - 1).addClass('cTitle').text('请选择').attr({
			'flag': thisAddr
		}).show();
		/*点击根据li是根据标识flag判断当前点击的省份或市区县 寻找对应的下一级显示出来  隐藏其他的ul*/
		$('.list-group').each(function(index, domEle) {
			var showUl = $(domEle).attr('flag');
			if(thisAddr == showUl) {
				$(this).show().addClass('animated fadeInRight');
			} else {
				$(this).hide().removeClass('animated fadeInRight');
			}
		});
	})
	/*标题点击时进行相关操作*/
	$('.modal-header h4').click(function() {
		var index = $(this).index();
		var txtFlag = $(this).attr('flag');
		$('.modal-header h4').slice(index + 1).removeClass('cTitle').hide();
		$(this).addClass('cTitle').text('请选择');
		if(index == 0) {
			$('.modal-header h4').each(function(index, domEle) {
				$(domEle).removeAttr('grade');
			});
		}

		$('.list-group').each(function(index, domEle) {
			var showUl = $(domEle).attr('flag');
			if(txtFlag == showUl) {
				$(this).show().addClass('animated fadeInLeft');
			} else {
				$(this).hide().removeClass('animated fadeInLeft');
			}
		});
	})
})
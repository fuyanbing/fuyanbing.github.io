/**
 * 
 */

var getRandomColor = function(){    
  return  '#' +    
    (function(color){    
    return (color +=  '0123456789abcdef'[Math.floor(Math.random()*16)])    
      && (color.length == 6) ?  color : arguments.callee(color);    
  })('');    
} 


var fuc = (function(color) {
	return (color += '0123456789abcdef'[Math.floor(Math.random() * 16)])
			&& (color.length == 6) ? color : arguments.callee(color);
})('');
//Math.floor(Math.random() * 16)随机产生一个0-16之间的数值
//'0123456789abcdef'[Math.floor(Math.random() * 16)]返回字符串中某个值
//arguments.callee(color)如果不满足条件，重新执行条件递加color
//('') ()表示立即调用此函数,''传递一个空字符串
alert(fuc);

var color = [ 0, 0, 0 ];
//声明一个颜色数组
var r1 = Math.round(Math.random() * 3 - 0.5);
//随机产生一个0-2随机数
color[r1] = 15;
//设置颜色数组的某个值为15
var r2 = Math.round(Math.random() * 3 - 0.5);
//再次随机产生一个0-2随机数
while (r2 === r1) {
	r2 = Math.round(Math.random()*3 - 0.5);
}
//如果两个随机值相等就再次随机产生一次
color[r2] = Math.round(Math.random()*16-0.5);
var cl = "#" + color[0].toString(16) + color[1].toString(16) + color[2].toString(16);

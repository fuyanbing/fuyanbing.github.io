//entry.js
require('../css/index.css');//引入css文件

var demo1=require('../js/demo1.js');
var demo2=require('../js/demo2.js')

demo1.init();
demo2.init();

var oImg = new Image();
oImg.src = require('../img/nowork.gif');
document.body.appendChild(oImg);

console.log('1234')
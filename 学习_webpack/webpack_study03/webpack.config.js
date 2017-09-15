var path = require('path');
var HtmlwebpackPlugin = require('html-webpack-plugin');

//定义了一些文件夹路径
var ROOT_PATH = path.resolve(__dirname);
var APP_PATH = path.resolve(ROOT_PATH,'app');
var BUILD_PATH = path.resolve(ROOT_PATH,'build');

module.exports={
	//项目的文件夹，可以直接用文件夹名称 默认会找到index.js 也可以确定是哪个文件名字
	entry:APP_PATH,
	
	//输出的文件名 合并以后的js会命名为bundle.js
	output:{
		path:BUILD_PATH,
		filename:'bundle.js'
	},
	
	devServer:{
		historyApiFallback:true,
		hot:true,
		inline:true,
		contentBase:"./app"//本地服务器所加载的页面所在的目录
	},
	
	module:{
		rules:[
			{
				test:/\.css$/,
				use:[
					{
						loader:"style-loader"
					},{
						loader:"css-loader",
						options:{
							modules:true
						}
					}
				]
			}
		]
	},
	
	//添加插件 会自动生成一个html文件
	plugins:[
		new HtmlwebpackPlugin({
			title:'Hello World app'
		})
	]
	
}

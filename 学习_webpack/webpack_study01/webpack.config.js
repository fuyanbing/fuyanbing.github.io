var webpack = require('webpack')
var path = require('path')
module.exports = {
	entry:{
		app:[path.join(__dirname,'src','index.js'),
			'webpack-dev-server/client?http://localhost:7000/'
		]
	},
	output:{
		filename:'bundle.js',
		path:path.join(__dirname,'dist')
	},
	plugins:[
		new webpack.HotModuleReplacementPlugin()
	],
	devServer:{
		contentBase:path.join(__dirname,"dist"),
		port:7000,
//		host:'127.0.0.0' 
		historyApiFallback:{
			rewrites:[
				{from:/./,to:'./404.html'}
			]
		},/*这个配置属性是用来应对返回404页面时定向到特定页面用的*/
		overlay:true,/*这个配置属性用来在编译出错的时候，在浏览器页面上显示错误，默认是false*/
		stats:"errors-only",/*stats: "errors-only"表示只打印错误：*/
		inline:true,
		hot:true,
	}
}

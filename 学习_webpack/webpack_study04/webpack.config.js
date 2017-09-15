//webpack.config.js
module.exports = {
	entry:'./src/js/entry.js',//入口文件
	output:{//输出文件
		filename:'index.js',//输出文件名
		publicPath:'/webpack_study04/out',//添加静态资源，否则会出现路径错误
		path:__dirname + '/out'//输出文件路径
	},
	module:{
		rules:[
			{
				test:/\.js$/,
				use:['babel-loader']
			},{
				test:/\.css$/,
				use:['style-loader','css-loader']
			},{
				test:/.(jpg|png|gif|svg)$/,
				use:['url-loader?limit=8192&name=/[name].[ext]']
			},{
				test:/.less$/,
				use:['style-loader','css-loader','less-loader']
			}
			
		]
	}
}

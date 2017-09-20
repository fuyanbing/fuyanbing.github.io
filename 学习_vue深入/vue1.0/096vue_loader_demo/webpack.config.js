var webpack = require('webpack');
module.exports={
	entry:'./index.js',
	
	output:{
		path:__dirname,
		filename:'build.js'
	},
	
	module:{
		rules:[
			{
				test:/\.vue$/,
				use:'vue-loader'
			},{
				test:/\.js$/,
				use:{
					loader:"babel-loader"
				},
				exclude:/node_modules/
			},
		]
	}, 
	
	resolve: { 
		alias: { 
			'vue': 'vue/dist/vue.js' 
		} 
	}
};

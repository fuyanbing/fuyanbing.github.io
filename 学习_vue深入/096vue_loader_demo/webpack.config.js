var webpack = require('webpack');
module.exports={
	entry:'./main.js',
	
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
					loader:"babel-loader",
					options: {
                        presets: ["es2015"],
                        plugins:['transform-runtime']
                    }
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

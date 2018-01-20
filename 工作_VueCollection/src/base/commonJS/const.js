let dev = {
	interconnection: '/api/api-interconnection/', //互联
	aliyunoss:	'/api/api-aliyunoss/', //上传图片
},
pro = {
	interconnection: '/api/api-interconnection/', //互联
	aliyunoss:	'/api/api-aliyunoss/', //上传图片
}
export default process.env.NODE_ENV === 'production' ? pro : dev
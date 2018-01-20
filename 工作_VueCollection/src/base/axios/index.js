import Vue from 'vue'
import Axios from 'axios'
import VueAxios from 'vue-axios'
import Qs from 'qs'
let baseURL = process.env.NODE_ENV === 'production' ? 'http://192.168.1.150:8080' : ''

//处理返回过来的数据
function formatIsChecked(data) {
    //处理返回的数据
    return data
}

let axios = Axios.create({
	baseURL:baseURL,
    transformRequest(data){
      	/*if (!los.get("USER_INFO")) {
			alert("您还没有登录！请先登录！")
			return
		}*/
    	if (!data) {
    		data={}
    	} else{
    		for (let i in data) {
    			if (typeof (data[i]) == 'object') {
    				data[i] = JSON.stringify(data[i])
    			}
    		}
    	}
    	data.accessToken = "aaa" || los.get("USER_INFO").accessToken || "aaa"
        data = Qs.stringify(data);
        return data;
    }
})
//添加请求拦截器
axios.interceptors.request.use(function (config) {
    return config;
}, function (error) {
    // return alert("网络繁忙,请您稍后再试");
});

//直接返回数据层级 
axios.interceptors.response.use(function (response) {
    // 转化isChecked
    response = formatIsChecked(response.data)
    //console.log(response)
    return response;
}, function (error) {
    // return alert("网络繁忙,请您稍后再试");
})

Vue.use(VueAxios,axios)

export default axios

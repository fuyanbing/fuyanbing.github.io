import Vue from 'vue'
import App from './App.vue'

//引入loading文件夹
import Loading from './components/loading'

//使用Loading
Vue.use(Loading)

new Vue({
  el: '#app',
  render: h => h(App)
})

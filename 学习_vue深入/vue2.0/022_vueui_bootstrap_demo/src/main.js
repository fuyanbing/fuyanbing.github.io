import Vue from 'vue'
import App from './App.vue'

//引入css模块
import './bower_components/bootstrap/dist/css/bootstrap.min.css'
import './custom.css'

//引入bootstrap依赖js
import './bower_components/bootstrap/dist/js/bootstrap.min.js'

require('./jqGreen.js');
$('#green').green()


new Vue({
  el: '#app',
  render: h => h(App)
})

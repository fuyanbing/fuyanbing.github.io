import Vue from 'vue'
import App from './App.vue'

import router from './routers.js'

const app = new Vue({
  router: router,
  render: h => h(App)
}).$mount('#aaa')
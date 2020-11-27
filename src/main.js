import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import moment from 'moment'
import axios from 'axios'
import qs from 'qs'
//导入vant的所有组件
import Vant from 'vant'
//导入vant的样式文件
import 'vant/lib/index.css'
//通过Vue()方法将vant注册为Vue的插件
Vue.use(Vant)

//导入MintUI的所有组件
import MintUI from 'mint-ui'
//导入MintUI的样式文件
import 'mint-ui/lib/style.min.css'
//通过Vue.use()方法将Mint UI注册为Vue的插件
Vue.use(MintUI)

axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.prototype.axios = axios;
Vue.prototype.moment=moment;
Vue.prototype.qs=qs;
Vue.config.productionTip = false




new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

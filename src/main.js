//Call External Libraries
import Vue from 'vue'
import VueRouter from 'vue-router'
import axios from 'axios'
import VueAxios from 'vue-axios'
import vSelect from 'vue-select'
import BootstrapVue from 'bootstrap-vue'

//Main Template
import App from './App.vue'

//Service Setup
import store from './store'

// router setup
import router from './routes/routes'

// LightBootstrap plugin
import LightBootstrap from './light-bootstrap-main'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

//Other Things
import './registerServiceWorker'
import FlashMessage from '@smartweb/vue-flash-message';

//Create Objects
Vue.use(VueAxios, axios)
Vue.use(VueRouter)
Vue.use(LightBootstrap)
Vue.use(BootstrapVue)
Vue.use(FlashMessage);
Vue.component('v-select', vSelect)

//Authontication Actions
//Vue.prototype.$http = axios;
const token = localStorage.getItem('token')
if (token) {
  Vue.prototype.$http.defaults.headers.common['Authorization'] = token
}

//Make VUE object with routes and store
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App),
})

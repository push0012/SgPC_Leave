import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
import store from './store'
//import routers from './routes/routes'
import axios from 'axios'
import VueAxios from 'vue-axios'
import vSelect from 'vue-select'
import BootstrapVue from 'bootstrap-vue'
// LightBootstrap plugin
import LightBootstrap from './light-bootstrap-main'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
// router setup
import routes from './routes/routes'
import './registerServiceWorker'
import FlashMessage from '@smartweb/vue-flash-message';


Vue.use(FlashMessage);


// plugin setup
Vue.use(VueAxios, axios)
Vue.use(VueRouter)
//Vue.use(router)
//Vue.use(Store)
Vue.use(LightBootstrap)
Vue.use(BootstrapVue)
Vue.component('v-select', vSelect)

// configure router
const router = new VueRouter({
  routes,
  linkActiveClass: 'nav-item active',
  scrollBehavior: (to) => {
    if (to.hash) {
      return {selector: to.hash}
    } else {
      return { x: 0, y: 0 }
    }
  }
})

//Vue.prototype.$http = axios;
const token = localStorage.getItem('token')
if (token) {
  Vue.prototype.$http.defaults.headers.common['Authorization'] = token
}

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App),
})

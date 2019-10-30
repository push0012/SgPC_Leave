import Vue from 'vue'
import VueRouter from 'vue-router'
import store from '../store'

//import Login class
import Login from 'src/pages/Login.vue'

//import Main Templte
import DashboardLayout from '../layout/DashboardLayout.vue'

// GeneralViews 
import NotFound from '../pages/NotFoundPage.vue'

//import Admin pages
import Overview from 'src/pages/Overview.vue'
import UserProfile from 'src/pages/UserProfile.vue'
import TableList from 'src/pages/TableList.vue'
import Typography from 'src/pages/Typography.vue'
import Icons from 'src/pages/Icons.vue'
import Administrator from 'src/pages/Administrator.vue'
import Notifications from 'src/pages/Notifications.vue'
import Upgrade from 'src/pages/Upgrade.vue'
import CreateUser from 'src/pages/CreateUser.vue'
import CreateEmployee from 'src/pages/CreateEmployee.vue'
import ListEmployee from 'src/pages/ListEmployee.vue'
import EditEmployee from 'src/pages/EditEmployee.vue'

//Create Object
Vue.use(VueRouter)

//Define Vue Router object and routes
const router = new VueRouter({
  mode: 'hash',
  routes: [
  {
    path: '/',
    component: Login,
  },
  {
    path: '/admin',
    component: DashboardLayout,
    redirect: '/admin/overview',
    meta : {
      requiresAuth: true
    },
    children: [
      {
        path: 'overview',
        name: 'Overview',
        component: Overview,
        
      },
      {
        path: 'user',
        name: 'User',
        component: UserProfile
      },
      {
        path: 'admin/user/create',
        name: 'Admin/user/create',
        component: CreateUser
      },
      {
        path: 'admin/employee/create',
        name: 'Admin/employee/create',
        component: CreateEmployee
      },
      {
        path: 'admin/employee/list',
        name: 'Admin/employee/list',
        component: ListEmployee
      },
      {
        path: 'admin/employee/edit',
        name: 'Admin/employee/edit',
        component: EditEmployee
      },
      {
        path: 'table-list',
        name: 'Table List',
        component: TableList
      },
      {
        path: 'typography',
        name: 'Typography',
        component: Typography
      },
      {
        path: 'icons',
        name: 'Icons',
        component: Icons
      },
      {
        path: 'admin',
        name: 'Admin',
        component: Administrator
      },
      {
        path: 'notifications',
        name: 'Notifications',
        component: Notifications
      },
      {
        path: 'upgrade',
        name: 'Upgrade to PRO',
        component: Upgrade
      }
    ]
  },
  { path: '*', component: NotFound }
],

//some css patterns
  linkActiveClass: 'nav-item active',
  scrollBehavior: (to) => {
    if (to.hash) {
      return {selector: to.hash}
    } else {
      return { x: 0, y: 0 }
    }
  }
})

//Check Authontication with token and store settings
router.beforeEach((to, from, next) => {
  if(to.matched.some(record => record.meta.requiresAuth)) {
    if (store.getters.isLoggedIn) {
      
      next()
      console.log('comes Here too')
      return
    }
    next('/') 
    console.log('comes Here')
  } else {
    if (to.fullPath === '/') {
      next('/admin/overview');
      console.log('comes Here three')
    }else{
    next() 
    console.log('comes Here four')
    }
  }
})

//Return Router object
export default router
import Vue from 'vue'
import VueRouter from 'vue-router'
import DashboardLayout from '../layout/DashboardLayout.vue'
// GeneralViews
import NotFound from '../pages/NotFoundPage.vue'
//import store from './store.js'
// Admin pages
import Login from 'src/pages/Login.vue'
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
/*
Vue.use(VueRouter)

const router = new VueRouter({
  mode: 'history',*/
  const routes = [
  {
    path: '/',
    component: Login,
    
  },
  {
    path: '/admin',
    component: DashboardLayout,
    redirect: '/admin/overview',
    children: [
      {
        path: 'overview',
        name: 'Overview',
        component: Overview,
        meta: { 
          requiresAuth: true
        }
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
]
  /*linkActiveClass: 'nav-item active',
  scrollBehavior: (to) => {
    if (to.hash) {
      return {selector: to.hash}
    } else {
      return { x: 0, y: 0 }
    }
  }*/
//})
// short for routes: routes
  
/*
router.beforeEach((to, from, next) => {
  if(to.matched.some(record => record.meta.requiresAuth)) {
    if (this.$store.getters.isLoggedIn) {
      next()
      return
    }
    next('/login') 
  } else {
    next() 
  }
})*/

export default routes

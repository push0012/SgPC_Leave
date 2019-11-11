import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import { runInThisContext } from 'vm'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    status: '',
    token: localStorage.getItem('access_token') || '',
    user : []
    
    //data: []
  },
  mutations: {
    auth_request(state){
        state.status = 'loading'
      },
      auth_success(state, [token, user]){
        state.status = 'success'
        state.token = token
        state.user = user
      },
      auth_error(state){
        state.status = 'error'
      },
      logout(state){
        state.status = ''
        state.token = ''
      },
  },
  actions: {
    login({commit}, user){
        commit('auth_request')
        return new Promise((resolve, reject) => {
        var data = {
            client_id: 2,
            client_secret: '0T5mVqn15v5hbW52XG5GeWh4G6CltWFyxbhc60Ge',
            grant_type:'password',
            username: user.email,
            password: user.password,
            scope: user.scopes
        }
        
        axios.post(process.env.VUE_APP_BASEURL + '/oauth/token', data)
        .then(resp => {
          
          const accesstoken = resp.data.access_token
          const refreshtoken = resp.data.refresh_token
          localStorage.setItem('access_token', accesstoken)
          localStorage.setItem('refresh_token', refreshtoken)
          localStorage.setItem('scopes', user.scopes)
          localStorage.setItem('username', user.email)
          axios.defaults.headers.common['Authorization'] = accesstoken
          commit('auth_success', [accesstoken, user])
          resolve(resp)
        })
        .catch(err => {
          commit('auth_error')
          localStorage.removeItem('access_token')
          localStorage.removeItem('refresh_token')
          localStorage.removeItem('scopes')
          localStorage.removeItem('username')
          reject(err)
        })
      
    })
  },
    logout({commit}){
      return new Promise((resolve, reject) => {
        commit('logout')
        
        localStorage.removeItem('access_token')
        localStorage.removeItem('refresh_token')
        localStorage.removeItem('scopes')
        localStorage.removeItem('username')
        delete axios.defaults.headers.common['Authorization']
        resolve()
      })
    },
  },
  getters : {
    isLoggedIn: state => !!state.token,
    authStatus: state => state.user,
  }
})
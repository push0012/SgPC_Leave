<template>
<div>
         
  <nav class="navbar navbar-expand-lg">
   
    <div class="container-fluid">
        
      <a class="navbar-brand" href="#/admin/overview">Dashboard</a>
      <button type="button"
              class="navbar-toggler navbar-toggler-right"
              :class="{toggled: $sidebar.showSidebar}"
              aria-controls="navigation-index"
              aria-expanded="false"
              aria-label="Toggle navigation"
              @click="toggleSidebar">
        <span class="navbar-toggler-bar burger-lines"></span>
        <span class="navbar-toggler-bar burger-lines"></span>
        <span class="navbar-toggler-bar burger-lines"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-end">
        <ul class="nav navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="dropdown">
              <i class="nc-icon nc-palette"></i>
            </a>
          </li>
          <base-dropdown tag="li">
            <template slot="title">
              <i class="nc-icon nc-planet"></i>
              <b class="caret"></b>
              <span class="notification">7</span>
            </template>
            <a class="dropdown-item" href="#">Notification 1</a>
            <a class="dropdown-item" href="#">Notification 2</a>
            <a class="dropdown-item" href="#">Notification 3</a>
            <a class="dropdown-item" href="#">Notification 4</a>
            <a class="dropdown-item" href="#">Another notification</a>
          </base-dropdown>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nc-icon nc-zoom-split"></i>
              <span class="d-lg-block">&nbsp;Search</span>
            </a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="#">
              Account
            </a>
          </li>
          <base-dropdown title="Dropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something</a>
            <a class="dropdown-item" href="#">Another action</a>
            <a class="dropdown-item" href="#">Something</a>
            <div class="divider"></div>
            <a class="dropdown-item" href="#">Separated link</a>
          </base-dropdown>
          <li class="nav-item">
            {{username.email}}
          </li>
          <li class="nav-item">
            <span v-if="isLoggedIn">
              <a href="#" class="nav-link" @click="logout">
                Log out
              </a>
            </span>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  </div>
</template>
<script>
  import Vue from 'vue';
  import Loading from 'vue-loading-overlay';
  import 'vue-loading-overlay/dist/vue-loading.css';
  Vue.use(Loading);
  export default {
     components: {
     // Loading
    },
    computed: {
      routeName () {
        const {name} = this.$route
        return this.capitalizeFirstLetter(name)
      },
      isLoggedIn : function(){ return this.$store.getters.isLoggedIn}
    },
    data () {
      return {
        username: '',
        fullPage: false,
        activeNotifications: false
      }
    },
    mounted(){
      this.username = this.$store.getters.authStatus
    },
    methods: {
      capitalizeFirstLetter (string) {
        return string.charAt(0).toUpperCase() + string.slice(1)
      },
      toggleNotificationDropDown () {
        this.activeNotifications = !this.activeNotifications
      },
      closeDropDown () {
        this.activeNotifications = false
      },
      toggleSidebar () {
        this.$sidebar.displaySidebar(!this.$sidebar.showSidebar)
      },
      hideSidebar () {
        this.$sidebar.displaySidebar(false)
      },
      logout: function () {
        /*let loader = this.$loading.show({
          container: this.fullPage ? null : this.$refs.formContainer,
          color: 'blue',
          loader:'bars',
          transition: 'fade',
        });
        setTimeout(() => {
          loader.hide()*/
          this.$store.dispatch('logout')
            .then(() => {
              this.$router.push('/')
            })
       /* },2*2000) 
*/
      }
    }
  }
  
</script>
<style>

</style>

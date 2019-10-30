<template>
  <ul class="nav nav-mobile-menu">
    <base-dropdown>
      <template slot="title">
        <i class="fa fa-globe"></i>
        <b class="caret"></b>
        <span class="notification">5 Notifications</span>
      </template>
      <a class="dropdown-item" href="#">Notification 1</a>
      <a class="dropdown-item" href="#">Notification 2</a>
      <a class="dropdown-item" href="#">Notification 3</a>
      <a class="dropdown-item" href="#">Notification 4</a>
      <a class="dropdown-item" href="#">Another notification</a>
    </base-dropdown>
    <li class="nav-item">
      <a href="#" class="nav-link">
        <i class="nc-icon nc-zoom-split hidden-lg-up"></i>
        <span class="d-lg-none">Search</span>
      </a>
    </li>
    <base-dropdown title="Dropdown">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </base-dropdown>

    <li class="nav-item">
      <a href="#" class="nav-link" @click="logout">
        <span class="no-icon">Log out</span>
      </a>
    </li>
  </ul>
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
    data () {
      return {
        //isLoading: false,
        fullPage: false,
      }
    },
    methods:{
      logout: function () {
                let loader = this.$loading.show({
                  // Optional parameters
                  container: this.fullPage ? null : this.$refs.formContainer,
                  color: 'blue',
                  loader:'spinner',
                  transition: 'fade',
                });
                setTimeout(() => {
                  loader.hide()
                  this.$store.dispatch('logout')
                    .then(() => {
                  this.$router.push('/')
                    })
                },5000) 

            /*this.isLoading = true;
            setTimeout(() => {
            this.isLoading = false
            },2*2000)*/
      }
    }
  }
</script>
<style>
</style>

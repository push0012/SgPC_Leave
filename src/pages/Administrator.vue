<template>
  <div class="content">
    <div class="container-fluid">
      <div class="row">

        <div class="col-xl-3 col-md-6" v-if="scopes.includes('create') == true">
          <a href="#/admin/admin/user/create" >
          <stats-card>
            <div slot="header" class="icon-warning">
              <i class="nc-icon nc-single-02 text-warning"></i>
            </div>
            <div slot="content">
              <h3 class="card-title">{{ loading.users }}</h3>
              <p class="card-category">Registered</p>
            </div>
            <div slot="footer">
              <p class="card-category">Employee Creation</p>
            </div>
          </stats-card>
          </a>
        </div>
        <div class="col-xl-3 col-md-6">
          <a href="#/admin/admin/employee/list">
          <stats-card>
            <div slot="header" class="icon-warning">
              <i class="fa fa-users text-info"></i>
            </div>
            <div slot="content">
              <h3 class="card-title">{{ loading.users }}</h3>
              <p class="card-category">Registered</p>
            </div>
            <div slot="footer">
              <p class="card-category">View Employees</p>
            </div>
          </stats-card>
          </a>
        </div>


      </div>
    </div>
  </div>
</template>
<script>
  import ChartCard from 'src/components/Cards/ChartCard.vue'
  import StatsCard from 'src/components/Cards/StatsCard.vue'
  import LTable from 'src/components/Table.vue'
  const axios = require('axios');
  export default {
    components: {
      LTable,
      ChartCard,
      StatsCard
    },
    mounted(){
      this.loadData();
      this.scopes = localStorage.getItem('scopes');
    },
    data () {
      return {
        scopes: [],
        loading: {
          users:''
          }
      }
    },
    methods: {
      loadData(){
      axios.get(process.env.VUE_APP_BASEURL + '/users'
            ).then((response) => {
              this.loading.users = response.data;
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      }
    }
  }
</script>
<style>
</style>

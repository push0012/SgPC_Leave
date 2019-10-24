<template>
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <card class="strpied-tabled-with-hover"
                body-classes="table-full-width table-responsive"
          >
            <template slot="header">
              <h4 class="card-title">Registered Employees</h4>
              <p class="card-category">Here is a subtitle for this table</p>
            </template>
            <l-table class="table-hover table-striped"
                     :columns="table1.columns"
                     :data="table1.data" :page="table1.page">
            </l-table>
          </card>

        </div>
        </div>
    </div>
  </div>
</template>
<script>
  import LTable from 'src/components/Table.vue'
  import Card from 'src/components/Cards/Card.vue'
  const axios = require('axios');
  const tableColumns = ['Title', 'Name', 'Sex', 'NIC', 'Mobile', 'Email', 'Joined Date']
  export default {
    components: {
      LTable,
      Card
    },
    mounted(){
        this.loadData();
    },
    data () {
      return {
        table1: {
          columns: [...tableColumns],
          data: [{
            }],
          page:'employee'
        }
      }
    },
    methods:{
        loadData(){
           
            axios.get(process.env.VUE_APP_BASEURL + '/employees'              
            ).then((response) => {
              console.log(response.data)
              this.table1.data = response.data;
              
              
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      
        }
    }
  }
</script>
<style>
</style>
<template>
  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <card class="strpied-tabled-with-hover"
                body-classes="table-full-width table-responsive">
            <template slot="header">
              <h4 class="card-title">Leave Count</h4>
              <p class="card-category">Here is a subtitle for this table</p>
            </template>
            <form>
                <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <label >Year</label>
                        <b-form-select v-model="form.year" :options="option_year"></b-form-select>
                    </div>
                    <div class="col-md-3">
                        <label >Month</label>
                        <b-form-select v-model="form.month" :options="option_month" @change="loadMonths()"></b-form-select>
                    </div>
                    <div class="col-md-3">
                    <label>Employee</label>
                        <b-form-select v-model="form.emp_id" :options="option_emp_id">
                        <option v-for="(index, employee) in employees" :key="employee" :value="index.id">
                            {{index.title+' '+ index.name}}
                        </option>
                </b-form-select>
                    </div>
                </div>
                </div>
            </form>
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
  const tableColumns = ['Name', 'Year', 'Month', 'Official Leave', 'Short_Leave', 'Casual_Leave', '', 'Medical_Leave']
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
        },
        employees:'',
        form:{
            year:'',
            month:'',
            employee:''
        },
        option_year:[
           { value: null, text: 'Please select an option', disabled: true },
           { value: '2018', text: '2018' },
            { value: '2019', text: '2019' },
            { value: '2020', text: '2020' },
        ],
        option_month:[
           { value: null, text: 'Please select an option', disabled: true },
           { value : 1, text:'January' },{ value : 2, text:'February' },{ value : 3, text:'March' },
           { value : 4, text:'April' },{ value : 5, text:'May' },{ value : 6, text:'June' },
           { value : 7, text:'July' },{ value : 8, text:'August' },{ value : 9, text:'September' },
           { value : 10, text:'October' },{ value : 11, text:'November' },{ value : 12, text:'December' },
        ],
        option_emp_id: [
          { value: null, text: 'Please select an option', disabled: true },
        ],

      }
    },
    methods:{

        loadData(){
            axios.get(process.env.VUE_APP_BASEURL + '/employees'              
            ).then((response) => {
              console.log(response.data)
              this.employees = response.data;
            }).catch( error => { 
              console.log('error: ' + error); 
            });

            axios.get(process.env.VUE_APP_BASEURL + '/record_months'              
            ).then((response) => {
              console.log(response.data)
              this.table1.data = response.data;
            }).catch( error => { 
              console.log('error: ' + error); 
            });
        },
        loadMonths(){
            axios.get(process.env.VUE_APP_BASEURL + '/record_months/' + this.form.month              
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
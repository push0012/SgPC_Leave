<template>
<div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
  <card>
    <h4 slot="header" class="card-title">Record Month Leaves</h4>
    <form>
        <div class="row">
            <div class="col-md-6">
                <label >Employee</label>
                <b-form-select v-model="month_record.emp_id" :options="option_emp_id">
                    <option v-for="(index, employee) in employees" :key="employee" :value="index.id">
                        {{index.title+' '+ index.name}}
                    </option>
                </b-form-select>
            </div>
            <div class="col-md-3">
                <label >Year</label>
                <b-form-select v-model="month_record.record_year" :options="option_record_year"></b-form-select>
            </div>
            <div class="col-md-3">
                <label>Month</label>
                <b-form-select v-model="month_record.record_month" :options="option_record_month"></b-form-select>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-3">
                <base-input type="text"
                        label="official leaves"
                        placeholder="Official Leaves"
                        v-model="month_record.ol_count">
                </base-input>
            </div>
            <div class="col-md-3">
                <base-input type="text"
                        label="short leaves"
                        placeholder="Short Leaves"
                        v-model="month_record.sl_count">
                </base-input>
            </div>

            <div class="col-md-3">
                <base-input type="text"
                        label="casual leaves"
                        placeholder="Casual Leaves"
                        v-model="month_record.casual_count">
                </base-input>
            </div>
            <div class="col-md-3">
                <base-input type="text"
                        label="medical leaves"
                        placeholder="Medical Leaves"
                        v-model="month_record.medical_count">
                </base-input>
            </div>
        </div>

      <div class="text-center">
        <button type="submit" class="btn btn-info btn-fill float-right" @click.prevent="recordLeave">
          Rerord Leaves
        </button>
        
      </div>

      <div class="clearfix"></div>
    </form>
  </card>

  </div>
  </div>
  </div>
  </div>
</template>
<script>

  import Card from 'src/components/Cards/Card.vue'
  //require('vue-flash-message/dist/vue-flash-message.min.css');
  const axios = require('axios');
  export default {
    components: {
      Card,
    },
    mounted(){
      this.loadData();
        /*this.loadJobs();
        //if (){
          this.employee.email = sessionStorage.getItem('user_email');
          this.employee.user_id = sessionStorage.getItem('user_id');
          sessionStorage.removeItem('user_email');
          sessionStorage.removeItem('user_id');*/
          
        //}
    },
    data () {
      return {
        notifications: {
          topCenter: false
        },
        jobs:'',
        employees:'',
        month_record: {
            emp_id:null,
            record_year:null,
            record_month:null,
            ol_count:'',
            sl_count:'',
            casual_count:'',
            medical_count:'',

        },
        option_emp_id: [
          { value: null, text: 'Please select an option', disabled: true },
          
        ],
        option_record_year: [
          { value: null, text: 'Please select an option', disabled: true },
          {value : 2018, text:'2018'},
          {value : 2019, text:'2019'},
        ],
        option_record_month:[
           { value: null, text: 'Please select an option', disabled: true },
           { value : 1, text:'January' },{ value : 2, text:'February' },{ value : 3, text:'March' },
           { value : 4, text:'April' },{ value : 5, text:'May' },{ value : 6, text:'June' },
           { value : 7, text:'July' },{ value : 8, text:'August' },{ value : 9, text:'September' },
           { value : 10, text:'October' },{ value : 11, text:'November' },{ value : 12, text:'December' },
        ],
        
      }
    },
    methods: {
        loadData(){
            axios.get(process.env.VUE_APP_BASEURL + '/employees'              
            ).then((response) => {
              console.log(response.data)
              this.employees = response.data;
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      
        },
        recordLeave(){
          
        }
    }
  }

</script>
<style>

</style>

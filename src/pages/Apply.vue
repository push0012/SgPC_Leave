<template>
    <div class="content">
        <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
  <card>
    <h4 slot="header" class="card-title">Request Leave Form (Gen. 125)</h4>
    <form>
        <div class="row">
            <div class="col-md-3">
                <label>Leave Type</label>
                <b-form-select v-model="leave.leave_spec" :options="option_leave_type"></b-form-select>
            </div>
            <div class="col-md-3">
                <base-input type="text"
                    label="number of days applied"
                    placeholder="Number of Days Applied"
                    >
                </base-input>
            </div>
            <div class="col-md-3">
                <base-input type="date"
                    label="requesting date"
                    placeholder="Requesting Date"
                    >
                </base-input>
            </div>
            <div class="col-md-3">
                <base-input type="text"
                    label="leave taken for year"
                    placeholder="Leave Taken for Year"
                    :disabled="true"
                    >
                </base-input>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <base-input type="date"
                    label="first appoinment date"
                    :disabled="true"
                   >
                </base-input>
            </div>
            <div class="col-md-4">
              <base-input type="date"
                        label="leave start date"
                        placeholder="Leave Start Date"
                       >
              </base-input>
            </div>
            <div class="col-md-4">
                <base-input type="date"
                        label="leave end date"
                        placeholder="Leave End Date"
                       >
              </base-input>
            </div>
      </div>
      <div class="row">
            <div class="col-md-12">
                <base-input type="text"
                        label="reason"
                        placeholder="Reason for Applying Leave"
                       >
                </base-input>
            </div>
        </div>
      <div class="row">
          <div class="col-md-4">
                <label>Officer Acting</label>
                <b-form-select v-model="leave.emp_act_id" :options="option_acting">
                    <option v-for="(index, acting) in actings" :key="acting" :value="index.emp_id">
                        {{index.title+' '+ index.emp_name}}
                    </option>
                </b-form-select>
            </div>
            <div class="col-md-4">
                <label>Supervising Officer</label>
                <b-form-select v-model="leave.supervising_officer" :options="option_supervising">
                    <option v-for="(index, supervise) in supervises" :key="supervise" :value="index.emp_id">
                        {{index.title+' '+ index.emp_name}}
                    </option>
                </b-form-select>
            </div>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-info btn-fill float-right" >
          Request Leave
        </button>
      </div>
    </form>
  </card>

  </div>
  </div>
  </div>
    </div>
</template>
<script>
import Loading from 'vue-loading-overlay';
import 'vue-loading-overlay/dist/vue-loading.css';
import Card from 'src/components/Cards/Card.vue'
const axios = require('axios');

  export default {
    components: {
      Card,
      Loading
    },
    mounted(){
      this.loadActing();
      this.loadSupervise();
    },   
    data () {
      return {
        actings:'',
        supervises:'',
        leave:{
          leave_spec:null,
          emp_act_id:null,
          supervising_officer:null
        },
        option_leave_type: [
          { value: null, text: 'Please select...', disabled: true },
          { value: 'casual', text: 'Casual' },
		      { value: 'medical', text: 'Medical' },
		      { value: 'other', text: 'Other' },
        ], 
        option_acting:[
           { value: null, text: 'Please select...', disabled: true },
        ],
        option_supervising:[
           { value: null, text: 'Please select...', disabled: true },
        ]
      }
    },
    methods: {
      loadActing () {
            var username = localStorage.getItem('username') 
            axios.get(process.env.VUE_APP_BASEURL + '/samejob/'+username
            )
            .then((response) => {
              this.actings = response.data;
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      },
      loadSupervise() {
            axios.get(process.env.VUE_APP_BASEURL + '/supervisors')
            .then((response) => {
              this.supervises = response.data;
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      },
    }
  }

</script>
<style>

</style>
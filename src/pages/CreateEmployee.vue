<template>
<div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
  <card>
    <h4 slot="header" class="card-title">Create Employee</h4>
    <form>
        <div class="row">
            <div class="col-md-3">
                <label >Title</label>
                <b-form-select v-model="employee.title" :options="option_title"></b-form-select>
            </div>
            <div class="col-md-6">
            <base-input type="text"
                        label="Name"
                        placeholder="Name"
                        v-model="employee.name">
            </base-input>
            </div>
            <div class="col-md-3">
              <label>Sex</label>
                <b-form-select v-model="employee.sex" :options="option_sex"></b-form-select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <base-input type="text"
                        label="Nic"
                        placeholder="NIC"
                        v-model="employee.nic">
                </base-input>
            </div>
            <div class="col-md-3">
                <base-input type="text"
                    label="Mobile"
                    placeholder="Mobile"
                    v-model="employee.mobile">
                </base-input>
            </div>
            <div class="col-md-6">
                <base-input type="email"
                    label="Email"
                    :disabled="true"
                    placeholder="Email"
                    v-model="employee.email">
                </base-input>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
              <base-input type="date"
                        label="Joined Date"
                        placeholder="Joined Date"
                        v-model="employee.joined_date">
              </base-input>
            </div>
            <div class="col-md-4">
                <label>Probationary</label>
                <b-form-select v-model="employee.nine_month" :options="option_probationary"></b-form-select>
            </div>
            <div class="col-md-4">
                <label>Job Category</label>
                <b-form-select v-model="employee.job_id" :options="option_job">
                    <option v-for="(index, job) in jobs" :key="job" :value="index.job_id">
                        {{ index.job_title}}
                    </option>
                </b-form-select>
            </div>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-info btn-fill float-right" @click.prevent="createEmployee">
          Create Employee
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
    const axios = require('axios');
  export default {
    components: {
      Card
    },
    mounted(){
        this.loadJobs();
        //if (){
          this.employee.email = sessionStorage.getItem('user_email');
          this.employee.user_id = sessionStorage.getItem('user_id');
          sessionStorage.removeItem('user_email');
          sessionStorage.removeItem('user_id');
          
        //}
    },
    data () {
      return {
        jobs:'',
        employee: {
            title:null,
            name:'',
            sex:null,
            nic:'',
            mobile:'',
            email:'',
            joined_date:'',
            nine_month:null,
            job_id:null,
            user_id:''
        },
        option_title: [
          { value: null, text: 'Please select an option', disabled: true },
          { value: 'Mr.', text: 'Mr.' },
          { value: 'Ms', text: 'Ms.' },
        ],
        option_probationary: [
          { value: null, text: 'Please select an option', disabled: true },
          { value: '0', text: 'Yes' },
          { value: '1', text: 'No' },
        ],
        option_job:[
           { value: null, text: 'Please select an option', disabled: true },
        ],
        option_sex:[
           { value: null, text: 'Please select an option', disabled: true },
           { value: 'male', text: 'Male' },
          { value: 'female', text: 'Female' },
        ]
        
      }
    },
    methods: {
        loadJobs () {
            axios.get('http://127.0.0.1:8000/job_roles'              
            ).then((response) => {
              this.jobs = response.data;
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      },
      createEmployee () {
        axios.post('http://127.0.0.1:8000/employees',
              { 
                title : this.employee.title,
                emp_name: this.employee.name,
                sex: this.employee.sex,
                nic: this.employee.nic,
                mobile: this.employee.mobile,
                email: this.employee.email,
                joined_date: this.employee.joined_date,
                nine_month: this.employee.nine_month,
                job_id: this.employee.job_id,
                user_id: this.employee.user_id,
              }
            ).then((response) => {
              console.log('all data has sent to database' + response.data.success);

              //sessionStorage.setItem('user_email', response.data.success.email)
              //sessionStorage.setItem('user_id', response.data.success.user_id)
              //this.$router.push("/admin/overview");
              

            }).catch( error => { 
              console.log('error: ' + error); 
            });
      }
    }
  }

</script>
<style>

</style>

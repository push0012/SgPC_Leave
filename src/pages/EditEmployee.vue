<template>
<div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
  <card>
    <h4 slot="header" class="card-title">Edit Employee</h4>
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
                        v-model="employee.emp_name">
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
        <button type="submit" class="btn btn-info btn-fill float-right" @click.prevent="editEmployee">
          Edit Employee
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
    props: {
      //id: Number,
    },
    mounted(){
        this.id = this.$route.query.id
        this.loadJobs();
        this.loadEmployee(this.id);
    },
    data () {
      return {
        notifications: {
          topCenter: false
        },
        id:'',
        jobs:'',
        employee: {
            title:null,
            emp_name:'',
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
        notifyMe(title,message,icon,type){
          this.$notifications.notify(
          { 
            title:title, message: message, icon: icon, 
            horizontalAlign: 'right',
            verticalAlign: 'bottom',
            type: type
          })
        },
        loadJobs () {
            axios.get(process.env.VUE_APP_BASEURL + '/job_roles'              
            ).then((response) => {
              this.jobs = response.data;
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      },
      loadEmployee(id){
          axios.get(process.env.VUE_APP_BASEURL + '/employees/'+id
            ).then((response) => {
              this.employee = response.data;
            }).catch( error => { 
              
            });
      },
      editEmployee () {
        console.log(this.id)
        axios.put(process.env.VUE_APP_BASEURL + '/employees/'+this.id,
              { 
                title : this.employee.title,
                emp_name: this.employee.emp_name,
                sex: this.employee.sex,
                nic: this.employee.nic,
                mobile: this.employee.mobile,
                email: this.employee.email,
                joined_date: this.employee.joined_date,
                nine_month: this.employee.nine_month,
                job_id: this.employee.job_id,
                
              }
            ).then((response) => {
             this.notifyMe(
                'Success Message',
                '<span>Employee <b> '+this.employee.emp_name+' </b> Profile has been Updated Successfully',
                'fa fa-check-circle',
                'success'
                );
              this.$router.push("/admin/admin/employee/list");
              
            }).catch( error => { 
              
             console.log("shit");
            });
      }
    }
  }

</script>
<style>

</style>

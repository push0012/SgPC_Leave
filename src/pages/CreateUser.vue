<template>


<div class="content">
  <loading :active.sync="isLoading" 
        :is-full-page="fullPage">
</loading>
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-8">
  <card>
    <h4 slot="header" class="card-title">Create User</h4>
    <form>
      <div class="row">
        <div class="col-md-8">
          <base-input type="text"
                    label="Name"
                    placeholder="Name"
                    v-model="user.name">
          </base-input>
        </div>
        </div>
        <div class="row">
        <div class="col-md-8">
          <base-input type="email"
                    label="Email"
                    placeholder="Email"
                    v-model="user.email">
          </base-input>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8">
            <label >User Type</label>
            <b-form-select v-model="user.selected" :options="option"></b-form-select>
          </div>
      </div>
      <div class="row">
        <div class="col-md-8">
          <base-input type="password"
                    label="password"
                    placeholder="Password"
                    v-model="user.password">
          </base-input>
        </div>
        </div>
        <div class="row">
        <div class="col-md-8">
          <base-input type="password"
                    label="password confirmation"
                    placeholder="Password Confirmation"
                    v-model="user.password_confirmation">
          </base-input>
        </div>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-info btn-fill float-right" @click.prevent="createUser">
          Create User
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
  import Loading from 'vue-loading-overlay';
  import 'vue-loading-overlay/dist/vue-loading.css';

  import Card from 'src/components/Cards/Card.vue'
  const axios = require('axios');
  export default {
    components: {
      Card,
      Loading
    },
    data () {
      return {
        isLoading: false,
        fullPage: true,
        user: {
          name: '',
          email: '',
          selected: null,
          password:'',
          password_confirmation:''
        },
        //selected: null,
        option: [
          { value: null, text: 'Please select an option', disabled: true },
          { value: 'developer', text: 'Developer' },
          { value: 'admin', text: 'Administrator' },
          { value: 'super_user', text: 'Super User' },
          { value: 'user', text: 'User' }
        ]
      }
    },
    methods: {
      createUser () {
              this.isLoading = true;
              setTimeout(() => {
                this.isLoading = false
              },2*5000)

              axios.post('http://127.0.0.1:8000/register',
              { name: this.user.name,
                email: this.user.email,
                role: this.user.selected,
                password: this.user.password,
                password_confirmation: this.user.password_confirmation
              }
            ).then((response) => {
              console.log('all data has sent to database' + response);

              sessionStorage.setItem('user_email', response.data.success.email)
              sessionStorage.setItem('user_id', response.data.success.user_id)
              this.$router.push("/admin/admin/employee/create");
              
            }).catch( error => { 
              console.log('error: ' + error); 
            });
      }
    }
  }

</script>
<style>
.drops{
    text-decoration: none;
}
</style>
<template>
<div class="content">
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
  import Card from 'src/components/Cards/Card.vue'

  export default {
    components: {
      Card,
    },
    data () {
      return {
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
         alert('Your data: ' + JSON.stringify(this.user))
      }
    }
  }

</script>
<style>
.drops{
    text-decoration: none;
}
</style>
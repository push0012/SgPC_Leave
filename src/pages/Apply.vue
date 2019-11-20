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
                <b-form-select :options="option_leave_type"></b-form-select>
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
                <b-form-select ></b-form-select>
            </div>
            <div class="col-md-4">
                <label>Supervising Officer</label>
                <b-form-select ></b-form-select>
            </div>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-info btn-fill float-right" >
          Request Leave
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
        option_leave_type: [
            { value: null, text: 'Please select...', disabled: true },
            { value: 'casual', text: 'Casual' },
		    { value: 'medical', text: 'Medical' },
		    { value: 'other', text: 'Other' },
        ],
      }
    },
    methods: {
      
    }
  }

</script>
<style>

</style>
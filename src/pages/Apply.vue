<template>
    <div class="content">
        <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
  <card>
    <h4 slot="header" class="card-title">Apply Leave</h4>
    <form>
        <div class="row">
            <div class="col-md-4">
                <label >Employee Name</label>
                <base-input type="text"
                        label="Name"
                        :disabled="true"
                        >
                </base-input>
            </div>
            <div class="col-md-4">
                <label >Position</label>
                <base-input type="text"
                        label="Position"
                        :disabled="true"
                        >
                </base-input>
            </div>
            <div class="col-md-4">
                <label >Department</label>
                <base-input type="text"
                            label="Name"
                            placeholder="Name"
                            >
                </base-input>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label>Leave Type</label>
                <b-form-select v-model="employee.nine_month" :options="option_probationary"></b-form-select>
            </div>
            <div class="col-md-3">
                <label >Number of Days Applied</label>
                <base-input type="text"
                        label="date_count"
                        placeholder="NIC"
                        >
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

</script>
<style>

</style>
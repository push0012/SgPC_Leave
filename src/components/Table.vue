<template>
  <table class="table">
    <thead>
      <slot name="columns">
        <tr>
          <th v-for="column in columns" :key="column">{{column}}</th>
        </tr>
      </slot>
    </thead>
    <tbody>
    <tr v-for="(item, index) in data" :key="index">
      <slot :row="item">
        <td v-for="column in columns" :key="column" v-if="hasValue(item, column)">{{itemValue(item, column)}}</td>
         <td><a :href="'#/admin/admin/'+page+'/edit?id='+item.id"><i class="fa fa-pencil-square-o text-success" aria-hidden="true"></i></a></td>
         <td><a :href="'#/admin/admin/'+page+'/delete/?id='+item.id"><i class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
        <td><a href=""><i class="fa fa-eye" aria-hidden="true"></i></a></td>
      </slot>
    </tr>
    </tbody>
  </table>
</template>
<script>
  export default {
    name: 'l-table',
    props: {
      columns: Array,
      data: Array,
      page: String,
    },
    mounted(){
      //this.initialize();
    },
    methods: {
      hasValue (item, column) {
        return item[column.toLowerCase()] !== 'undefined'
      },
      itemValue (item, column) {
        return item[column.toLowerCase()]
      }
    }
  }
</script>
<style>
</style>

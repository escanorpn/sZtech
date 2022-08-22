<template>
  <div style="background-color: ;margin-top:122px">
      
      <!-- <div style="background-color:#001529;height:63px;margin-top:-50px;" ></div> -->
 <md-progress-bar md-mode="indeterminate" v-if="sending" />
  <mdb-card style="width:99%;max-width:1200px;margin-bottom:3%;padding:0px;margin-top" class="mTop"  >
    <mdb-card-body style="background-color: ;margin-top:222px">



  <v-card>
    <v-card-title>
      Nutrition
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="desserts"
      :search="search"
    ></v-data-table>
  </v-card>


     <a-table :dataSource="dataSource" :columns="columns" />
    <div id="people">
      
  <v-client-table :data="tableData" :columns="columns2" :options="options"  :row-click=handleRowFunction></v-client-table>
   <vue-bootstrap-table
            :columns="columns"
            :values="values"
            :show-filter="true"
            :show-column-picker="true"
            :sortable="true"
            :paginated="true"
            :multi-column-sortable=true
            :filter-case-sensitive=false
            :row-click-handler=handleRowFunction

    >
        <template v-slot:name="slotProps">
            {{slotProps.value.name}}
        </template>
        <template v-slot:description="slotProps">
            {{slotProps.value.description}}
        </template>
    </vue-bootstrap-table>
</div>
    <!-- <a-table :dataSource="dataSource" :columns="columns1" /> -->
    </mdb-card-body>
  </mdb-card>
  </div>
</template>

<script>


  // import api from "../../services/api";

// const axios = require('axios');
// import { ClientTable, } from 'vue-tables-2';
import VueBootstrapTable from "vue2-bootstrap-table2";
  export default {
      components: {
         VueBootstrapTable,
    //  ClientTable
      },
    name: 'Hod',
    // data() {
    // return {
    data: () => ({
       search: '',
        headers: [
          {
            text: 'Dessert (100g serving)',
            align: 'start',
            sortable: false,
            value: 'name',
          },
          { text: 'Calories', value: 'calories' },
          { text: 'Fat (g)', value: 'fat' },
          { text: 'Carbs (g)', value: 'carbs' },
          { text: 'Protein (g)', value: 'protein' },
          { text: 'Iron (%)', value: 'iron' },
        ],
        desserts: [
          {
            name: 'Frozen Yogurt',
            calories: 159,
            fat: 6.0,
            carbs: 24,
            protein: 4.0,
            iron: '1%',
          },
          {
            name: 'Ice cream sandwich',
            calories: 237,
            fat: 9.0,
            carbs: 37,
            protein: 4.3,
            iron: '1%',
          },
          {
            name: 'Eclair',
            calories: 262,
            fat: 16.0,
            carbs: 23,
            protein: 6.0,
            iron: '7%',
          },
          {
            name: 'Cupcake',
            calories: 305,
            fat: 3.7,
            carbs: 67,
            protein: 4.3,
            iron: '8%',
          },
          {
            name: 'Gingerbread',
            calories: 356,
            fat: 16.0,
            carbs: 49,
            protein: 3.9,
            iron: '16%',
          },
          {
            name: 'Jelly bean',
            calories: 375,
            fat: 0.0,
            carbs: 94,
            protein: 0.0,
            iron: '0%',
          },
          {
            name: 'Jelly bean',
            calories: 375,
            fat: 0.0,
            carbs: 94,
            protein: 0.0,
            iron: '0%',
          },
          {
            name: 'Jelly bean',
            calories: 375,
            fat: 0.0,
            carbs: 94,
            protein: 0.0,
            iron: '0%',
          },
          {
            name: 'Jelly bean',
            calories: 375,
            fat: 0.0,
            carbs: 94,
            protein: 0.0,
            iron: '0%',
          },
          {
            name: 'Jelly bean',
            calories: 375,
            fat: 0.0,
            carbs: 94,
            protein: 0.0,
            iron: '0%',
          },
          {
            name: 'Jelly bean',
            calories: 375,
            fat: 0.0,
            carbs: 94,
            protein: 0.0,
            iron: '0%',
          },
          {
            name: 'Lollipop',
            calories: 392,
            fat: 0.2,
            carbs: 98,
            protein: 0,
            iron: '2%',
          },
          {
            name: 'Honeycomb',
            calories: 408,
            fat: 3.2,
            carbs: 87,
            protein: 6.5,
            iron: '45%',
          },
          {
            name: 'Donut',
            calories: 452,
            fat: 25.0,
            carbs: 51,
            protein: 4.9,
            iron: '22%',
          },
          {
            name: 'KitKat',
            calories: 518,
            fat: 26.0,
            carbs: 65,
            protein: 7,
            iron: '6%',
          },
        ],
      columns: [
                {
                    title:"id",
                },
                {
                    title:"name",
                    visible: true,
                    editable: true,
                    filterable: false
                },
                {
                    title:"age",
                    visible: true,
                    editable: true,
                },
                {
                    title:"country",
                    visible: true,
                    editable: true,
                    sortable: false
                }
            ],
            values: [
                {
                    "id": 1,
                    "name": "John",
                    "country": "UK",
                    "age": 25,
                },
                {
                    "id": 2,
                    "name": "Mary",
                    "country": "France",
                    "age": 30,
                },
                {
                    "id": 3,
                    "name": "Ana",
                    "country": "Portugal",
                    "age": 20,
                }
            ],
          columns2: ['id', 'name', 'age'],
        tableData: [
            { id: 1, name: "John", age: "20" },
            { id: 2, name: "Jane", age: "24" },
            { id: 3, name: "Susan", age: "16" },
            { id: 4, name: "Chris", age: "55" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" },
            { id: 5, name: "Dan", age: "40" }
        ],
        options: {
          editableColumns:['name'],
          sortable: ['id', 'age'],
          filterable: ['name', 'age'],
             texts:{
                filter:"",
                count:"",
                filterPlaceholder:"Search",
                page:"Page:",
                noResults:"No matching records",
                loading:'Loading...',
            },
            columnsClasses: {
                cntCnt: 'text-center noOutline',
                qtCnt: 'text-center noOutline', 
                statusName: 'text-center noOutline',
                created_at: 'text-center ',
            },
            perPage: 4,
            // see the options API
        },
          dataSource: [
          {
            key: '1',
            name: 'Mike',
            age: 32,
            address: '10 Downing Street',
          },
          {
            key: '2',
            name: 'John',
            age: 42,
            address: '10 Downing Street',
          },
        ],
         columns1: [
          {
            title: 'Name',
            dataIndex: 'name',
            key: 'name',
          },
          {
            title: 'Age',
            dataIndex: 'age',
            key: 'age',
          },
          {
            title: 'Address',
            dataIndex: 'address',
            key: 'address',
          },
          {
            title: 'Address',
            dataIndex: 'address',
            key: 'address',
          },
          {
            title: 'Address',
            dataIndex: 'address',
            key: 'address',
          },
        ],
    }),
      created () {
    Event.$on('rowClickedEvent', function (data) {
      console.log('Loaded...')
      console.log('My event has been triggered', data)
    })
  },
 
     mounted() {
  
   

  },
    methods: {
      handleRowFunction(e){
        console.log(e)
        // alert(e)
      }
    }  
  }
</script>

<style lang="scss" scoped>
tr {
  border: 1px solid #ccc;
  padding: 6px;
  border-radius: 4px;
  cursor: pointer;
}
    $c1: #275d2b;
    $c2:  #010902;
    $c3:   #45100f ;
    $c4:  #275d2b;
    .mTop{
        /* margin-top: 73px; */
        // background: linear-gradient(337deg,$c1 15%,  $c4 4%);
        background: linear-gradient($c2,$c3);
        background-attachment: fixed;
        
        // margin-top: -23%;
        // padding-top: 30%;
    }
</style>
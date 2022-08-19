
<template>
  <v-app id="inspire">
    <v-app-bar
      app
      color="white"
      flat
    >
     
    </v-app-bar>

    <v-main class="grey lighten-3">
      <v-container>
        <v-row>
         

          <v-col>
            <v-sheet
              min-height="70vh"
              rounded="lg"
            >
            

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
      :items="mdata"
      :search="search"
      :page.sync="page"
      :items-per-page="itemsPerPage"
      :loading="loading"
      loading-text="Loading... Please wait"
      hide-default-footer
      
      class="selected"
      @page-count="pageCount = $event"
      @click:row="handleClick"

    ></v-data-table>
    <div class="text-center pt-2">
      <v-pagination
        v-model="page"
        :length="pageCount"
      ></v-pagination>
      <!-- <v-text-field
        :value="itemsPerPage"
        label="Items per page"
        type="number"
        min="-1"
        max="15"
        @input="itemsPerPage = parseInt($event, 10)"
      ></v-text-field> -->
    </div>
  </v-card>
              <!--  -->
            </v-sheet>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
  import api from "../../services/api";
  export default {
    data: () => ({
      links: [
        'Dashboard',
        'Messages',
        'Profile',
        'Updates',
      ],
      page: 1,
      pageCount: 0,
      itemsPerPage: 5,
       search: '',
        headers: [
          {
            text: 'Name',
            align: 'start',
            sortable: false,
            value: 'name',
          },
          { text: 'Role', value: 'role' },
          { text: 'Email', value: 'email' },
          { text: 'Code ', value: 'code' },
          // { text: 'Iron (%)', value: 'iron' },
        ],
        mdata: [
          {
            name: 'loading',
            role: 'loading',
            email: 'loading',
            code: 'loading',
          },
        ],
        loading:true,
    }),
    methods:{
      handleClick(row) {
    console.log(row.fat)
  },
  init(){
    this.loading = true
    api.get('hod').then((response) => {
      console.log("mdata: "+ JSON.stringify(response.data.data));
          
          if(response.data.val==2){ 
            this.mdata = response.data.data;
          }
          this.loading = false
   
}).catch(function (response) {
          //handle error
          console.log("error"+JSON.stringify(response))
          
          this.loading = false
      });
  }
    },
     mounted() {
      this.init()
     }
  }
</script>
<style lang="scss" scoped>
// table{
//   background-color: red !important;
// }
.selected {
    background-color: #fff;
    cursor:pointer;
}
</style>
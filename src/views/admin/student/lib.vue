
<template>
  <v-app id="inspire">
  
    <v-main class="grey lighten-3">
      <v-container>
     
            <v-sheet
              min-height="70vh"
              rounded="lg"
            >

            

  <v-card style="margin-top:-72px">
  
    <v-card-title>

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

    >
  
    <template v-slot:no-data>
      <v-btn
        color="primary"
        @click="init"
      >
        Reset
      </v-btn>
    </template>
    </v-data-table>
    <div class="text-center pt-2">
      <v-pagination
        v-model="page"
        :length="pageCount"
      ></v-pagination>
    
    </div>
       <div class="loading-box" v-if="loading1">
                <div class="loader"></div>
              </div>
      <v-card style="max-width:800px; margin-left:auto;margin-right:auto;margin-top:22px;padding:22px" v-if="sItem==true">
    <v-card-title>
      Add student
      <v-spacer></v-spacer>
      </v-card-title>
  
  
  <v-form
    ref="form"
    v-model="valid"
    lazy-validation
  >

    <v-text-field
      v-model="name"
      :counter="10"
      :rules="nameRules"
      label="Name"
      required
    ></v-text-field>

    <v-text-field
      v-model="value"
      :rules="valueRules"
      label="Value"
      required
    ></v-text-field>

      <v-select
      v-model="status"
      :items="items"
      :rules="[v => !!v || 'status is required']"
      label="status"
      required
    ></v-select>


    <v-btn
      :disabled="!valid"
      color="success"
      class="mr-4"
      @click="validate"
    >
      update
    </v-btn>
 <v-btn
      color="warning"
      @click="sClose"
    >
      close
    </v-btn>

  </v-form>
   </v-card>
  </v-card>
  
  <!-- <mForm :eItem="eItem" v-if="sItem==true"/> -->
 
   
              <!--  -->
            </v-sheet>
         
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
  // import mForm from "./form.vue"
  import api from "../../services/api";
// import {   mdbEdgeHeader,mdbBtn  } from 'mdbvue';
  export default {
     components: {
      // mdbEdgeHeader,
      // mdbBtn
     },
     
    data: () => ({
      switch1:false,
      switch2:"Not cleared",
      fname:"",
      fcode:"",
      femail:"",
      loading1:true,
      valid: true,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      value: 0,
    
      status: null,
      items: [
        'pending',
        'cleared',
      ],
      mId:'',
      selected: [],
      eItem:[],
      sItem:false,
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
          // {
          //   text: 'id',
          //   align: 'start',
          //   sortable: false,
          //   value: 'id',
          // },
          
          {
            text: 'Name',
            sortable: false,
            value: 'name',
          },
          // { text: 'Role', value: 'role' },
          { text: 'Value', value: 'value' },
          { text: 'Status ', value: 'status' },
          // { text: 'admission ', value: 'admission' },
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
        dialog: false,
      dialogDelete: false,
      // desserts: [],
      editedIndex: -1,
      addedItem: {
        name: '',
        value: 0,
      },
       editedItem: {
        name: '',
        calories: 0,
        fat: 0,
        carbs: 0,
        protein: 0,
      },
      defaultItem: {
        name: '',
        calories: 0,
        fat: 0,
        carbs: 0,
        protein: 0,
      },
    }),
    
    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'New Item' : 'Edit Item'
      },
    },

    watch: {
      dialog (val) {
        val || this.close()
      },
      dialogDelete (val) {
        val || this.closeDelete()
      },
    },

    created () {
      // this.initialize()
    },
    methods:{
      
        cleare_user(){
        this.switch2="processing..."
        this.loading = true;
        const context=this;
          const mData={
          sid:this.$store.state.id,
          switch:this.switch1
        }
        api.post("lswitch",mData).then((response) => {
        console.log("switch response: "+ JSON.stringify(response.data));
            if(response.data.val==2){ 
              console.log(response.data.switch)
            
              this.switch2="not cleared"
              if(response.data.switch[0].lib==true){
                this.switch2="cleared"
              }
              
            }
            this.loading = false
  }).catch(function (response) {
            //handle error
            context.switch1=false
            context.switch2="Not cleared"
            console.log("error"+JSON.stringify(response))
            context.loading = false
        });
      },
      sClose(){
        this.sItem=false;
      },
          validate () {
        this.$refs.form.validate()
const mData={
  id:this.mId,
  sid:this.$store.state.id,
  name:this.name,
  value:this.value,
  status:this.status,
}
this.loading = true;
        api.post('lib_u',mData).then((response) => {
        console.log("update response: "+ JSON.stringify(response));
            
            if(response.data.val==2){ 
              this.mdata = response.data.data;
              this.sItem = false
            }
            this.loading = false
    
  }).catch(function (response) {
            //handle error
            console.log("error"+JSON.stringify(response))
            
            this.loading = false
        });
      },
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
      admit(){
        let sdata=this.selected;
        let data1=[];
        sdata.forEach((item)=>{
          data1.push(item.id)
          // console.log(index, item.id)
        })
        const ids={
          ids:JSON.stringify(data1)
        }
         this.loading = true
      api.post('hod_u',ids).then((response) => {
        console.log("mdata: "+ JSON.stringify(response));
            
            if(response.data.val==2){ 
              this.mdata = response.data.data;
            }
            this.loading = false
    
  }).catch(function (response) {
            //handle error
            console.log("error"+JSON.stringify(response))
            
            this.loading = false
        });
    
      },
      handleClick(row) {
      console.log(row.fat)
    },
    fBack(){
       this.$router.push('/lib');
    },
      init(){
        // if(this.$store.state.id==''){
        //    this.$router.push('/lib');
        // }
        const mdata={
          id:this.$store.state.id,
        }
      this.loading = true
      api.post('lib_d',mdata).then((response) => {
        console.log("lib data: "+ JSON.stringify(response.data));
   
            
            if(response.data.val==2){ 
              this.mdata = response.data.data;
              this.fname= response.data.user[0].name;
              this.fcode= response.data.user[0].name;
              this.femail= response.data.user[0].email;

              this.switch2="not cleared"
              if(response.data.user[0].lib==true){
                this.switch1=true;
                this.switch2="cleared"
              }
            }
            this.loading = false
            
    
  }).catch(function (response) {
            //handle error
            console.log("error"+JSON.stringify(response))
            
            this.loading = false
        });
    },
    
      editItem (item) {
        // this.editedIndex = this.mdata.indexOf(item)
        // this.editedItem = Object.assign({}, item)
        this.mId=item.id;
        this.name=item.name;
        this.status=item.status;
        this.value=item.value;
        // this.eItem.push({name:item.name});
        // this.eItem.push({email:item.email});
        console.log(this.eItem)
        this.sItem = true
      },

      deleteItem (item) {
        console.log(item.id)
           this.loading = true
           const mData={
            id:item.id,
            sid:this.$store.state.id,
           }
      api.post('lib_del',mData).then((response) => {
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
        // this.editedIndex = this.mdata.indexOf(item)
        // this.editedItem = Object.assign({}, item)
        // this.dialogDelete = true
      },

      deleteItemConfirm () {
        this.mdata.splice(this.editedIndex, 1)
        this.closeDelete()
      },

      close () {
        this.dialog = false
        // this.$nextTick(() => {
        //   this.editedItem = Object.assign({}, this.defaultItem)
        //   this.editedIndex = -1
        // })
      },

      closeDelete () {
        this.dialogDelete = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      save () {
        // if (this.editedIndex > -1) {
        //   Object.assign(this.mdata[this.editedIndex], this.editedItem)
        // } else {
        //   this.mdata.push(this.editedItem)
        // }
        this.close()
        this.loading = true;
        const mData={
          sid:this.$store.state.id,
          name:this.addedItem.name,
          value:this.addedItem.value
        }
        api.post('lib',mData).then((response) => {
        console.log("update response: "+ JSON.stringify(response));
            
            if(response.data.val==2){ 
              this.mdata = response.data.data;
            }
            this.loading = false
    
  }).catch(function (response) {
            //handle error
            console.log("error"+JSON.stringify(response))
            
            this.loading = false
        });
      
        // console.log(this.addedItem)
      },
    },
     mounted() {
      this.init()
     }
  }
</script>
<style lang="scss" scoped>

.loading-box{
     position: fixed;
    width: 100%;
    height: 5px;
    border-radius: 50px;
    /* border: 2px solid #ededed; */
    overflow: hidden;
    top: 38px;
    left: 0;
}
.loader{
    width: 100%;
    height: 100%;
    position: absolute;
    border-radius: 50px;
    background: linear-gradient(45deg, #3c0d0b,#b6b5ff, #ff9797,#3c0d0b);
    left: 0%;
    animation: load 1s linear infinite;
}


@keyframes load{
    0%{
        left: -100%;
    }
    100%{
        left: 100%;
    }
}
 
.selected {
    background-color: #fff;
    cursor:pointer;
}
</style>
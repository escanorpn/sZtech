
<template>
  <v-app id="inspire">
    <v-app-bar
      app
      
      color="#3c0d0b"
      flat
    >
       <h4 class="text-white pt-3 mt-n5" style=" font-weight: 900;color: #ffffff;text-shadow: #cb6dff 1px 1px 2px;margin-top: 5px;margin-left: auto;margin-right: auto;" >{{fname}}</h4>
    </v-app-bar>
 <mdb-edge-header color="" style="background-color: #3c0d0b;margin-top:-12px;">
        <div class="home-page-background"></div>
           <div class="container">
              <div class="loading-box" v-if="loading">
                <div class="loader"></div>
              </div>
        <div class="row">
          <div class="col-lg-8 text-center mx-auto" style="margin-top:87px;position: fixed;left: 0;width:100%;">
          <h5 class="text-white pt-3 mt-n5" style=" font-weight: 900;color: #ffffff;margin-top: 5px;margin-left: 44px;margin-right: ;text-align: left;" >code: {{fcode}}</h5>
          <h5 class="text-white pt-3 mt-n5" style=" font-weight: 900;color: #ffffff;margin-top: 5px;margin-left: 44px;margin-right: ;text-align: left;"  >email: {{femail}}</h5>
        </div>
        </div>
           </div>
         
      </mdb-edge-header>
    <v-main class="grey lighten-3">
      <v-container>
     
            <v-sheet
              min-height="70vh"
              rounded="lg"
            >

            

  <v-card style="margin-top:-122px">

    <v-card-title>
      <mdb-btn style="color:#e9ecef;background: linear-gradient(315deg,#3f0d12,#a71d31 74%);box-shadow: rgb(38 3 3) 1px 5px 5px;" color="" type="submit" 
       @click="fBack"
      >All students</mdb-btn>
      <v-spacer></v-spacer>
       <p>Payed:{{fPayed}}</p>
      <v-spacer></v-spacer>
       <p>Pending:{{fPending}}</p>
      <v-spacer></v-spacer>
       <p>Balance:{{fBalance}}</p>
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

    >
     <template v-slot:top>
      <v-toolbar
        flat
      >
        <v-switch
      v-model="switch1"
      :label="switch2"
       @change="cleare_user"
    ></v-switch>
        <!-- <v-toolbar-title>My CRUD</v-toolbar-title> -->
        <v-divider
          class="mx-4"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
        <v-dialog
          v-model="dialog"
          max-width="500px"
        >
          <template v-slot:activator="{  on, attrs }">
            <v-btn
              color="primary"
              dark
              class="mb-2"
               v-bind="attrs"
              v-on="on"
              style="color:#e9ecef;background: linear-gradient(315deg,#3f0d12,#a71d31 74%);box-shadow: rgb(38 3 3) 1px 5px 5px;"
            >
              Add 
            </v-btn>
            
          </template>
          <v-card>
            <v-card-title>
              <span class="text-h5">{{ formTitle }}</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="addedItem.name"
                      label="name"
                    ></v-text-field>
                  </v-col>
                    
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="addedItem.value"
                      label="Value"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <a-radio-group v-model="fStudents" @change="fChange" size="small">
                    <a-radio-button checked="fchecked" value="a">Debt</a-radio-button>
                    <a-radio-button value="b">Payment</a-radio-button>
                  </a-radio-group>
                  </v-col>
            
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                color="blue darken-1"
                text
                @click="close"
              >
                Cancel
              </v-btn>
              <v-btn
                color="blue darken-1"
                text
                @click="save"
              >
                Save
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5">Are you sure you want to delete this item?</v-card-title>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
              <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:item.actions1="{ item }">
      <v-icon
        small
        class="mr-2"
        @click="editItem(item)"
      >
        mdi-pencil
      </v-icon>
     
    </template>
    <template v-slot:item.actions="{ item }">
    
      <v-icon
        small
        @click="deleteItem(item)"
      >
        mdi-delete
      </v-icon>
    </template>
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
  
      label="Name"
     
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
import {   mdbEdgeHeader,mdbBtn  } from 'mdbvue';
  export default {
     components: {
      mdbEdgeHeader,
      mdbBtn
     },
     
    data: () => ({
      
      switch1:false,
      switch2:"Not cleared",
      fPending:0,
      fPayed:0,
      fBalance:0,
      fStudents:"a",
      fchecked:true,
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
        'payed',
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
          
           { text: 'Actions', value: 'actions1', sortable: false },
          {
            text: 'Name',
            sortable: false,
            value: 'name',
          },
          // { text: 'Role', value: 'role' },
          { text: 'Value', value: 'value' },
          { text: 'Status ', value: 'status' },
          // { text: 'admission ', value: 'admission' },
           { text: 'Actions', value: 'actions', sortable: false },
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
      fChange(){
  console.log(this.fStudents);
      },
        cleare_user(){
        this.switch2="processing..."
        this.loading = true;
        const context=this;
          const mData={
          sid:this.$store.state.id,
          switch:this.switch1
        }
        api.post("fswitch",mData).then((response) => {
        console.log("switch response: "+ JSON.stringify(response.data));
            if(response.data.val==2){ 
              console.log(response.data.switch)
            
              this.switch2="not cleared"
              if(response.data.switch[0].finance==true){
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
let mgo="finance_u"
// alert("fStudents: "+this.fStudents)
// return;

        api.post(mgo,mData).then((response) => {
        console.log("update response: "+ JSON.stringify(response));
            
            if(response.data.val==2){ 
              this.mdata = response.data.data;
               this.fPending=response.data.pending;
              this.fPayed=response.data.payed;
              this.fBalance= parseInt(this.fPending)-parseInt(this.fPayed);
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
       this.$router.push('/finance');
    },
      init(){
        if(this.$store.state.id==''){
           this.$router.push('/finance');
        }
        const mdata={
          id:this.$store.state.id,
        }
      this.loading = true
      api.post('finance_d',mdata).then((response) => {
        console.log("finance data: "+ JSON.stringify(response.data));
   
            
            if(response.data.val==2){ 
              this.mdata = response.data.data;
              this.fname= response.data.user[0].name;
              this.fcode= response.data.user[0].name;
              this.femail= response.data.user[0].email;
              this.fPending=response.data.pending;
              this.fPayed=response.data.payed;
              this.fBalance= parseInt(this.fPending)-parseInt(this.fPayed);

               this.switch2="not cleared"
              if(response.data.user[0].finance==true){
                this.switch1=true;
                this.switch2="cleared"
              }
              // this.fBalance= parseInt(this.fPending)-parseInt(this.fpayed);
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
      api.post('finance_del',mData).then((response) => {
        console.log("mdata: "+ JSON.stringify(response.data));
            
            if(response.data.val==2){ 
              this.mdata = response.data.data;
              this.fPending=response.data.pending;
              this.fPayed=response.data.payed;
              this.fBalance= parseInt(this.fPending)-parseInt(this.fPayed);
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
           console.log(this.fStudents);
        let mgo="pending"
        if(this.fStudents=="b"){
          mgo="payed"
        }
        const mData={
          sid:this.$store.state.id,
          name:this.addedItem.name,
          value:this.addedItem.value,
          status:mgo,
        }
     
         mgo="payment"
        api.post(mgo,mData).then((response) => {
        console.log("update response: "+ JSON.stringify(response));
            
            if(response.data.val==2){ 
              this.mdata = response.data.data;
               this.fPending=response.data.pending;
              this.fPayed=response.data.payed;
              this.fBalance= parseInt(this.fPending)-parseInt(this.fPayed);
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

<template>
  <v-app id="inspire">
      <v-app-bar
      app
      
      color="#3c0d0b"
      flat
    >
       <h4 class="text-white pt-3 mt-n5" style=" font-weight: 900;color: #ffffff;text-shadow: #cb6dff 1px 1px 2px;margin-top: 5px;margin-left: auto;margin-right: auto;" >Gowns</h4>
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
      {{fts}} students
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
       <a-radio-group v-model="fStudents" @change="fChange" size="small">
        <a-radio-button checked="fchecked" value="a">All</a-radio-button>
        <!-- <a-radio-button value="b">Admitted</a-radio-button> -->
        <a-radio-button value="c">Gown</a-radio-button>
        <!-- <a-radio-button value="d">Chengdu</a-radio-button> -->
      </a-radio-group>
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
          <template v-slot:activator="{  attrs }">
            <!-- <v-btn
              color="primary"
              dark
              class="mb-2"
              v-bind="attrs"
             
              @click="admit"
            >
              Admit selected
            </v-btn> -->
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
                      v-model="editedItem.name"
                      label="Dessert name"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.calories"
                      label="Calories"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.fat"
                      label="Fat (g)"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.carbs"
                      label="Carbs (g)"
                    ></v-text-field>
                  </v-col>
                  <v-col
                    cols="12"
                    sm="6"
                    md="4"
                  >
                    <v-text-field
                      v-model="editedItem.protein"
                      label="Protein (g)"
                    ></v-text-field>
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
    <template v-slot:item.actions="{ item }">
      <v-icon
        small
        class="mr-2"
        @click="editItem(item)"
      >
        mdi-pencil
      </v-icon>
      <!-- <v-icon
        small
        @click="deleteItem(item)"
      >
        mdi-delete
      </v-icon> -->
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
      :rules="nameRules"
      label="Name"
      required
    ></v-text-field>

    <v-text-field
      v-model="email"
      :rules="emailRules"
      label="E-mail"
      required
    ></v-text-field>

    <v-text-field
      v-model="code"
      :counter="10"
      :rules="codeRules"
      label="code"
      required
    ></v-text-field>
      <v-select
      v-model="admission"
      :items="items"
      :rules="[v => !!v || 'Admission is required']"
      label="Item"
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
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
  // import mForm from "./form.vue"
  import api from "../../services/api";
  export default {
     components: {
      // mForm
     },
     
    data: () => ({
      fts:"All",
      fStudents:"a",
      fchecked:true,
      loading1:true,
      valid: true,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      code:'',
      codeRules: [
        v => !!v || 'Code is required',
        v => (v && v.length <= 10) || 'Code must be less than 10 characters',
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      admission: null,
      items: [
        'pending',
        'admitted',
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
          {
            text: 'id',
            align: 'start',
            // sortable: false,
            value: 'id',
          },
          {
            text: 'Name',
            // sortable: false,
            value: 'name',
          },
          // { text: 'Role', value: 'role' },
          { text: 'Email', value: 'email' },
          { text: 'Code ', value: 'code' },
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
        // console.log(this.fStudents)
        if(this.fStudents=="a"){
        this.All()
        this.fts="All"
        }else if(this.fStudents=="b"){
          this.init()
          this.fts="Admitted";
          // alert("b")
        }else if(this.fStudents=="c"){
          this.Gown()
          this.fts="Gown";
        }
      },
       All(){
      this.loading = true
      api.get('gown_all').then((response) => {
        // console.log("mdata: "+ JSON.stringify(response.data.data));
            
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
    Gown(){
      this.loading = true
      api.get('gown_f').then((response) => {
        // console.log("mdata: "+ JSON.stringify(response.data.data));
            let mData1=[];
            let fid=0;
            if(response.data.val==2){ 
              // mData1 = [...new Set(response.data.data)];
              response.data.data.forEach((item)=>{
                if(item.id!=fid){
                  mData1.push(item)
                  fid=item.id;
                }
              });
              this.mdata = mData1;
            }
            this.loading = false
    
  }).catch(function (response) {
            //handle error
            console.log("error"+JSON.stringify(response))
            
            this.loading = false
        });
    },
      sClose(){
        this.sItem=false;
      },
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
      
      handleClick(row) {
        this.$router.push('/gownf');
        this.$store.commit('setId',row.id)
      // console.log(row.id)
    },
      init(){
      this.loading = true
      api.get('gown').then((response) => {
        // console.log("mdata: "+ JSON.stringify(response.data.data));
            
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
    
      editItem (item) {
        // this.editedIndex = this.mdata.indexOf(item)
        // this.editedItem = Object.assign({}, item)
        this.mId=item.id;
        this.name=item.name;
        this.email=item.email;
        this.code=item.code;
        this.admission=item.admission;
        // this.eItem.push({name:item.name});
        // this.eItem.push({email:item.email});
        console.log(this.eItem)
        this.sItem = true
      },

     

      deleteItemConfirm () {
        this.mdata.splice(this.editedIndex, 1)
        this.closeDelete()
      },

      close () {
        this.dialog = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      closeDelete () {
        this.dialogDelete = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      save () {
        if (this.editedIndex > -1) {
          Object.assign(this.mdata[this.editedIndex], this.editedItem)
        } else {
          this.mdata.push(this.editedItem)
        }
        this.close()
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
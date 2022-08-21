
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
          <h5 class="text-white pt-3 mt-n5" style=" font-weight: 800;color: #ffffff;margin-top: 5px;margin-left: 44px;margin-right: ;text-align: left;" >code: {{fcode}}</h5>
          <h5 class="text-white pt-3 mt-n5" style=" font-weight: 800;color: #ffffff;margin-top: 5px;margin-left: 44px;margin-right: ;text-align: left;"  >email: {{femail}}</h5>
          
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
       @click="sCounter"
      > My data</mdb-btn>
      <v-spacer></v-spacer>
      <mdb-btn style="color:#e9ecef;background: linear-gradient(315deg,#3f0d12,#a71d31 74%);box-shadow: rgb(38 3 3) 1px 5px 5px;" color="" type="submit" 
       @click="lCounter"
      >Library</mdb-btn>
      <v-spacer></v-spacer>
 <mdb-btn style="color:#e9ecef;background: linear-gradient(315deg,#3f0d12,#a71d31 74%);box-shadow: rgb(38 3 3) 1px 5px 5px;" color="" type="submit" 
       @click="fCounter"
      >Finance</mdb-btn>
      <v-spacer></v-spacer>
 <mdb-btn style="color:#e9ecef;background: linear-gradient(315deg,#3f0d12,#a71d31 74%);box-shadow: rgb(38 3 3) 1px 5px 5px;" color="" type="submit" 
       @click="gCounter"
      >Gowns</mdb-btn>
    </v-card-title>
    

       <div class="loading-box" v-if="loading1">
                <div class="loader"></div>
              </div>
      
  </v-card>
  <v-card style="max-width:800px; margin-left:auto;margin-right:auto;margin-top:22px;padding:22px" v-if="sData==true">
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
      label="Email"
      required
    ></v-text-field>

<mdb-btn style="color:#e9ecef;background: linear-gradient(315deg,#3f0d12,#a71d31 74%);
box-shadow: rgb(38 3 3) 1px 5px 5px;" color="" type="submit" 
       @click="validate"
      >update</mdb-btn>
  
 <v-btn
 style="float:right"
      color="warning"
      @click="sClose"
    >
      close
    </v-btn>

  </v-form>
   </v-card>
  
  <lTab  v-if="lData==true"/>
  <fTab v-if="fData==true"/>
  <gTab v-if="gData==true"/>
 
   
              <!--  -->
            </v-sheet>
         
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
  import lTab from "./lib.vue"
  import fTab from "./finance.vue"
  import gTab from "./gown.vue"
  import api from "../../services/api";
import {   mdbEdgeHeader,mdbBtn  } from 'mdbvue';
  export default {
     components: {
      mdbEdgeHeader,
      mdbBtn,
      lTab,
      fTab,
      gTab
     },
     
    data: () => ({
      fItem:"",
     sData:true,
     lData:false,
     fData:false,
     gData:false,
     fname:"",
     fcode:"",
     femail:"",
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      loading:true,
       
      
    }),
    
    computed: {
    
    },

    watch: {
    
    },

    created () {
      // this.initialize()
    },
    methods:{
      sCounter(){
     this.sData=true;
     this.lData=false;
     this.fData=false;
     this.gData=false;
      },
      lCounter(){
        // this.lFun()
    this.sData=false;
     this.lData=true;
     this.fData=false;
     this.gData=false;
      },
      fCounter(){
    this.sData=false;
     this.lData=false;
     this.fData=true;
     this.gData=false;
      },
      gCounter(){
    this.sData=false;
     this.lData=false;
     this.fData=false;
     this.gData=true;
      },
     init(){
      this.loading = true
      const context=this;
       const mdata={
          id:this.$store.state.id,
        }
        api.post('student',mdata).then((response) => {
          // console.log("mdata: "+ JSON.stringify(response.data.data));
          if(response.data.val==2){ 
            this.fname = response.data.user[0].name;
            this.fcode = response.data.user[0].code;
            this.femail = response.data.user[0].email;
          }
          this.loading = false

          }).catch(function (response) {
                    console.log("error"+JSON.stringify(response))
                    context.loading = false
          });
        },

        
    //  lFun(){
    //   this.loading = true
    //   const context=this;
    //    const mdata={
    //       id:this.$store.state.id,
    //     }
    //     api.post('student_l',mdata).then((response) => {
    //       console.log("mdata: "+ JSON.stringify(response.data.item));
    //       if(response.data.val==2){ 
    //         this.fItem=response.data.item
          
    //       }
    //       this.loading = false

    //       }).catch(function (response) {
    //                 console.log("error"+JSON.stringify(response))
    //                 context.loading = false
    //       });
    //     },

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
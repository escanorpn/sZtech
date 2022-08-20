<template>
  <div class="mTopu">
      
      <!-- <div style="background-color:#001529;height:63px;margin-top:-50px;" ></div> -->
 <md-progress-bar md-mode="indeterminate" v-if="sending" />
  <mdb-card style="width:99%;max-width:1200px;margin-bottom:3%;padding:0px;margin-top" >
    <mdb-card-body>
          <!-- <mdb-datatable-2 striped bordered small hover responsive fixedHeader
      arrows maxHeight="400px" v-model="data" /> -->
        <div>
    <!-- <a-affix :offset-top="top"  >
     <a-steps :current="2">
      <a-step style="color:white" title="Library" />
      <a-step title="Finance"  />
      <a-step title="Gown"  />
      <a-step title="Records" />
    </a-steps>
    </a-affix> -->
    <a-tabs default-active-key="1" @change="callback">
  <a-tab-pane key="4" tab="Library" force-render>
    <form novalidate style="
    margin-left: auto;
    margin-right: auto;z-index:0;
    justify-content: space-around;" class="md-layout" @submit.prevent="validateRecipe">
      <md-card class="md-layout-item md-size-50 md-small-size-100">
        <md-card-header>
          <div class="md-title">Library</div>
          </md-card-header>

        <md-card-content>
         <div class="md-layout md-gutter">
      
            <div class="md-layout-item md-small-size-100">
              <mdb-input type="text" label="Heading" outline :disabled="sending" 
              v-model="heading4" name="heading" />

            </div>

       
          </div>
        <div class="md-layout md-gutter">
          <div class="md-layout-item md-small-size-100">
            
              <mdb-input
                type="textarea"
                outline
                inputClass="z-depth-1 p-3"
                label="Description"  :rows="3"
                :disabled="sending"
                v-model="desc4"
              />
              
          </div>
        </div>
        <div class="md-layout md-gutter">
            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass2('rImages')">
            <UploadImages  @changed="handleRimages"/>
              <span class="md-error" v-if="!$v.form.rImages.required">An Image is required</span>
              </md-field>
             
            </div>
        </div>
  
        </md-card-content>
          <div class="text-center py-4 mt-3">
          <mdb-btn style="color:#e9ecef;background-color:#0c0f24;" color="" type="submit" :disabled="sending">Add</mdb-btn>
        </div>

      </md-card>
        <md-snackbar :md-active.sync="error4">{{ emsg4 }} </md-snackbar>
      </form>
      </a-tab-pane>
      
  <a-tab-pane key="3" tab="Finance" force-render>
    <form novalidate style="
    margin-left: auto;
    margin-right: auto;z-index:0;
    justify-content: space-around;" class="md-layout" @submit.prevent="validateService">
      <md-card class="md-layout-item md-size-50 md-small-size-100">
        <md-card-header>
          <div class="md-title">Finance</div>
          </md-card-header>

        <md-card-content>
         <div class="md-layout md-gutter">
      
            <div class="md-layout-item md-small-size-100">
              <mdb-input type="text" label="Heading" outline :disabled="sending" 
              v-model="heading1" name="heading" />

            </div>

       
          </div>
        <div class="md-layout md-gutter">
          <div class="md-layout-item md-small-size-100">
            
              <mdb-input
                type="textarea"
                outline
                inputClass="z-depth-1 p-3"
                label="Description"  :rows="3"
                :disabled="sending"
                v-model="desc1"
              />
              
             
          </div>
        </div>
        <div class="md-layout md-gutter">
            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass2('pImages')">
            <UploadImages  @changed="handlePimages"/>
              <span class="md-error" v-if="!$v.form.pImages.required">An Image is required</span>
              </md-field>
             
            </div>
        </div>
  
        </md-card-content>
          <div class="text-center py-4 mt-3">
          <mdb-btn style="color:#e9ecef;background-color:#0c0f24;" color="" type="submit" :disabled="sending">Add</mdb-btn>
        </div>

      </md-card>
        <md-snackbar :md-active.sync="error1">{{ emsg1 }} </md-snackbar>
      </form>
      </a-tab-pane>

       <a-tab-pane key="2" tab="Gown" force-render>
        <form novalidate style="
    margin-left: auto;
    margin-right: auto;z-index:0;
    justify-content: space-around;" class="md-layout" @submit.prevent="validateProduct">
      <md-card class="md-layout-item md-size-50 md-small-size-100">
        <md-card-header>
          <div class="md-title">Gown</div>
        </md-card-header>

        <md-card-content>
          <div class="md-layout md-gutter">
      
            <div class="md-layout-item md-small-size-100">
              <mdb-input type="text" label="Heading" outline :disabled="sending" 
              v-model="heading" name="heading" />

            </div>

       
          </div>
          <div class="md-layout md-gutter">
           
            <div class="md-layout-item md-small-size-100">
                          
              <mdb-input
                type="textarea"
                outline
                inputClass="z-depth-1 p-3"
                label="Description"  :rows="3"
                :disabled="sending"
                v-model="desc"
              />
          
            </div>
          </div>
                <div class="md-layout md-gutter">
           
            <div class="md-layout-item md-small-size-100">
                          
           <md-field :class="getValidationClass('sImages')">
            <!-- <label for="email">Image</label> -->
            
            <UploadImages  @changed="handleSimages"/>
            
            <span class="md-error" v-if="!$v.form.sImages.required">An Image is required</span>
           
          </md-field>
          
            </div>
          </div>
  
        
        </md-card-content>
          <div class="text-center py-4 mt-3">
          <mdb-btn style="color:#e9ecef;background-color:#0c0f24;" color="" type="submit" :disabled="sending">Add</mdb-btn>
        </div>

      </md-card>

      <md-snackbar :md-active.sync="error">{{ emsg }} </md-snackbar>
     
    </form>
      </a-tab-pane>

      
       <a-tab-pane key="1" tab="Records" force-render>
        <form novalidate style="
    margin-left: auto;
    margin-right: auto;z-index:0;
    justify-content: space-around;" class="md-layout" @submit.prevent="validateGallery">
      <md-card class="md-layout-item md-size-50 md-small-size-100">
        <md-card-header>
        </md-card-header>

        <md-card-content>
                <div class="md-layout md-gutter">
            <div class="md-layout-item md-small-size-100">
           <md-field :class="getValidationClass('gImages')">
            <UploadImages  @changed="handleGimages"/>
            <span class="md-error" v-if="!$v.form.gImages.required">An Image is required</span>
          </md-field>
            </div>
          </div>
        </md-card-content>
          <div class="text-center py-4 mt-3">
          <mdb-btn style="color:#e9ecef;background-color:#0c0f24;" color="" type="submit" :disabled="sending">Add</mdb-btn>
        </div>
      </md-card>
      <md-snackbar :md-active.sync="error3">{{ emsg3 }} </md-snackbar>
    </form>
      </a-tab-pane>
    </a-tabs>
  </div>
    
    
    </mdb-card-body>
  </mdb-card>
  </div>
</template>

<script>
  import {  mdbCard, mdbCardBody,mdbBtn, mdbInput } from 'mdbvue';
  
 import UploadImages from "vue-upload-drop-images"
  import { validationMixin } from 'vuelidate';
  import {
    required,
    email,
    minLength,
    maxLength
  } from 'vuelidate/lib/validators'
  import api from "../services/api";

// const axios = require('axios');
  export default {
      components: {
        UploadImages,
        mdbCard,
        mdbCardBody,
        mdbBtn,
        mdbInput,
        // mdbIcon,
        // mdbDatatable2 
      },
    name: 'Upload',
    mixins: [validationMixin],
    data: () => ({
      top: 50,
        collapsed: true,
       heading: null,
       heading1: null,
       heading4: null,
       desc: null,
       desc1: null,
       desc4: null,
      form: {
        firstName: null,
        lastName: null,
        gender: null,
        age: null,
        email: null,
        sImages: null,
        gImages: null,
        pImages: null,
        file:null
      },
      userSaved: false,
      error:false,
      error1:false,
      error3:false,
      emsg:null,
      emsg1:null,
      emsg3:null,
      emsg4:null,
      sending: false,
      lastUser: null
    }),
    validations: {
      form: {
        firstName: {
          required,
          minLength: minLength(3)
        },
        // heading: {
        //   required,
        //   minLength: minLength(3)
        // },
         heading1: {
          required,
          minLength: minLength(3)
        },
         heading4: {
          required,
          minLength: minLength(3)
        },
        lastName: {
          required,
          minLength: minLength(3)
        },
        age: {
          required,
          maxLength: maxLength(10)
        },
        gender: {
          required
        },
        email: {
          // required,
          email
        },
        sImages: {
          required,
          // sImages
        },
        gImages: {
          required,
        },
        pImages: {
          required,
          // sImages
        },
        rImages: {
          required,
          // sImages
        },
        desc1: {
          // required,
          // sImages
        },
        desc4: {
          required,
          // sImages
        }
      }
    },
     mounted() {
  
      if(!this.$cookies.isKey("admin")){
    
        // this.$router.push('/Admin');
      }

  },
    methods: {
        onCollapse(collapsed, type) {
      console.log(collapsed, type);
    },
    onBreakpoint(broken) {
      console.log(broken);
    },
   toggleCollapsed() {
      this.collapsed = !this.collapsed;
      // alert( this.collapsed );
    },
    
         handleRimages(files){
          //  alert("foo"+files[0].name);
                console.log(files)
                this.rImages=files;
            },
         handlePimages(files){
          //  alert("foo"+files[0].name);
                console.log(files)
                this.pImages=files;
            },
            
         handleGimages(files){
          //  alert("foo"+files[0].name);
                console.log(files)
                this.gImages=files;
            },
         handleSimages(files){
          //  alert("foo"+files[0].name);
                console.log(files)
                this.sImages=files;
            },
         handleImages(files){
          //  alert("foo"+files[0].name);
                console.log(files)
                this.files=files;
            },
      getValidationClass (fieldName) {
        const field = this.$v.form[fieldName]

        if (field) {
          return {
            'md-invalid': field.$invalid && field.$dirty
          }
        }
      },
      getValidationClass1 (fieldName) {
        const field = this.$v.form[fieldName]

        if (field) {
          return {
            'md-invalid': field.$invalid && field.$dirty
          }
        }
      },
      getValidationClass2 (fieldName) {
        const field = this.$v.form[fieldName]

        if (field) {
          return {
            'md-invalid': field.$invalid && field.$dirty
          }
        }
      },
      clearForm () {
        this.$v.$reset()
        this.form.firstName = null
        this.form.lastName = null
        this.form.age = null
        this.form.gender = null
        this.form.email = null
       this.files = null
      },
      clearForm3 () {
        this.gImages = null
      },
      clearForm1 () {
        this.heading = null
        this.desc = null
        this.sImages = null
      },
      clearForm2 () {
        this.heading1 = null
        this.desc1 = null
        this.pImages = null
      },
      clearForm4 () {
        this.heading4 = null
        this.desc4 = null
        this.rImages = null
      },

      saveProject (){
        this.sending = true
        // var murl=this.$store.state.mUrl;
        var form_data = new FormData();

      form_data.append('duration',this.heading4);
      form_data.append('description',this.desc4);
  
console.log(JSON.stringify(form_data))
      api.post('project',form_data).then((response) => {
      console.log("response: "+ JSON.stringify(response));
   this.emsg4 = response.data;
            //  this.clearForm1();
            this.error4 = true
          if(response.data.code==1){ 
            this.emsg4 = response.data.message;
            //  this.clearForm1();
            this.error4 = true
           
          }
          this.clearForm2();
          this.sending = false
   
}).catch(function (response) {
          //handle error
          console.log("error"+JSON.stringify(response))
          
          this.sending = false
      });
    

      },
      saveRecipe (){
        this.sending = true
        // var murl=this.$store.state.mUrl;
        var form_data = new FormData();

      form_data.append('name',this.heading4);
      form_data.append('description',this.desc4);
      // form_data.append('images[]',this.sImages);
      for( var i = 0; i < this.rImages.length; i++ ){
          let file = this.rImages[i];
          console.log(file);
          form_data.append('images[]', file);
        }
       for (var pair of form_data.entries()) {
        console.log(pair[0]+ ' - ' + pair[1]); 
      }
// console.log(murl)
console.log(JSON.stringify(form_data))
      api.post('recipe',form_data).then((response) => {
      console.log("response: "+ JSON.stringify(response));
       
    this.emsg4 = response.data;
            //  this.clearForm1();
            this.error4 = true
          if(response.data.code==1){ 
            this.emsg4 = response.data.message;
            //  this.clearForm1();
            this.error4 = true
          }
          this.sending = false
           this.clearForm4();
}).catch(function (response) {
          //handle error
          console.log("error"+JSON.stringify(response))
          // this.clearForm2();
          this.sending = false
      });
        // Instead of this timeout, here you can call your API
        
      },
      
      saveService (){
        this.sending = true
        // var murl=this.$store.state.mUrl;
        var form_data = new FormData();

      form_data.append('name',this.heading1);
      form_data.append('description',this.desc1);
      // form_data.append('images[]',this.sImages);
      for( var i = 0; i < this.pImages.length; i++ ){
          let file = this.pImages[i];
          console.log(file);
          form_data.append('images[]', file);
        }
       for (var pair of form_data.entries()) {
        console.log(pair[0]+ ' - ' + pair[1]); 
      }
// console.log(murl)
console.log(JSON.stringify(form_data))
      api.post('service',form_data).then((response) => {
      console.log("response: "+ JSON.stringify(response));
       
    this.emsg1 = response.data;
            //  this.clearForm1();
            this.error1 = true
          if(response.data.code==1){ 
            this.emsg1 = response.data.message;
            //  this.clearForm1();
            this.error1 = true
          }
          this.sending = false
           this.clearForm2();
}).catch(function (response) {
          //handle error
          console.log("error"+JSON.stringify(response))
          // this.clearForm2();
          this.sending = false
      });
        // Instead of this timeout, here you can call your API
        
      },
      saveProduct () {
        this.sending = true
        var murl=this.$store.state.mUrl;
        var form_data = new FormData();

      form_data.append('name',this.heading);
      form_data.append('description',this.desc);
      // form_data.append('images[]',this.sImages);
      for( var i = 0; i < this.sImages.length; i++ ){
          let file = this.sImages[i];
          console.log(file);
          form_data.append('images[]', file);
        }
       for (var pair of form_data.entries()) {
    console.log(pair[0]+ ' - ' + pair[1]); 
}
console.log(murl)
console.log(JSON.stringify(form_data))
api.post('product',form_data).then((response) => {
   console.log("response: "+ JSON.stringify(response));
    this.emsg = response.data;
            //  this.clearForm1();
            this.error = true
          if(response.data.code==1){ 
            this.emsg = response.data.message;
            //  this.clearForm1();
            this.error = true
           
          }
    this.sending = false
}).catch(function (response) {
          //handle error
          // console.log("error"+response.response.stauts)
           this.sending = false
          console.log("err: "+JSON.stringify(response))
      });

        // Instead of this timeout, here you can call your API
        // window.setTimeout(() => {
        // //  this.clearForm1();
         
          
        // }, 1500)

      },
saveGallery(){
        this.sending = true
        // var murl=this.$store.state.nUrl;
        var form_data = new FormData();

      form_data.append('heading',"Gallery");
  
      for( var i = 0; i < this.gImages.length; i++ ){
          let file = this.gImages[i];
          console.log(file);
          form_data.append('images[]', file);
        }
       for (var pair of form_data.entries()) {
    console.log(pair[0]+ ' - ' + pair[1]); 
}

api.post('company',form_data).then((response) => {
   console.log("company_response: "+ JSON.stringify(response));
       
    this.emsg = response.data;
            //  this.clearForm1();
            this.error = true
          if(response.data.code==1){ 
            this.emsg = response.data.message;
            //  this.clearForm1();
            this.error = true
           
          }
        this.clearForm1();
          this.sending = false
   
}).catch(function (response) {
          //handle error
          console.log("error"+JSON.stringify(response))
          this.sending = false
      });



      },

          validateProject () {
            // this.$v.$touch()
            // alert(this.desc1)
        if(this.heading4==null){
           alert("There is an error")
          this.error4 = true;
          this.emsg4 = "Please add a heading";
        }else if(this.desc4==null){
          this.error4 = true;
          alert("There is an error")
          this.emsg4 = "Please add a description";
        }else if(this.pImages==null){
          this.error4 = true;
          alert("There is an error")
          this.emsg4 = "Please add an Image";
        }else{
          this.saveProject();
        }
   
      },
      
          validateRecipe () {
            // this.$v.$touch()
            // alert(this.desc1)
        if(this.heading4==null){
           alert("There is an error")
          this.error4 = true;
          this.emsg4 = "Please add a heading";
        }else if(this.desc4==null){
          this.error4 = true;
          alert("There is an error")
          this.emsg4 = "Please add a description";
        }else if(this.rImages==null){
          this.error4 = true;
          alert("There is an error")
          this.emsg4 = "Please add an Image";
        }else{
          this.saveRecipe();
        }
   
      },
          validateService () {
            // this.$v.$touch()
            // alert(this.desc1)
        if(this.heading1==null){
           alert("There is an error")
          this.error1 = true;
          this.emsg1 = "Please add a heading";
        }else if(this.desc1==null){
          this.error1 = true;
          alert("There is an error")
          this.emsg1 = "Please add a description";
        }else if(this.pImages==null){
          this.error1 = true;
          alert("There is an error")
          this.emsg1 = "Please add an Image";
        }else{
          this.saveService();
        }
   
      },
      validateProduct () {
        // this.$v.$touch()
        // alert("gg")
        if(this.heading==null){
          this.error = true;
          this.emsg = "Please add a heading";
        }else if(this.sImages==null){
          this.error = true;
          this.emsg = "Please add an Image of the product";
        }else{
          this.saveProduct();
        }
      console.log("heading= "+this.heading)
       
      },

      validateGallery () {
      
    if(this.gImages==null){
        // alert(this.sImages)
          this.error3 = true;
          this.emsg3 = "Please add an Image ";
        }else{
          //  alert("Has Image")
          this.saveGallery();
        }
       
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
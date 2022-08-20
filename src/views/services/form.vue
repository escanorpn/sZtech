<template>
  <div class="mTopu" style="max-width: 800px;
    margin-left: auto;
    margin-right: auto;
    margin-top: -200px;
    width: 90%;">
      
      <!-- <div style="background-color:#001529;height:63px;margin-top:-50px;" ></div> -->
 <md-progress-bar md-mode="indeterminate" v-if="sending" />
  <mdb-card style="width:99%;max-width:1200px;margin-bottom:3%;padding-top:42px;padding-bottom:42px;margin-top; " >
    <mdb-card-body>
          <!-- <mdb-datatable-2 striped bordered small hover responsive fixedHeader
      arrows maxHeight="400px" v-model="data" /> -->
      
    <form novalidate style="
    margin-left: auto;
    margin-right: auto;z-index:0;
    justify-content: space-around;" class="md-layout" @submit.prevent="validateUser">
      <md-card class="md-layout-item md-size-50 md-small-size-100">
        <md-card-header>
          <div class="md-title text-center">Products</div>
        </md-card-header>

        <md-card-content>
          <div class="md-layout md-gutter">
             

            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass('firstName')">
                <label for="first-name">Name</label>
                <md-input name="first-name" id="first-name" autocomplete="given-name" v-model="form.firstName" :disabled="sending" />
                <span class="md-error" v-if="!$v.form.firstName.required">The first name is required</span>
                <span class="md-error" v-else-if="!$v.form.firstName.minlength">Invalid name</span>
              </md-field>
            </div>

    
            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass('age')">
                <label for="age">Phone numeber</label>
                <md-input type="number" id="age" name="age" autocomplete="age" v-model="form.age" :disabled="sending" />
                <span class="md-error" v-if="!$v.form.age.required">The Price is required</span>
                <span class="md-error" v-else-if="!$v.form.age.maxlength">Invalid Price</span>
              </md-field>
            </div>
          </div>

          <md-field :class="getValidationClass('email')">
            <label for="email">Email</label>
            
             <md-input autocomplete="email" type="email" v-model="form.email" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.email.required">A valid email is required</span>
            <span class="md-error" v-else-if="!$v.form.email.email">Invalid email</span>
          </md-field>
        </md-card-content>

       


        <!-- <md-card-actions>
          <md-button type="submit" class="md-primary" :disabled="sending">Send Inquery</md-button>
        </md-card-actions> -->

            <div class="text-center py-4 mt-3">
          <mdb-btn style="color:#e9ecef;
background-color:#0c0f24;" color="" type="submit" :disabled="sending">Send Inquery</mdb-btn>
        </div>

      </md-card>

      <md-snackbar :md-active.sync="userSaved">The Product {{ lastUser }} was saved with success!</md-snackbar>
     
    </form>
    
    </mdb-card-body>
  </mdb-card>
  </div>
</template>

<script>
  import {  mdbCard, mdbCardBody, mdbBtn } from 'mdbvue';
  
  import { validationMixin } from 'vuelidate';
  import {
    required,
    email,
    minLength,
    maxLength
  } from 'vuelidate/lib/validators'

const axios = require('axios');
  export default {
      components: {
        mdbBtn,
        // UploadImages,
        mdbCard,
        mdbCardBody,
        // mdbIcon,
        // mdbDatatable2 
      },
    name: 'Upload',
    mixins: [validationMixin],
    data: () => ({
      top: 50,
        collapsed: true,
       data: {
          
        
        },
      form: {
        firstName: null,
        lastName: null,
        gender: null,
        age: null,
        email: null,
        file:null
      },
      userSaved: false,
      sending: false,
      lastUser: null
    }),
    validations: {
      form: {
        firstName: {
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
        }
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
         handleImages(files){
          //  alert("foo"+files[0].name);
                console.log(files)
                this.files=files;

                /*
                  [
                    {
                        "name": "Screenshot from 2021-02-23 12-36-33.png",
                        "size": 319775,
                        "type": "image/png",
                        "lastModified": 1614080193596
                        ...
                    },
                    ...
                    ]
                 */
            },
      getValidationClass (fieldName) {
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
      },
      saveUser () {
        this.sending = true
        var murl=this.$store.state.mUrl;
        var form_data = new FormData();

      // form_data.append("file[]", this.files);
      for( var i = 0; i < this.files.length; i++ ){
      let file = this.files[i];
      console.log(file);
      form_data.append('files[' + i + ']', file);
    }
      form_data.append('nm',this.form.firstName);
      form_data.append('desc',this.form.lastName);
      form_data.append('type',this.form.gender);
      form_data.append('am',this.form.age);

      console.log("f1: "+form_data.get("file[]"));
      console.log("form_data: "+JSON.stringify(this.files));
       for (var pair of form_data.entries()){
        console.log(pair[0]+', '+pair[1]);
      }
      
      axios({
          method: 'POST',
          // url: 'http://localhost/nw/vap/regApi.php?apicall=signup'
          url: murl+'api.php?apicall=a_up',
          data: form_data,
          config: { headers: {'Content-Type': 'multipart/form-data' }}
      })
      .then((response) => {
        console.log("response: "+response);
        console.log("response1: "+ JSON.stringify(response.data));
       

      })
      .catch(function (response) {
          //handle error
          console.log("error"+response)
      });
        // Instead of this timeout, here you can call your API
        window.setTimeout(() => {
          this.lastUser = `${this.form.firstName} ${this.form.lastName}`
          this.userSaved = true
          this.sending = false
          // this.clearForm()
        }, 1500)
      },
      validateUser () {
        this.$v.$touch()

        if (!this.$v.$invalid) {
          this.saveUser()
        }
      }
    }
  }
</script>

<style lang="scss" scoped>

.btn-default {
  margin-left: 50%;
  margin-right:50%;
 color:#e9ecef;
 background-color:#0c0f24 !important
}
.card .card-body{
    padding: 0px;
}
  .md-progress-bar {
    position: fixed;
    height:7px;
    top: 48px;
    right: 0;
    left: 0;
    z-index: 3;
  }
   .card {
        max-width: 400px;
        width:80%;
        margin-left:auto;
      
      margin-right:auto;
    }
    $c1: rgb(167, 202, 164);
    $c2:  #001529;
    $c3:   rgba(0, 0, 0, 0.87) ;
    $c4:  rgba(0, 0, 0, 0.87);
    .mTop{
        /* margin-top: 73px; */
        // background: linear-gradient(337deg,$c1 15%,  $c4 4%);
        // background: linear-gradient($c2,$c3);
        // margin-top: -23%;
        // padding-top: 30%;
    }
        ul.ant-menu-inline-collapsed {
    width: 8px;

    }
        
    li.ant-menu-item{
        padding: 1px;
    }
</style>
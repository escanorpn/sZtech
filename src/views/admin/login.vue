<template>
<div class=" bgz">

     
    <div class="page-header" style="backgroundColor:#0f0404cc;padding-bottom: 50px;" >
   
  <!-- Card -->
  <mdb-card class="mTop1">
    <mdb-card-body>
       <div class="loading-box" v-if="loading1">
                <div class="loader"></div>
              </div>
              
      <form @submit="handleSubmit">
        <p class="h4 text-center py-4">Log in</p>
        <div class="grey-text">
        
          <mdb-input label="Your email" icon="envelope" group type="email" validate error="wrong" success="right" @input="hEmail"/>
     
          <mdb-input label="Your password" icon="lock" group type="password" validate @input="hPass"/>
        </div>
        <div class="text-center py-4 mt-3">
           <mdb-btn style="color:#e9ecef;background: linear-gradient(315deg,#3f0d12,#a71d31 74%);box-shadow: rgb(38 3 3) 1px 5px 5px;" color="" type="submit" :disabled="sending">Login</mdb-btn>
          <!-- <mdb-btn style="color:#e9ecef;background-color:#0c0f24;" color="" type="submit">Login</mdb-btn> -->
        </div>
        
      </form>

    <!-- <imd src="../../s/s1/api.php"/> -->
      
    </mdb-card-body>
    <mdb-btn style="color:#e9ecef;background: linear-gradient(315deg,#3f0d12,#a71d31 74%);box-shadow: rgb(38 3 3) 1px 5px 5px;" color="" v-on:click="signup" :disabled="sending">Sign up</mdb-btn>
  </mdb-card>
  <!-- Card -->
       <div class="position-absolute w-100 z-index-1 bottom-0" style="margin-top:303px">
        <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 40" preserveAspectRatio="none" shape-rendering="auto">
          <defs>
            <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
          </defs>
          <g class="moving-waves">
            <use xlink:href="#gentle-wave" x="48" y="-1" fill="rgba(255,255,255,0.40" />
            <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.35)" />
            <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.25)" />
            <use xlink:href="#gentle-wave" x="48" y="8" fill="rgba(255,255,255,0.20)" />
            <use xlink:href="#gentle-wave" x="48" y="13" fill="rgba(255,255,255,0.15)" />
            <use xlink:href="#gentle-wave" x="48" y="16" fill="rgba(255,255,255,0.95" />
          </g>
        </svg>
      </div>
</div>

</div>

</template>
<script>
  import { mdbInput, mdbBtn, mdbCard, mdbCardBody, } from 'mdbvue';
  import api from "../services/api";
  // const axios = require('axios');
  // import * as cr from 'vue-nacl-crypter' 
 
// const Dcrypt = cr.VueNaclCrypter

  function hasErrors(fieldsError) {
  return Object.keys(fieldsError).some(field => fieldsError[field]);
}
  export default {
    name: 'Basic',
    components: {
      mdbInput,
      mdbBtn,
      mdbCard,
      mdbCardBody,
      // mdSnackbar
    },
    
  data() {
    return {
      hasErrors,
      form: this.$form.createForm(this, { name: 'horizontal_login' }),
      pass:"empty",
      email:"empty",
      sending:false,
      loading1:false,
    }},
  mounted() {
       
    this.$nextTick(() => {
      // To disabled submit button at the beginning.
      this.form.validateFields();
    });
  },
  methods: {
    signup(){
       this.$router.push('/signup');
    },
    // Only show error after a field is touched.
    userNameError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched('userName') && getFieldError('userName');
    },
    // Only show error after a field is touched.
    passwordError() {
      const { getFieldError, isFieldTouched } = this.form;
      return isFieldTouched('password') && getFieldError('password');
    },

    handleSubmit(e) {
      
      e.preventDefault();
       this.loading1=true;
      //  alert(this.loading1)
      const form_data = new FormData();
       form_data.append('email',this.email);
       form_data.append('pass',this.pass);
      console.log(this.pass);

      this.sending=true;
//  const data = { 
//     email:this.email ,
//     password:this.pass
//  };
 const data ={
  "email": "admin@gmail.com",
  "password": "password"
 }
      // console.log(article)
// var murl=this.$store.state.mUrl;
// alert(murl);
api.post('login',data).then((response) => {
   this.loading1=false;
   console.log("response: "+ JSON.stringify(response));
   let access_token=response.data.token.original.access_token;
   if(response.data.val==22 & !response.data.error){
    this.$store.commit('setApikey',access_token)
     localStorage.setItem('access_token', access_token)
    // console.log("response1: "+ JSON.stringify(access_token));
    // console.log("response2: "+ this.$store.state.access_token);
    this.sending=false;

    this.$router.push('/Products');
    window.location.reload();
   }
}).catch(function () {
          //handle error
          // alert("error: "+response)
          // console.log("error: "+response)
           this.loading1=false;
      });

      this.sending=false;
     
      
      //   axios({
      //     method: 'POST',
      //     url: murl+'login?api_token=',
      //     data: data,
      //     config: { headers: {'Content-Type': 'application/json' }}
      // })
      // .then((response) => {
      //   console.log("response: "+response);
      //   console.log("response1: "+ JSON.stringify(response.data));
      //   // console.log("response2: "+response.data);
      //   if(response.data.val==22 & !response.data.error){
          
      //     var key=this.$store.state.mKey;
      //     console.log(key)
      //     // var cName = this.$Dcrypt.encrypt("response.data.name",  "key");
      //     var cId = Dcrypt.encrypt(key,null,  key);
          
      //     var cName=response.data.name;
      //     // var cId=response.data.id
      //     this.$cookies.set("admin",cName,"22min");
      //     this.$cookies.set("id",cId,"22min");
      //     this.$router.push('/Products');
          

      //     // this.$cookies.remove("id" ) 
      //   }


      // })
      // .catch(function (response) {
      //     //handle error
      //     console.log("error"+response)
      // });

    },
    hEmail (val) {
     this.email=val
    // console.log(val);
    },
    hPass (val) {
      this.pass=val
    // console.log(val);
    }
  },
  
  }
</script>


<style>

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
  .md-progress-bar {
    position: fixed;
    height:7px;
    top: 48px;
    right: 0;
    left: 0;
    z-index: 4;
  }

.cyan {
  margin-left: 50%;
  margin-right:50%;
 color:#e9ecef;
 background-color:#0c0f24 !important
}
 .bgz {
   /* margin-top: -102px; */
    /* padding-top: 100px; */
    /* padding-bottom: 100px; */
    /* The image used */
    background-image: url("../../assets/img/curved-images/curved.jpg");
    /* background-image: url("../assets/img/3.jpg"); */

    /* Full height */
    height: 100%;

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }
    .card {
        max-width: 400px;
        width:80%;
        margin-left:auto;
        margin-right:auto;
    }
    .mTop1{
        margin-top: 93px;
        margin-bottom: 93px;
    }
    .mRow {
        max-width: 875px;
    }
</style>
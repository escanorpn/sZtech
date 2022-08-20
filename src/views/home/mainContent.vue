<template> 
  <div >


     

   <Main  />
  </div>
</template>
<script>

  
import Main from "../admin/login.vue"
  // import $ from 'jquery'
  export default {
    name: 'AppPage',
    components: {

      Main
    },
      data() {
    return {
  
    }
  },
    methods:{
    
},

    mounted() {
   
  },

       
  
    
    
  };
</script>

<style scoped>

@import  "../../assets/css/soft-design-system.css?v=1.0.5";
  .wrap {
    margin-left: auto;
    margin-right: auto;
    width:90%;
    max-width: 900px;
  }
  .bg {
    /* The image used */
    background-image: url("../../assets/img/curved-images/curved1.jpg");
    /* background-image: url("../assets/img/3.jpg"); */

    /* Full height */
    height: 100%;

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
  }
    h1 {
      font-weight: bolder;
      letter-spacing: 8px;
    }
    h1, h5 {
      text-transform: uppercase;
    }

    h5 {
      letter-spacing: 3px;
          font-weight: 300;
    }

    .hr-light {
      border-top: 3px solid #fff;
      width: 80px;
    }
    .navbar {
      transition: 1s;
    }
    .navbar .md-form {
      margin: 0;
    }
    .top-nav-collapse {
      background-color: #78909c !important;
    }
    @media (max-width: 990px){
      .navbar {
        background-color: #78909c !important;
      }
    }
    .gradient {
      background: -moz-linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
      background: -webkit-linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
      background: -webkit-gradient(linear, 45deg, from(rgba(42, 27, 161, 0.7)), to(rgba(29, 210, 177, 0.7)));
      background: -o-linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
      background: linear-gradient(45deg, rgba(42, 27, 161, 0.7), rgba(29, 210, 177, 0.7) 100%);
    }
    h6 {
        line-height: 1.7;
    }
</style>
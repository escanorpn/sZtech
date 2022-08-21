<template>
<div>
   <!-- background: linear-gradient(rgb(0, 0, 0), rgb(0 0 0 / 88%), rgb(0 0 0 / 30%) 100%) -->
  <mdb-navbar  v-bind:class = "isMobile()?'mNavc':'dNavc'"   color="info" position="top" dark transparent scrolling style=" width:100%">
    <mdb-navbar-brand to="/" >
           <!-- <img src="./assets/img/flogo.jpeg" alt=" Cloudia" style="max-width:43px;background: radial-gradient(circle, rgba(255,255,255,1) 0%, rgb(0 0 0 / 0%) 100%);border-radius: 5px;" > -->
           <span style="color: white;font-weight: 500;text-shadow: rgb(203 109 255) 1px 1px 2px;">
    Zetech </span>
    </mdb-navbar-brand>

  </mdb-navbar>
   <main :style="{ marginTop: $store.state.docs ? '0px' : '0px' }">
      <transition name="fade" mode="out-in">
        <router-view></router-view>
      </transition>
    </main>
        
    <div v-if="$store.state.docs" color="stylish-color">
      <p class="footer-copyright mb-0 py-3 text-center">
        &copy; {{ new Date().getFullYear() }} 
        Copyright:
        <a
          href="/"
          >Zetech</a
        >
      </p>
    </div>
    </div>
</template>
<script>
  import { mdbNavbar, mdbNavbarBrand,  
  // mdbNavbarNav,
  // mdbNavbarToggler,
  //  mdbNavItem,
  //     mdbIcon 
      } from 'mdbvue';
  
import { isMobile } from 'mobile-device-detect';
  // alert(this.mib);
  export default {
    name: 'Home',
      props: ['isMobilez'],
       data() {
          return {
            cItems:0,
            mib:isMobile,
            // email:this.postEmail,
            msg:""
          }
        },
    components: {
      mdbNavbar,
      mdbNavbarBrand,
      // mdbNavbarNav,
      // mdbNavbarToggler,
      // mdbNavItem,
      // mdbIcon
      
      
     
    },
    methods: {
      add2cart(){
        if(this.$cookies.isKey("mp")){
          var mCarray=JSON.parse(this.$cookies.get("mp"))
          this.cItems=mCarray.length;    
            //  alert("cItems..."+this.cItems+"array= "+mCarray);
          }
      console.log("app");
      // this.$parent.add2cart();
    },
      isMobile1() {
        if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
          return true
        } else {
          return false
        }
      },
      isMobile() {
        return isMobile
      }
    },
      mounted() {
    this.add2cart();
  },
  }
</script>
<style>
.nav-link {
      color: white;
    text-shadow: 1px 1px 2px black;
    font-weight: 600 !important;
}
    .nav {
        background-color: #ffffff;
    }
    .mNavc{
      background-color: #000 !important;
      /* background: linear-gradient(177deg, rgb(0, 1, 2), #02092300); */
    }
    .dNavc{
      background-color: transparent;
    }
    .info-color {
            
        background-color:rgba(0, 0, 0, 0.231) !important;
}
.navbar-toggler{
  display: none !important;
}
</style>
<template>
  <Layout>
    <div style="margin-top: -15px; overflow-x: ;">

      <mdb-edge-header color="" style="position: fixed;
    z-index: 0;
    top: 0;
    height: 50%;
    width: 100%; " v-bind:style="{ backgroundColor: mcolor, }">
        <div class="home-page-background"></div>
      </mdb-edge-header>
  <mdb-card style="max-width: 1500px;width:99%;margin-top:102px">
    <mdb-card-body>

      <mlist :posts="products" />
     
    </mdb-card-body>
  </mdb-card>
     </div>
   
  </Layout>
</template>

<script>
import mlist from "./slist.vue"
import axios from "axios"
import {  mdbEdgeHeader,  mdbCard, mdbCardBody, } from 'mdbvue';
// import data from "./posts.json"

export default {
  components: {
    
    mlist,
    mdbEdgeHeader,
    mdbCard,
    mdbCardBody
  },
  

  data() {
    return {
      products: [],
      mcolor:this.$store.state.mcolor,
    }
  },
  methods: {
    // Helper function for extracting a nested image object
   
    async fetchNews() {
this.products=[];
        var murl=this.$store.state.mUrl;
       const mData = { 
    nm:"peter" ,
    // pass:this.pass
 };
    
axios({
          method: 'POST',
          // url: 'http://localhost/nw/vap/regApi.php?apicall=signup'
          url: murl+'api.php?apicall=a_services',
          data: mData,
          config: { headers: {'Content-Type': 'multipart/form-data' }}
      })
      .then((response) => {
         const results = response.data
         const myData = response.data.data
        // console.log("response: "+JSON.stringify(response));
        console.log("response1: "+ JSON.stringify(myData));
        
        if(results.val==2){
          console.log(myData)
            this.products = myData.map(post => ({
            
          id: post.pro.sid,
          name: post.pro.head,
          description: post.pro.description,
          img: post.im,
          // images: post.pro.img,
          // type: post.pro.type,
          // price: post.pro.price,
          // im: post.im
          // created_at: post.name,
          // updated_at: post.name
         
        }))
        }
       

      })
      .catch(function (response) {
          //handle error
          console.log("error"+response)
      });

    
    },
  },
  mounted() {
    this.fetchNews()
  },

}
</script>


<style lang="scss" scoped>
.card .card-body{
    padding: 0px;
   max-width: 1700px;
   width:99%;
  margin-left:auto;
  margin-right:auto;
}

    
</style>
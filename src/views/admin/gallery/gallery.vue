<template>
  <Layout>
    <div style="margin-top: -15px; overflow-x: ;">

  
     </div>
    <mlist :posts="products" />
   
  </Layout>
</template>

<script>
import mlist from "./slist.vue"
  import api from "../../services/api";
// import { mdbContainer, mdbCol, mdbRow,  mdbEdgeHeader,  mdbCardBody } from 'mdbvue';
// import data from "./posts.json"

export default {
  components: {
    // Layout,
    // NewsFilter,
    mlist,
    // mdbContainer,
    // mdbCol,
    // mdbRow,
    // mdbEdgeHeader,
    
    // mdbCardBody
  },
  

  data() {
    return {
      products: [],
    }
  },
  methods: {
    // Helper function for extracting a nested image object
   
    async fetchNews() {
this.products=[];
    
 api.get('company').then((response) => {
      // console.log("response: "+ JSON.stringify(response));
      const myData = response.data
    if(myData.val==2){
          console.log(myData)
            this.products = myData.data
        }
        console.log("products"+JSON.stringify(myData))
   
}).catch(function (response) {
          //handle error
          console.log("error"+response.response.status)
      });
      

    
    },
  },
  mounted() {
    // alert("hh")
    this.fetchNews()
  },

}
</script>
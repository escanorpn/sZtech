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
// import axios from "axios"

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
//         var murl=this.$store.state.mUrl;
//        const mData = { 
//     nm:"peter" ,
//     // pass:this.pass
//  };
     api.get('project').then((response) => {
      // console.log("response: "+ JSON.stringify(response));
      const myData = response.data
        
 if(myData.val==2){
         
        console.log("project"+JSON.stringify(myData))
          this.products = myData.data.map(post => ({
          id: post.id,
          name: post.duration,
          description: post.description, 
          // img: post.images,
         
        }))
        }
        console.log("products"+JSON.stringify(myData))
   
}).catch(function (response) {
          //handle error
          console.log("error"+response.response.status)
      });
      
    
    },
  },
  mounted() {
    this.fetchNews()
  },

}
</script>
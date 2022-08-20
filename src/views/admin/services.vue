<template>
  <Layout>
    <div style="margin-top: -15px; overflow-x: ;">

  
     </div>
    <mlist :posts="products" />
   
  </Layout>
</template>

<script>
import mlist from "./slist.vue"
  import api from "../services/api";
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
     api.get('service').then((response) => {
      // console.log("response: "+ JSON.stringify(response));
      const myData = response.data
        
 if(myData.val==2){
         
        console.log("products1"+JSON.stringify(myData))
          this.products = myData.data.map(post => ({
          id: post.id,
          name: post.name,
          description: post.description, 
          img: post.images,
         
        }))
        }
        console.log("products"+JSON.stringify(myData))
   
}).catch(function (response) {
          //handle error
          console.log("error"+response.response.status)
      });
// axios({
//           method: 'POST',
//           // url: 'http://localhost/nw/vap/regApi.php?apicall=signup'
//           url: murl+'api.php?apicall=a_services',
//           data: mData,
//           config: { headers: {'Content-Type': 'multipart/form-data' }}
//       })
//       .then((response) => {
//          const results = response.data
//          const myData = response.data.data
//         // console.log("response: "+JSON.stringify(response));
//         console.log("response1: "+ JSON.stringify(myData));
        
//         if(results.val==2){
//           console.log(myData)
//             this.products = myData.map(post => ({
            
//           id: post.pro.sid,
//           name: post.pro.head,
//           description: post.pro.description, 
//           img: post.im,
//           // images: post.pro.img,
//           // type: post.pro.type,
//           // price: post.pro.price,
//           // im: post.im
//           // created_at: post.name,
//           // updated_at: post.name
         
//         }))
//         }
       

//       })
//       .catch(function (response) {
//           //handle error
//           console.log("error"+response)
//       });

    
    },
  },
  mounted() {
    this.fetchNews()
  },

}
</script>
<template>
   
<div >

    <Main  />
    <!-- <Services  /> -->
    
  </div>
  
</template>

<script>
import Main from "./home/mainContent.vue"
// import Services from "./home/services.vue"
export default {
  props: {
    posts: {
      type: Array,
      required: true,
    },
  },
  components: {
    Main,
    // Services,
  },
}
</script>

<style>

</style>
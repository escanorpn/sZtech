<template>
   
<div data-v-320224c2="" data-v-40b8d964="" class="row" data-v-35ea163e="" style="padding-left:1px;padding-right:1px;" id="div2">
 <md-progress-bar md-mode="indeterminate" v-if="sending" />
    <item v-for="(post, index) in posts" :key="index" :post="post" />
    
  </div>
  
</template>

<script>
import item from "./item.vue"
export default {
  props: {
    posts: {
      type: Array,
      required: true,
    },
  },
  data:()=>({
 sending: false,
  }),
  components: {
    item,
  },
  methods:{
     reload(){
       console.log("list_reload");
        this.$parent.fetchNews();
    },
     loading(){
       console.log("loading");
        this.sending=true;
    },
     done(){
      //  console.log("list_reload");
        this.sending=false;
    },

  },
}
</script>

<style>
#div2{
width: 100%; max-width: 1200px; padding: 22px;margin-top: 20px; margin-right: auto; margin-left: auto;  box-shadow: 0px 8px 22px #00000036;
}
.md-progress-bar {
    position: fixed;
    height:7px;
    top: 48px;
    right: 0;
    left: 0;
    z-index: 3;
  }
</style>
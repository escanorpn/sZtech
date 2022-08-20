<template>
<div data-v-5e2edc68="" data-v-40b8d964="" class="mb-5 col-md-6" data-v-320224c2="" v-if="post.name">


     <mdb-card v-animateOnScroll="{animation: 'fadeInLeft', delay: 30}" wide>
      
      <mdb-view hover cascade class="ms">
          <a-carousel effect="slide" arrows  >
            <div
              slot="prevArrow"
              class="custom-slick-arrow"
              style="left: 10px;zIndex: 1"
            >
              <a-icon type="left-circle" />
            </div>
            <div slot="nextArrow"  class="custom-slick-arrow" style="right: 10px">
              <a-icon type="right-circle" />
            </div>
          
            <div  v-for="(item,index) in sm1" :key="index"  >
              <img  :src="murl+item.url" alt="Card image cap" class="ms1"/>
                <mdb-mask flex-center waves overlay="white-slight"></mdb-mask>
            </div>
          </a-carousel>
      </mdb-view>

		<mdb-card-body class="text-center pb-0" cascade>
      <h5>{{post.name }}</h5>
      <mdb-card-text>{{post.description}}</mdb-card-text>

					
		</mdb-card-body>

       <div class="float-center" style="margin-left: auto;margin-right: auto;" @click="reload"><mdb-btn  color="danger" rounded>Delete</mdb-btn></div>

       
      <!-- <div class="float-center" style="margin-left: auto;margin-right: auto;" >
         <router-link to="/motocycles" >
          <mdb-btn  color="primary" rounded>Contact for more info</mdb-btn>
        </router-link>
      </div> -->
  
	</mdb-card>
  
        </div>
</template>

<script>
import {   mdbCard, mdbCardBody,animateOnScroll, mdbBtn} from 'mdbvue';
      
// import { slider, slideritem } from 'vue-concise-slider'

import api from "../services/api";
export default {
   name: 'HomePage',
  components: {

  mdbBtn,
  mdbCard,
  mdbCardBody,

  // mdbCardImage,
  // mdbCardFooter,
  // slider,
  // slideritem
  },  directives: {
    animateOnScroll
  },
  props: {
    post: {
      type: Object,
      required: true,
    },
  },
  data() {
  return {
    isBold: false,
    
    id:0,
     murl:this.$store.state.iUrl,
     sm1:[],
    someList:[
          {
            html: "https://mdbootstrap.com/img/Photos/Others/photo6.jpg",
            style: {
              'background': '#1bbc9b'
            }
          },
          {
            html: 'https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20%286%29.jpg',
            style: {
              'background': '#4bbfc3'
            }
          },
          {
            html: '../../files',
            style: {
              'background': '#7baabe'
            }
          }
        ],
        //Slider configuration [obj]
        options: {
          currentPage: 0,
          effect:'slide',
          // thresholdDistance: 500,
          // thresholdTime: 100,
          // autoplay:3000,
          loop:true,
          // preventDocumentMove:true
          // // direction:'vertical',
          // loopedSlides:1,
          // slidesToScroll:1
        }
    
  }
},
  methods: {

 reload(){
   this.$parent.loading();
   
   this.id=this.post.id;
 
  
api.delete('product/'+this.id).then((response) => {
      console.log("response: "+ JSON.stringify(response));
      const myData = response.data
        
 if(response.data.val==2 ){
            this.$parent.reload();
              console.log("item_deleted"+this.id);
          }
        this.$parent.done();
        console.log("products"+JSON.stringify(myData))
   
}).catch(function (response) {
          //handle error
          console.log("error"+response.response.status)
      });
       

    }
  },
  mounted() {
    // this.fetchNews()
    // this.currency();
    this.sm1=this.post.img;
    console.log("im: "+JSON.stringify(this.post.img))
  },
}
</script>
<style scoped>
.ms{
      box-shadow: 0 5px 11px 0 rgb(0 0 0 / 18%), 0 4px 15px 0 rgb(0 0 0 / 15%);
    /* margin-left: -22px;
    margin-right: -22px; */
    /* margin-top: 22px; */
    margin-bottom: 22px;
    background-color: #e9ecef;
}
.ms1{
  /* max-width: 340px;
    width: 100%; */
    max-width: 100%;
    /* height: 2222px; */
    max-height: 234px;
    margin-left: auto;
    margin-right: auto;
}
/* For demo */
.ant-carousel >>> .slick-slide {
  text-align: center;
  height: 190px;
  /* max-height: 360px; */
  /* height: 70%; */
  line-height: 160px;
  background: #02050a;
  overflow: hidden;
}

.ant-carousel >>> .custom-slick-arrow {
  width: 25px;
  height: 25px;
  font-size: 25px;
  color: #fff;
  background-color: rgba(31, 45, 61, 0.11);
  opacity: 0.3;
}
.ant-carousel >>> .custom-slick-arrow:before {
  display: none;
}
.ant-carousel >>> .custom-slick-arrow:hover {
  opacity: 0.5;
}

.ant-carousel >>> .slick-slide h3 {
  color: #fff;
}
.ant-carousel .slick-dots li{
background-color: aqua;
}
.card .card-body{
    margin-top: -32px;
    font-family: Arial, Helvetica, sans-serif;
}
</style>
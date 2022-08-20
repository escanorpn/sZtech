<template>
<div data-v-5e2edc68="" data-v-40b8d964="" class="mb-5 col-md-6" data-v-320224c2="" v-if="post.name">


 <!-- <div style="width:100%;margin:20px auto;height:400px">

      <slider ref="slider" :options="options">
          
          <slideritem v-for="(item,index) in someList" :key="index" :style="item.style"> 
				<mdb-card-image :src="item.html" alt="Card image cap" ></mdb-card-image>
            </slideritem>
          
          <div slot="loading">loading...</div>
      </slider>
 </div> -->

     <mdb-card v-animateOnScroll="{animation: 'fadeInLeft', delay: 30}" wide>
		<mdb-view hover cascade class="ms">
        <a-carousel effect="slide" arrows >
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
      <img  :src="murl+item.loc" alt="Card image cap" class="ms1"/>
				<mdb-mask flex-center waves overlay="white-slight"></mdb-mask>
    </div>
  </a-carousel>
			<!-- <slider ref="slider" :options="options">
         
          <slideritem v-for="(item,index) in someList" :key="index" > 
         <div>
      <mdb-card-image  :src="item.html" alt="Card image cap" ></mdb-card-image>
				<mdb-mask flex-center waves overlay="white-slight"></mdb-mask>
    </div>
            </slideritem>
          
          <div slot="loading">loading...</div>
      </slider> -->
       
       
		</mdb-view>
		<mdb-card-body class="text-center pb-0" cascade>
     
   <p style="text-align: center;float:left"><b>{{post.name }}</b></p>   
<p style="text-align: center;"><b>Price: </b> {{post.price }}</p>
        <!-- <h4><b>Description</b></h4> -->
        <p>{{post.description}}</p>
   
			<!-- <mdb-card-title></mdb-card-title> -->
			<!-- <mdb-card-footer class="text-muted mt-4">2 days ago</mdb-card-footer> -->
		</mdb-card-body>
<!--     
       <router-link :to="'/post/' + post.id+ '/'+post.name + '/'+post.occupation+ '/' +post.email+ '/' +post.bio + '/edit'" class="float-center" style="margin-left: auto;margin-right: auto;"><mdb-btn  color="primary" rounded>Delete</mdb-btn></router-link> -->
       
       <div class="float-center" style="margin-left: auto;margin-right: auto;" @click="reload"><mdb-btn  color="danger" rounded>Delete</mdb-btn></div>
	</mdb-card>
  
        </div>
</template>

<script>
import {   mdbCard, mdbCardBody,mdbView,mdbMask, animateOnScroll, mdbBtn} from 'mdbvue';
      
// import { slider, slideritem } from 'vue-concise-slider'
 const axios = require('axios');
export default {
   name: 'HomePage',
  components: {

  mdbBtn,
  mdbCard,
  // mdbCardTitle,
  // mdbCardText,
  mdbCardBody,
  mdbView,
  mdbMask,
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
    mId:0,
    id:0,
     murl:this.$store.state.mUrl,
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
 currency(){
  // Create our number formatter.
var formatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'Ksh',

  // These options are needed to round to whole numbers if that's what you want.
  //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
  //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
});

console.log(formatter.format(2500))
this.post.price= formatter.format(2500);
},
 reload(){
   this.$parent.loading();
   
   this.id=this.post.id;
   this.mId=this.post.img;
    const article = { 
    id:this.id,
    // mid:this.mId
  };
      console.log("item_reload"+this.id);
  var murl=this.$store.state.mUrl;
   axios({
          method: 'POST',
          // url: 'http://localhost/nw/vap/regApi.php?apicall=signup'
          url: murl+'api.php?apicall=del_m',
          data: article,
          config: { headers: {'Content-Type': 'multipart/form-data' }}
      })
      .then((response) => {
        // console.log("response: "+response);
        console.log("response1: "+ JSON.stringify(response.data));
        // console.log("response2: "+response.data);
          if(response.data.val==22 & !response.data.error){
            this.$parent.reload();
              console.log("item_deleted"+this.id);
          }
        this.$parent.done();
      })
      .catch(function (response) {
          //handle error
          console.log("error"+response)
      });
       

    }
  },
  mounted() {
    // this.fetchNews()
    this.currency();
    this.sm1=this.post.im;
    console.log(JSON.stringify(this.post.im))
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
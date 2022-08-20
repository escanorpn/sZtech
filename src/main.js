import '@fortawesome/fontawesome-free/css/all.min.css'
import 'bootstrap-css-only/css/bootstrap.min.css'
import 'mdbvue/lib/css/mdb.min.css'


// import Vue from 'vue'
import VueMaterial from 'vue-material'
import 'vue-material/dist/vue-material.min.css'
import 'vue-material/dist/theme/default.css'


import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueLazyload from 'vue-lazyload'
import api from "./views/services/api";
import { ClientTable} from 'vue-tables-2';

import VueCookies from 'vue-cookies'
import * as cr from 'vue-nacl-crypter'
import vuetify from './plugins/vuetify'
import VeeValidate from 'vee-validate';


const Dcrypt = cr.VueNaclCrypter

Vue.use(Dcrypt)
Vue.use(VueCookies)
Vue.$cookies.config('7d')

Vue.use(VueAxios, axios)
Vue.use(Antd);
Vue.config.productionTip = false
Vue.use(VueMaterial)
Vue.use(VueLazyload)
Vue.use(ClientTable);
Vue.use(VeeValidate);
// Vue.use(isMobile)

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')


Vue.config.productionTip = false;
Vue.prototype.$http = api;
// Vue.use(api);
api.defaults.timeout = 10000;
api.interceptors.request.use(
  config => {
    // const token = localStorage.getItem("access_token");
    const token = this.$store.state.access_token;
    if (token) {
      config.headers.common["Authorization"] ="Bearer "+ token;
      
    }
    // config.headers.common["Bearer Token"] = "dddd";
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);
api.interceptors.response.use(
  response => {
    if (response.status === 200 || response.status === 201) {
      return Promise.resolve(response);
    } else {
      return Promise.reject(response);
    }
  },
error => {
    if (error.response.status) {
      switch (error.response.status) {
        case 400:
         
         //do something
          break;
      
        case 401:
          alert("session expired");
          break;
        case 403:
          router.replace({
            path: "/admin",
            query: { redirect: router.currentRoute.fullPath }
          });
           break;
        case 404:
          alert('page not exist');
          break;
        case 502:
         setTimeout(() => {
            router.replace({
              path: "/admin",
              query: {
                redirect: router.currentRoute.fullPath
              }
            });
          }, 1000);
      }
      return Promise.reject(error.response);
    }
  }
);
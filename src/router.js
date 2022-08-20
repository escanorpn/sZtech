import Vue from 'vue'
import Router from 'vue-router'
// import Home from './views/Home.vue'
// import Results from './views/Results.vue'
import Init from './views/init.vue'
// import Main from './views/mainContent.vue'
import Admin from './views/admin/login.vue'
import Signup from './views/admin/signup.vue'
import Hod from './views/admin/hod/hod.vue'
import Lib from './views/admin/lib/main.vue'
import Libf from './views/admin/lib/form.vue'
import Products from './views/admin/products.vue'


Vue.use(Router)
const isLoggedIn=(to,from,next)=>{
  
  if(localStorage.getItem('access_token')){
    // console.log("Logged in")
    next()
  }else{
    // return false
    // next()
    return '/Admin'
    // return { name: '/admin' }
    // from();
  }
  
}
export default new Router({
  routes: [
    
    {
      path: '/',
      name: 'Init',
      component: Init
    },
  
    {
      path: '/admin',
      name: 'Admin',
      component: Admin
    },
    {
      path: '/signup',
      name: 'Signup',
      component: Signup
    },
    {
      path: '/products',
      name: 'Products',
      component: Products,
      beforeEnter:isLoggedIn
    },
    {
      path: '/hod',
      name: 'Hod',
      component: Hod,
      beforeEnter:isLoggedIn
    },
    {
      path: '/lib',
      name: 'Lib',
      component: Lib,
      beforeEnter:isLoggedIn
    },
    {
      path: '/libf',
      name: 'Libf',
      component: Libf,
      beforeEnter:isLoggedIn
    },
    
    
    
    
   
  ]
})

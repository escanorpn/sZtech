// import axios from 'axios'
import store from '../../store'

import router from '../../router'
var murl=store.state.mUrl;

// const access_token1 = store.state.access_token;
const access_token = localStorage.getItem('access_token');
// // alert(access_token1)
// // alert(access_token)
// export default axios.create({
//  baseURL: murl,
//  headers: {
//  'Accept': 'application/json',
//  'Content-Type': 'application/json',
//  'Authorization':'Bearer '+access_token
//  }
//  })

import axios from 'axios';
// const axios = require('axios');

// Step-1: Create a new Axios instance with a custom config.
// The timeout is set to 10s. If the request takes longer than
// that then the request will be aborted.
const customAxios = axios.create({
    baseURL: murl,
    timeout: 20000, 
    // headers: { 'api-key': 'eyJz-CI6Ikp-4pWY-lhdCI6' }
});

// Step-2: Create request, response & error handlers
const requestHandler = request => {
    // Token will be dynamic so we can use any app-specific way to always   
    // fetch the new token before making the call
    request.headers.Authorization = 'Bearer '+access_token;  
  console.log(JSON.stringify(request))
    return request;
};

const responseHandler = response => {
    if (response.status === 401) {
        router.push('/Admin');
    }else if (response.data.code === 401) {
        router.push('/Admin');
    }

    return response;
};

const errorHandler = error => {
    if(error.message){
        alert("error: "+error.message)
        console.log("err: "+JSON.stringify(error.message))
    }
    if(error.response!=undefined){
      
        if(error.response.status==401){
            router.push('/Admin');
                // alert(error)
        }
            
    }
    return Promise.reject(error);
    
};

// Step-3: Configure/make use of request & response interceptors from Axios
// Note: You can create one method say configureInterceptors, add below in that,
// export and call it in an init function of the application/page.
customAxios.interceptors.request.use(
    (request) => requestHandler(request),
    (error) => errorHandler(error)
);

customAxios.interceptors.response.use(
    (response) => responseHandler(response),
    (error) => errorHandler(error)
 );


// Step-4: Export the newly created Axios instance to be used in different locations.
export default customAxios;
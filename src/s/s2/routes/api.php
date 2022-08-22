<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\HodController;
use App\Http\Controllers\LibController;
use App\Http\Controllers\FinanceController;
use App\Http\Controllers\GownController;
use App\Http\Controllers\student;

use App\Http\Controllers\RoleController;
// use App\Http\Controllers\ProductController;
// use App\Http\Controllers\CompanyController;
// use App\Http\Controllers\ServiceController;
// use App\Http\Controllers\ProjectController;
// use App\Http\Controllers\RecipeController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/new_register', [AuthController::class, 'register']);
    Route::post('/signup', [AuthController::class, 'signup']);
    // Route::get('/hod', [HodController::class, 'index']); 
    // Route::post('/logout', [AuthController::class, 'logout']);
    // Route::post('/refresh', [AuthController::class, 'refresh']);
    // Route::get('/user-profile', [AuthController::class, 'userProfile']);    
});
Route::group(['middleware' => ['jwt.verify'],
'prefix' => 'auth'], function() {

});
Route::group(['middleware' => ['role:admin'],
'prefix' => 'auth'], function() {
    Route::post('/role', [RoleController::class, 'create']); 
});
Route::group(['middleware' => ['role:rec'],
'prefix' => 'auth'], function() {
    Route::get('/rec', [HodController::class, 'index']);
    Route::get('/rcleared_user', [HodController::class, 'cleared_user']);  
    Route::post('/rec_u', [HodController::class, 'rupdate']); 
});

Route::group(['middleware' => ['role:hod'],
'prefix' => 'auth'], function() {
    Route::get('/hod', [HodController::class, 'index']);
    Route::get('/cleared_user', [HodController::class, 'cleared_user']); 
    Route::get('/hod_a', [HodController::class, 'HodStudents']); 
    Route::post('/hod', [HodController::class, 'create']); 
    Route::post('/hod_u', [HodController::class, 'update']); 
    Route::post('/hod_u1', [HodController::class, 'update1']); 
    Route::delete('/hod/{id}', [HodController::class, 'destroy']);
});

Route::group(['middleware' => ['role:lib'],
'prefix' => 'auth'], function() {
    Route::get('/lib', [LibController::class, 'index']);
    Route::get('/lib_all', [LibController::class, 'all']); 
    Route::get('/lib_a', [LibController::class, 'StudentArears']); 
    Route::post('/lib_d', [LibController::class, 'Libdata']); 
    
    Route::post('/lib', [LibController::class, 'create']); 
    Route::post('/u_lib', [LibController::class, 'update']);
    Route::post('/lib_u', [LibController::class, 'update1']); 
    Route::post('/lib_del', [LibController::class, 'destroy']); 
    Route::post('/lswitch', [LibController::class, 'switch']); 
});
Route::group(['middleware' => ['role:finance'],
'prefix' => 'auth'], function() {
    Route::get('/finance', [FinanceController::class, 'index']); 
    Route::get('/finance_f', [FinanceController::class, 'StudentArears']); 
    Route::get('/finance_all', [FinanceController::class, 'all']); 
    Route::post('/finance', [FinanceController::class, 'create']); 
    Route::post('/finance_u', [FinanceController::class, 'update1']); 
    Route::post('/payment', [FinanceController::class, 'payment']); 
    Route::post('/finance_d', [FinanceController::class, 'Userdata']);
    Route::post('/finance_del', [FinanceController::class, 'destroy']);
    Route::post('/fswitch', [FinanceController::class, 'switch']); 
});

Route::group(['middleware' => ['role:gown'],
'prefix' => 'auth'], function() {
    Route::get('/gown', [GownController::class, 'index']); 
    Route::get('/gown_f', [GownController::class, 'StudentGowns']); 
    Route::get('/gown_all', [GownController::class, 'all']); 
    Route::post('/gown', [GownController::class, 'create']); 
    Route::post('/gown_u', [GownController::class, 'update']); 
    Route::post('/gown_d', [GownController::class, 'Userdata']); 
    Route::post('/gown_del', [GownController::class, 'destroy']); 
    Route::post('/switch', [GownController::class, 'switch']); 
});

Route::group(['middleware' => ['role:student'],
'prefix' => 'auth'], function() {
    Route::post('/student', [student::class, 'getData']); 
    Route::post('/student_l', [student::class, 'libData']); 
    Route::post('/student_f', [student::class, 'financeData']);
    Route::post('/student_g', [student::class, 'gownData']);
    Route::post('/student_u', [student::class, 'updateData']); 

    
    Route::post('/slib_d', [LibController::class, 'Libdata']); 
    Route::post('/sfinance_d', [FinanceController::class, 'Userdata']);
    Route::post('/sgown_d', [GownController::class, 'Userdata']); 
});


// Route::get('/hod1', 'App\Http\Controllers\HodController@index')->middleware('role:hod');
Route::get('/company', [CompanyController::class, 'index']);
Route::get('/company_limited', [CompanyController::class, 'index_limited']);
Route::get('/service', [ServiceController::class, 'index']); 
Route::get('/product', [ProductController::class, 'index']);
Route::get('/product_limited', [ProductController::class, 'index_limited']);
Route::get('/project', [ProjectController::class, 'index']);
Route::get('/recipe', [RecipeController::class, 'index']);

Route::get('/', function()
{
    return 'Hello World';
});

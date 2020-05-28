<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Login && Registration

// seller product list
Route::post('/app/upload', "AdminController@upload");
Route::post('/app/storeProduct','AdminController@storeProduct');
Route::post('/app/editProduct','AdminController@editProduct');
Route::get('/app/showProduct','AdminController@showProduct');
Route::post('/app/deleteProduct','AdminController@deleteProduct');
Route::get('/app/showsubCategoryforProduct','AdminController@showsubCategoryforProduct');
// category

Route::get('/app/indexCategory','AdminController@indexCategory');

// sub category

// Employee  
Route::get('/app/getMonthAbsent/{id}', "AdminController@getMonthAbsent");
Route::get('/app/singleEmployee/{id}', "AdminController@singleEmployee");
Route::get('/app/getSingleEmployeeStats/{id}', "AdminController@getSingleEmployeeStats");

Route::get('/app/employee', "AdminController@showEmployee");
Route::post('/app/employee', "AdminController@storeEmployee");
Route::put('/app/employee', "AdminController@editEmployee"); 
Route::delete('/app/employee', "AdminController@deleteEmployee");

// designation 
Route::get('/app/designation', "AdminController@showDesignation");
Route::post('/app/designation', "AdminController@storeDesignation");
Route::put('/app/designation', "AdminController@editDesignation");
Route::delete('/app/designation', "AdminController@deleteDesignation");

// client 
Route::get('/app/client', "AdminController@showClient");
Route::post('/app/client', "AdminController@storeClient");
Route::put('/app/client', "AdminController@editClient");
Route::delete('/app/client', "AdminController@deleteClient");

// project 
Route::get('/app/runningProject', "AdminController@showrunningProject");
Route::get('/app/completedProject', "AdminController@showcompletedProject");
Route::get('/app/project', "AdminController@showProject");
Route::post('/app/project', "AdminController@storeProject");
Route::put('/app/project', "AdminController@editProject");
Route::delete('/app/project', "AdminController@deleteProject");

// Assignproject 

Route::get('/app/assignproject', "AdminController@showAssignproject");
Route::post('/app/assignproject', "AdminController@storeAssignproject");
Route::put('/app/assignproject', "AdminController@editAssignproject");
Route::delete('/app/assignproject', "AdminController@deleteAssignproject");

// AssignTask 

Route::get('/app/singleAssignTask/{id}', "AdminController@singleAssignTask");
Route::get('/app/allTaskByEmployee/{id}', "AdminController@allTaskByEmployee");
Route::get('/app/taskListByEmployeeAndProject', "AdminController@showTaskListByEmployeeAndProject");
Route::get('/app/AssignTask', "AdminController@showAssignTask");
Route::post('/app/AssignTask', "AdminController@storeAssignTask");
Route::put('/app/AssignTask', "AdminController@editAssignTask");
Route::delete('/app/AssignTask', "AdminController@deleteAssignTask");

// Employee Attendance  
Route::get('/app/Attendance', "AdminController@showAttendance");
Route::post('/app/Attendance', "AdminController@storeAttendance");
Route::put('/app/Attendance', "AdminController@editAttendance");
Route::delete('/app/Attendance', "AdminController@deleteAttendance");

// Employee Attendance  
Route::get('/app/extraOuting', "AdminController@showExtraOuting");
Route::post('/app/extraOuting', "AdminController@storeExtraOuting");
Route::put('/app/extraOuting', "AdminController@editExtraOuting");
Route::delete('/app/extraOuting', "AdminController@deleteExtraOuting");

// Puase Tasks 
Route::post('/app/puaseTask', "AdminController@pauseTask");
Route::put('/app/puaseTask', "AdminController@startTask");





// User Controller 

Route::get('/app/getMonthAbsent', "UserController@getMonthAbsent");
Route::get('/app/singleEmployee', "UserController@singleEmployee");

Route::post("/app/registration","UserController@registration");
Route::post("/app/login","UserController@login");
Route::get('/login', function () { return view('auth.login');})->name('login');
// user profile
Route::get('/app/profile/{id}', "UserController@showsingleProfile");
Route::post('/app/edit_profile', "UserController@updateProfile");
Route::post('/app/upload', "UserController@upload");

// user running project 

Route::get('/app/userDashboardproject', "UserController@showUserDashboardProject");
Route::get('/app/user_project', "UserController@showProject");
Route::post('/app/EmployeeTask', "UserController@storeEmployeeTask");
Route::get('/app/EmployeeTask', "UserController@showEmployeeTask");
Route::put('/app/EmployeeTask', "UserController@editEmployeeTask");
Route::delete('/app/EmployeeTask', "UserController@deleteEmployeeTask");

// Password Reset
Route::post("/app/passwordresetGetEmail","UserController@passwordresetGetEmail");
Route::post("/app/resetPassword","UserController@resetPassword");
Route::post('/app/matchPasswordLink','UserController@matchPasswordLink');
Route::post('/app/changePassword','UserController@changePassword');

// Employee Attendance  
Route::get('/app/user/EmployeeAttendance', "UserController@showEmployeeAttendance");
Route::post('/app/user/EmployeeAttendance', "UserController@storeEmployeeAttendance");
Route::put('/app/user/EmployeeAttendance', "UserController@editEmployeeAttendance");
Route::delete('/app/user/EmployeeAttendance', "UserController@deleteEmployeeAttendance");
// 
Route::get('/app/user/extraOuting', "UserController@showExtraOuting");
Route::post('/app/user/extraOuting', "UserController@storeExtraOuting");

// Puase Tasks 
Route::post('/app/user/puaseTask', "UserController@pauseTask");
Route::put('/app/user/puaseTask', "UserController@startTask");




Route::get('/logout', function () {
    Auth::logout();
    Session::flush();
    return redirect("/login");
});
Route::any('{slug}', 'UserController@home')->where('slug', '([A-z_\0-9-\s]+)?');

// Auth::routes();

// Route::get('/home', 'HomeController@index')->name('home');

<?php

use Illuminate\Http\Request;

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
//Auth::routes();
Route::post('login', 'Auth\LoginController@login');
Route::post('register', 'Auth\RegisterController@register');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//step 1
Route::resource('job_roles', 'JobRoleController');
//step 2
Route::resource('employees', 'EmployeeController');
//step 3
Route::resource('day_leaves', 'DayLeaveController');
Route::resource('short_leaves', 'ShortLeaveController');
Route::resource('official_leaves', 'OfficialLeaveController');

//step 4
Route::resource('head_approves', 'HeadLeaveApproveController');

//step 5
Route::resource('record_months', 'RecordMonthController');

//Dashboard Controller Methods
Route::get('users', 'DashboardController@users');
Route::get('samejob/{username}', 'DashboardController@samejob');
Route::get('supervisors', 'DashboardController@supervisors');
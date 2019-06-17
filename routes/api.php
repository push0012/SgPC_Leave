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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('job_roles', 'JobRoleController');
Route::resource('employees', 'EmployeeController');
Route::resource('day_leaves', 'DayLeaveController');
Route::resource('short_leaves', 'ShortLeaveController');
Route::resource('official_leaves', 'OfficialLeaveController');
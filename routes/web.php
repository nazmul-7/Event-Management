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

Route::get('/', function () { 
    return view('welcome');
});

// Login && Registration
Route::post("/app/registration","UserController@registration");
Route::post("/app/login","UserController@login");

// Password Reset
Route::post("/app/passwordresetGetEmail","UserController@passwordresetGetEmail");
Route::post("/app/resetPassword","UserController@resetPassword");
Route::post('/app/matchPasswordLink','UserController@matchPasswordLink');

// Profile

Route::get( 'app/getProfileInfo/{id}', 'UserController@getProfileInfo');
Route::post( 'app/updateUserInfo', 'UserController@updateUserInfo');
Route::post( 'app/getUserImage', 'UserController@getUserImage');
Route::get( 'app/getWorkingEventList', 'EventController@getWorkingEventList');
Route::get( 'app/getTotalWokingHours', 'EventController@getTotalWokingHours');



// Event 

Route::post( 'app/eventRegistration', 'EventController@eventRegistration');
Route::post( 'app/applyInEvent', 'EventController@applyInEvent');
Route::post( 'app/updateEventStatus', 'EventController@updateEventStatus');
Route::post( 'app/unaapplyEvent', 'EventController@unaapplyEvent');
Route::get( 'app/getRunningEvents', 'EventController@getRunningEvents');
Route::post( 'app/deleteService', 'EventController@deleteService');

// a
Route::get( 'app/getAllWorkingEventList', 'EventController@getAllWorkingEventList');
Route::get( 'app/getUserList', 'EventController@getUserList');
Route::get( 'app/getAllOldEventList', 'EventController@getAllOldEventList');
Route::post( 'app/getServiceDetails', 'EventController@getServiceDetails');
Route::post( 'app/eventUpdate', 'EventController@eventUpdate');
Route::post( 'app/updateUser', 'EventController@updateUser');
Route::post( 'app/deleteUser', 'EventController@deleteUser');


// Contact 
Route::post("app/contactus", "UserController@contactus");




Route::get('/logout', function () {
    Auth::logout();
    Session::flush();
    return redirect("/");
});
Route::any('{slug}', function(){
    return view('welcome');
})->where('slug', '([A-z\d-\/_.]+)?');

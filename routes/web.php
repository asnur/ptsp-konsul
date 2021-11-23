<?php

use App\Http\Controllers\CreateUserController;
use App\Http\Controllers\SocialiteController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

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
    return redirect()->to('/konsultasi');
});

Route::get('/create_user', [CreateUserController::class, 'index']);

Auth::routes();

Route::get('/auth/redirect', [SocialiteController::class, 'redirectToProvider'])->name('login-google');
Route::get('/auth/callback', [SocialiteController::class, 'handleProviderCallback']);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

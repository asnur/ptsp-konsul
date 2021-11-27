<?php

use App\Http\Controllers\CreateUserController;
use App\Http\Controllers\SocialiteController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
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

function name_file()
{
    return rand(11111, 99999) . ".pdf";
}


Route::get('/kel/{kel}/name/{name}', function ($kel, $name_file) {
    return redirect()->to('/')->withCookie(cookie('kelurahan', $kel, 1))->withCookie(cookie('konsul', 1, 1))->withCookie(cookie('name_file', $name_file . ".pdf", 1));
})->name('save-kel');

Route::post('/save_pdf', function (Request $request) {
    $data = base64_decode($request->input('data'), true);
    file_put_contents("pdf_file/" . $request->input('name_file'), $data);
});

Route::get('/', function () {
    return redirect()->to('/konsultasi');
});


Route::get('/create_user', [CreateUserController::class, 'index']);

Auth::routes();

Route::get('/auth/redirect', [SocialiteController::class, 'redirectToProvider'])->name('login-google');
Route::get('/auth/callback', [SocialiteController::class, 'handleProviderCallback']);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

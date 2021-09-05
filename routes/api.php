<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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

Route::post('/login',[\App\Http\Controllers\ApiController::class, 'login']);

Route::middleware('auth:sanctum')->group(function (){

    Route::post('/answer', [\App\Http\Controllers\ApiController::class, 'answer']);
    Route::post('/skills', [\App\Http\Controllers\ApiController::class, 'skills']);

});

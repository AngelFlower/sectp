<?php

use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\RegisterController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\FishTankController as FishTankControllerV1;
use App\Http\Controllers\Api\V1\TemperatureController as TemperatureControllerV1;
use App\Http\Resources\V1\FishTankResource;

// V1 api routes

Route::group(['prefix' => 'v1'], function () {
    Route::post('login', [LoginController::class, 'login']);
    Route::post('register', [RegisterController::class, 'register']);

    Route::group(['middleware' => 'auth:sanctum'], function () {
        Route::apiResource('fishtanks', FishTankControllerV1::class);
        Route::apiResource('temperatures', TemperatureControllerV1::class);
        Route::get('/user/fishtanks', function () {
            return FishTankResource::collection(auth()->user()->fishtanks);
        });
    });
});

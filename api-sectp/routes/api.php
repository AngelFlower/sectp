<?php

use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\RegisterController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\FishTankController as FishTankControllerV1;
use App\Http\Controllers\Api\V1\TemperatureController as TemperatureControllerV1;
use App\Http\Controllers\Api\V1\UserController as UserControllerV1;
use App\Http\Controllers\Api\V1\UserTypeController as UserTypeControllerV1;

// V1 api routes
Route::group(['prefix' => 'v1'], function () {
    Route::post('login', [LoginController::class, 'login']);
    Route::post('register', [RegisterController::class, 'register']);
    
    Route::group(['middleware' => 'auth:sanctum'], function () {
        Route::delete('logout', [LoginController::class, 'logout']);

        // fishtank routes
        Route::get('fishtanks/user', FishTankControllerV1::class . '@getByUser');
        Route::apiResource('fishtanks', FishTankControllerV1::class);

        // temperature routes
        Route::get('temperatures/fishtank/{fish_tank_id}', TemperatureControllerV1::class . '@getByFishTank');
        Route::apiResource('temperatures', TemperatureControllerV1::class);

        // user routes
        Route::get('user', UserControllerV1::class . '@getUser');
        Route::apiResource('users', UserControllerV1::class);

        // user type routes
        Route::apiResource('user_types', UserTypeControllerV1::class);
    });
});

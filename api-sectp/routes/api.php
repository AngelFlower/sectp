<?php

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\FishTankApiController;
use App\Http\Controllers\Api\UserApiController;
use App\Http\Controllers\Api\TemperatureApiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use phpDocumentor\Reflection\Types\Resource_;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource(
    'users',
    UserApiController::class,
    ['only' => ['index', 'store', 'show', 'update', 'destroy']]
);

Route::resource(
    'fishtanks',
    FishTankApiController::class,
    ['only' => ['index', 'store', 'show', 'update', 'destroy']]
);

Route::resource(
    'temperatures',
    TemperatureApiController::class,
    ['only' => ['index', 'store', 'show']]
);



Route::post('/register', RegisterController::class . '@register');
Route::post('/login', LoginController::class . '@login');
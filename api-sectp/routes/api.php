<?php

use App\Http\Controllers\Api\FishTankApiController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\FishTankController as FishTankControllerV1;
use App\Http\Controllers\Api\V1\TemperatureController as TemperatureControllerV1;

// V1 api routes
Route::apiResource('v1/fishtanks', FishTankControllerV1::class);

Route::apiResource('v1/temperatures', TemperatureControllerV1::class);
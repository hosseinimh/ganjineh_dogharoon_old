<?php

use App\Http\Controllers\Administrator\DashboardController;
use App\Http\Controllers\Administrator\UserController;
use App\Http\Controllers\Administrator\VillageController;
use Illuminate\Support\Facades\Route;

// not logged users
Route::middleware(['cors'])->group(function () {
    Route::post('users/login', [UserController::class, 'login']);
});

// 'administrator' type users
Route::middleware(['auth:sanctum', 'auth.administrator'])->group(function () {
    Route::post('dashboard/review', [DashboardController::class, 'review']);

    Route::post('users', [UserController::class, 'index']);
    Route::post('users/show/{model}', [UserController::class, 'show']);
    Route::post('users/store', [UserController::class, 'store']);
    Route::post('users/update/{model}', [UserController::class, 'update']);
    Route::post('users/change_password/{model}', [UserController::class, 'changePassword']);

    Route::post('villages/store', [VillageController::class, 'store']);
    Route::post('villages/update/{model}', [VillageController::class, 'update']);
});

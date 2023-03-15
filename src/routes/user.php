<?php

use App\Http\Controllers\Administrator\DashboardController;
use App\Http\Controllers\User\UserController;
use Illuminate\Support\Facades\Route;

// not logged users
Route::middleware(['cors'])->group(function () {
    Route::post('users/login', [UserController::class, 'login']);
    Route::post('users/logout', [UserController::class, 'logout']);
});

// 'administrator' type users
Route::middleware(['auth:sanctum', 'auth.administrator'])->group(function () {
    Route::post('dashboard/review', [DashboardController::class, 'review']);

    Route::post('users', [UserController::class, 'index']);
    Route::post('users/show/{model}', [UserController::class, 'showAdministrator']);
    Route::post('users/store', [UserController::class, 'storeAdministrator']);
    Route::post('users/update/{model}', [UserController::class, 'updateAdministrator']);
    Route::post('users/change_password/{model}', [UserController::class, 'changePassword']);
});

<?php

use App\Http\Controllers\Administrator\DashboardController;
use App\Http\Controllers\User\BankController;
use App\Http\Controllers\User\RelationshipController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\User\VillageController;
use Illuminate\Support\Facades\Route;

// not logged users
Route::middleware(['cors'])->group(function () {
    Route::post('users/login', [UserController::class, 'login']);
    Route::post('users/logout', [UserController::class, 'logout']);
});

// 'user' type users
Route::middleware(['auth:sanctum', 'auth.user'])->group(function () {
    Route::post('dashboard/review', [DashboardController::class, 'review']);

    Route::post('users/update', [UserController::class, 'update']);
    Route::post('users/change_password', [UserController::class, 'changePassword']);
});

// 'user' | 'administrator' type users
Route::middleware(['auth:sanctum', 'auth.logged'])->group(function () {
    Route::post('villages', [VillageController::class, 'index']);
    Route::post('villages/show/{model}', [VillageController::class, 'show']);

    Route::post('banks', [BankController::class, 'index']);
    Route::post('banks/show/{model}', [BankController::class, 'show']);

    Route::post('relationships', [RelationshipController::class, 'index']);
    Route::post('relationships/show/{model}', [RelationshipController::class, 'show']);
});

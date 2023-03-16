<?php

namespace App\Providers;

use App\Constants\Theme;
use App\Http\Controllers\Administrator\BankController;
use App\Http\Controllers\Administrator\DashboardController;
use App\Http\Controllers\Administrator\UserController;
use App\Http\Controllers\Administrator\VillageController;
use App\Http\Controllers\User\BankController as UserBankController;
use App\Http\Controllers\User\DashboardController as UserDashboardController;
use App\Http\Controllers\User\UserController as UserUserController;
use App\Http\Controllers\User\VillageController as UserVillageController;
use App\Http\Resources\Bank\BankResource;
use App\Http\Resources\User\UserResource;
use App\Http\Resources\Village\VillageResource;
use App\Packages\Helper;
use App\Packages\JsonResponse;
use App\Services\BankService;
use App\Services\UserService;
use App\Services\VillageService;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

require_once __DIR__ . '/../../server-config.php';

class AppServiceProvider extends ServiceProvider
{
    public function register()
    {
        $this->app->bind('helper', function ($app) {
            return new Helper();
        });
    }

    public function boot()
    {
        $this->app->bind('path.public', function () {
            return PUBLIC_PATH;
        });

        View::share('THEME', Theme::class);

        $this->app->bind(DashboardController::class, function ($app) {
            return new DashboardController($app->make(JsonResponse::class));
        });

        $this->app->bind(UserDashboardController::class, function ($app) {
            return new UserDashboardController($app->make(JsonResponse::class));
        });

        $this->app->bind(UserController::class, function ($app) {
            return new UserController(new JsonResponse(UserResource::class), $app->make(UserService::class));
        });

        $this->app->bind(UserUserController::class, function ($app) {
            return new UserUserController(new JsonResponse(UserResource::class), $app->make(UserService::class));
        });

        $this->app->bind(VillageController::class, function ($app) {
            return new VillageController(new JsonResponse(VillageResource::class), $app->make(VillageService::class));
        });

        $this->app->bind(UserVillageController::class, function ($app) {
            return new UserVillageController(new JsonResponse(VillageResource::class), $app->make(VillageService::class));
        });

        $this->app->bind(BankController::class, function ($app) {
            return new BankController(new JsonResponse(BankResource::class), $app->make(BankService::class));
        });

        $this->app->bind(UserBankController::class, function ($app) {
            return new UserBankController(new JsonResponse(BankResource::class), $app->make(BankService::class));
        });
    }
}

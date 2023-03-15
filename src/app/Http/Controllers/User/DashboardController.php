<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Packages\JsonResponse;
use App\Services\UserService;
use Illuminate\Http\JsonResponse as HttpJsonResponse;

class DashboardController extends Controller
{
    public function __construct(JsonResponse $response)
    {
        parent::__construct($response);
    }

    public function review(): HttpJsonResponse
    {
        return $this->onItems([]);
    }
}

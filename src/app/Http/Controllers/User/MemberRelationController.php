<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Member;
use App\Models\MemberRelation as Model;
use App\Packages\JsonResponse;
use App\Services\MemberRelationService;
use Illuminate\Http\JsonResponse as HttpJsonResponse;

class MemberRelationController extends Controller
{
    public function __construct(JsonResponse $response, public MemberRelationService $service)
    {
        parent::__construct($response);
    }

    public function index(Member $member): HttpJsonResponse
    {
        return $this->onItems($this->service->getPaginate($member->id));
    }

    public function show(Model $model): HttpJsonResponse
    {
        return $this->onItem($this->service->get($model->id));
    }
}

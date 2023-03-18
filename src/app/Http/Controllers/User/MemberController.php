<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Member\IndexMembersRequest;
use App\Models\Member as Model;
use App\Packages\JsonResponse;
use App\Services\MemberService;
use Illuminate\Http\JsonResponse as HttpJsonResponse;
use Illuminate\Http\Request;

class MemberController extends Controller
{
    public function __construct(JsonResponse $response, public MemberService $service)
    {
        parent::__construct($response);
    }

    public function index(IndexMembersRequest $request): HttpJsonResponse
    {
        $villageId = intval($request->village_id);
        $villageId = $villageId > 0 ? $villageId : null;

        return $this->onItems($this->service->getPaginate($villageId));
    }

    public function show(Model $model): HttpJsonResponse
    {
        return $this->onItem($this->service->get($model->id));
    }
}

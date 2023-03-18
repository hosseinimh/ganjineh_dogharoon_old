<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Http\Requests\MemberRelation\StoreMemberRelationRequest;
use App\Http\Requests\MemberRelation\UpdateMemberRelationRequest;
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

    public function store(Member $member, StoreMemberRelationRequest $request): HttpJsonResponse
    {
        $gender = in_array($request->gender, [1, 2]) ? $request->gender : 1;

        return $this->onStore($this->service->store($member->id, $request->name, $request->family, $request->nationalNo, $request->identityNo, $request->birthDate, $gender, $request->description));
    }

    public function update(Model $model, UpdateMemberRelationRequest $request): HttpJsonResponse
    {
        $gender = in_array($request->gender, [1, 2]) ? $request->gender : 1;

        return $this->onUpdate($this->service->update($model, $request->name, $request->family, $request->nationalNo, $request->identityNo, $request->birthDate, $gender, $request->description));
    }
}

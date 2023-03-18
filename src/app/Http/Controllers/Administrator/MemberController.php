<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use App\Http\Requests\Member\StoreMemberRequest;
use App\Http\Requests\Member\UpdateMemberRequest;
use App\Models\Member as Model;
use App\Models\Village;
use App\Packages\JsonResponse;
use App\Services\MemberService;
use Illuminate\Http\JsonResponse as HttpJsonResponse;

class MemberController extends Controller
{
    public function __construct(JsonResponse $response, public MemberService $service)
    {
        parent::__construct($response);
    }

    public function store(Village $village, StoreMemberRequest $request): HttpJsonResponse
    {
        $gender = in_array($request->gender, [1, 2]) ? $request->gender : 1;

        return $this->onStore($this->service->store($village->id, $request->name, $request->family, $request->memberNo, $request->cardNo, $request->nationalNo, $request->identityNo, $request->fatherName, $request->birthDate, $request->membershipDate, $request->postalCode, $request->address, $request->tel, $request->mobile, $gender));
    }

    public function update(Model $model, Village $village, UpdateMemberRequest $request): HttpJsonResponse
    {
        $gender = in_array($request->gender, [1, 2]) ? $request->gender : 1;

        return $this->onUpdate($this->service->update($model, $village->id, $request->name, $request->family, $request->memberNo, $request->cardNo, $request->nationalNo, $request->identityNo, $request->fatherName, $request->birthDate, $request->membershipDate, $request->postalCode, $request->address, $request->tel, $request->mobile, $gender));
    }
}

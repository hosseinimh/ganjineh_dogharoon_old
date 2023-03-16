<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\Village\IndexVillagesRequest;
use App\Models\Village as Model;
use App\Packages\JsonResponse;
use App\Services\VillageService;
use Illuminate\Http\JsonResponse as HttpJsonResponse;

class VillageController extends Controller
{
    public function __construct(JsonResponse $response, public VillageService $service)
    {
        parent::__construct($response);
    }

    public function index(IndexVillagesRequest $request): HttpJsonResponse
    {
        $districtId = intval($request->district_id);
        $districtId = in_array($districtId, [1, 2]) ? $districtId : null;

        return $this->onItems($this->service->getPaginate($districtId));
    }

    public function show(Model $model): HttpJsonResponse
    {
        return $this->onItem($this->service->get($model->id));
    }
}

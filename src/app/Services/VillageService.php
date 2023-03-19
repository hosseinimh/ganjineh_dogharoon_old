<?php

namespace App\Services;

use App\Models\Village as Model;

class VillageService
{
    public function get(int $id): mixed
    {
        return
            Model::where('id', $id)->first();
    }

    public function getPaginate(int|null $districtId, int $page, int $pageItems): mixed
    {
        if ($districtId) {
            return Model::where('district_id', $districtId)->orderBy('name', 'ASC')->skip(($page - 1) * $pageItems)->take($pageItems)->get();
        }

        return Model::orderBy('district_id', 'ASC')->orderBy('name', 'ASC')->skip(($page - 1) * $pageItems)->take($pageItems)->get();
    }

    public function store(int $districtId, string $name): mixed
    {
        $districtId = in_array($districtId, [1, 2]) ? $districtId : 1;
        $data = [
            'district_id' => $districtId,
            'name' => $name,
        ];
        $model = Model::create($data);

        return $model ?? null;
    }

    public function update(Model $model, int $districtId, string $name): bool
    {
        $districtId = in_array($districtId, [1, 2]) ? $districtId : 1;
        $data = [
            'district_id' => $districtId,
            'name' => $name,
        ];

        return $model->update($data);
    }

    public function count(int|null $districtId): int
    {
        if ($districtId) {
            return Model::where('district_id', $districtId)->count();
        }

        return Model::orderBy('district_id', 'ASC')->count();
    }
}

<?php

namespace App\Services;

use App\Models\MemberRelation as Model;

class MemberRelationService
{
    public function get(int $id): mixed
    {
        return Model::where('id', $id)->first();
    }

    public function getPaginate(int $memberId): mixed
    {
        return Model::where('member_id', $memberId)->orderBy('family', 'ASC')->orderBy('name', 'ASC')->orderBy('id', 'ASC')->get();
    }

    public function store(int $memberId, string $name, string $family, int $nationalNo, int $identityNo, string $birthDate, int $gender, string $description): mixed
    {
        $data = [
            'member_id' => $memberId,
            'name' => $name,
            'family' => $family,
            'national_no' => $nationalNo,
            'identity_no' => $identityNo,
            'birth_date' => $birthDate,
            'gender' => $gender,
            'description' => $description,
        ];
        $model = Model::create($data);

        return $model ?? null;
    }

    public function update(Model $model, string $name, string $family, int $nationalNo, int $identityNo, string $birthDate, int $gender, string $description): bool
    {
        $data = [
            'name' => $name,
            'family' => $family,
            'national_no' => $nationalNo,
            'identity_no' => $identityNo,
            'birth_date' => $birthDate,
            'gender' => $gender,
            'description' => $description,
        ];

        return $model->update($data);
    }
}

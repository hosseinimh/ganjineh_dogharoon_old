<?php

namespace App\Services;

use App\Models\Member as Model;

class MemberService
{
    public function get(int $id): mixed
    {
        return Model::where('id', $id)->first();
    }

    public function getByMemberNo(int $memberNo): mixed
    {
        return Model::where('member_no', $memberNo)->first();
    }

    public function getByCardNo(int $cardNo): mixed
    {
        return Model::where('card_no', $cardNo)->first();
    }

    public function getPaginate(int|null $villageId): mixed
    {
        if ($villageId) {
            return Model::where('village_id', $villageId)->orderBy('member_no', 'ASC')->get();
        }

        return Model::orderBy('member_no', 'ASC')->get();
    }

    public function store(int $villageId, string $name, string $family, int $memberNo, int $cardNo, int $nationalNo, int $identityNo, string $fatherName, string $birthDate, string $membershipDate, int $postalCode, string $address, string $tel, string $mobile, int $gender): mixed
    {
        $data = [
            'village_id' => $villageId,
            'name' => $name,
            'family' => $family,
            'member_no' => $memberNo,
            'card_no' => $cardNo,
            'national_no' => $nationalNo,
            'identity_no' => $identityNo,
            'father_name' => $fatherName,
            'birth_date' => $birthDate,
            'membership_date' => $membershipDate,
            'postal_code' => $postalCode,
            'address' => $address,
            'tel' => $tel,
            'mobile' => $mobile,
            'gender' => $gender,
        ];
        $model = Model::create($data);

        return $model ?? null;
    }

    public function update(Model $model, int $villageId, string $name, string $family, int $memberNo, int $cardNo, int $nationalNo, int $identityNo, string $fatherName, string $birthDate, string $membershipDate, int $postalCode, string $address, string $tel, string $mobile, int $gender): bool
    {
        $data = [
            'village_id' => $villageId,
            'name' => $name,
            'family' => $family,
            'member_no' => $memberNo,
            'card_no' => $cardNo,
            'national_no' => $nationalNo,
            'identity_no' => $identityNo,
            'father_name' => $fatherName,
            'birth_date' => $birthDate,
            'membership_date' => $membershipDate,
            'postal_code' => $postalCode,
            'address' => $address,
            'tel' => $tel,
            'mobile' => $mobile,
            'gender' => $gender,
        ];

        return $model->update($data);
    }
}

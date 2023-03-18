<?php

namespace App\Http\Resources\Member;

use App\Facades\Helper;
use Illuminate\Http\Resources\Json\JsonResource;

class MemberResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => intval($this->id),
            'name' => Helper::localeNumbers($this->name) ?? '',
            'family' => Helper::localeNumbers($this->family) ?? '',
            'memberNo' => intval($this->member_no),
            'cardNo' => intval($this->card_no),
            'nationalNo' => $this->national_no,
            'identityNo' => $this->identity_no,
            'fatherName' => Helper::localeNumbers($this->father_name) ?? '',
            'birthDate' => $this->birth_date,
            'membershipDate' => $this->membership_date,
            'postalCode' => intval($this->postal_code),
            'address' => Helper::localeNumbers($this->address) ?? '',
            'tel' => Helper::localeNumbers($this->tel) ?? '',
            'mobile' => Helper::localeNumbers($this->mobile) ?? '',
            'gender' => intval($this->gender),
        ];
    }
}

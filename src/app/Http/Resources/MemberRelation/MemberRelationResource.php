<?php

namespace App\Http\Resources\MemberRelation;

use App\Facades\Helper;
use Illuminate\Http\Resources\Json\JsonResource;

class MemberRelationResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => intval($this->id),
            'name' => Helper::localeNumbers($this->name) ?? '',
            'family' => Helper::localeNumbers($this->family) ?? '',
            'nationalNo' => $this->national_no,
            'identityNo' => $this->identity_no,
            'birthDate' => $this->birth_date,
            'description' => Helper::localeNumbers($this->description) ?? '',
            'gender' => intval($this->gender),
            'description' => Helper::localeNumbers($this->description) ?? '',
        ];
    }
}

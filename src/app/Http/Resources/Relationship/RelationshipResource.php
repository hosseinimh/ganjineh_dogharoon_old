<?php

namespace App\Http\Resources\Relationship;

use App\Facades\Helper;
use Illuminate\Http\Resources\Json\JsonResource;

class RelationshipResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => intval($this->id),
            'name' => Helper::localeNumbers($this->name) ?? '',
        ];
    }
}

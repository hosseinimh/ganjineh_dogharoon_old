<?php

namespace App\Http\Resources\Error;

use Illuminate\Http\Resources\Json\JsonResource;

class ErrorResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => intval($this->id),
            'message' => $this->message ?? '',
        ];
    }
}

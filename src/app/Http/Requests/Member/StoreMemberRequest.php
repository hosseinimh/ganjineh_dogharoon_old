<?php

namespace App\Http\Requests\Member;

use App\Constants\ErrorCode;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;

class StoreMemberRequest extends FormRequest
{
    protected function failedValidation(Validator $validator)
    {
        $response = new Response(['_result' => '0', '_error' => $validator->errors()->first(), '_errorCode' => ErrorCode::UPDATE_ERROR], 200);

        throw new ValidationException($validator, $response);
    }

    public function rules()
    {
        return [
            'name' => 'required|min:3|max:50',
            'family' => 'required|min:3|max:50',
            'national_no' => 'required|digits:10|gt:0',
            'identity_no' => 'required|numeric|gte:0|lt:1000000',
            'father_name' => 'required|min:3|max:50',
            'birth_date' => 'required|numeric|gte:13000101',
            'membership_date' => 'required|numeric|gte:13800101',
            'postal_code' => 'max_digits:10',
            'address' => 'max:300',
            'tel' => 'max_digits:20',
            'mobile' => 'max_digits:11',
            'card_no' => 'required|numeric|min:1',
            
        ];
    }

    public function messages()
    {
        return [
            'name.required' => __('village.name_required'),
            'name.min' => __('village.name_min'),
            'name.max' => __('village.name_max'),
            'family.required' => __('village.family_required'),
            'family.min' => __('village.family_min'),
            'family.max' => __('village.family_max'),
            'national_no.required' => __('village.national_no_required'),
            'national_no.digits' => __('village.national_no_digits'),
            'national_no.gt' => __('village.national_no_gt'),
            'identity_no.required' => __('village.identity_no_required'),
            'identity_no.numeric' => __('village.identity_no_numeric'),
            'identity_no.gte' => __('village.identity_no_gte'),
            'identity_no.lt' => __('village.identity_no_lt'),
            'father_name.required' => __('village.father_name_required'),
            'father_name.min' => __('village.father_name_min'),
            'father_name.max' => __('village.father_name_max'),
        ];
    }
}

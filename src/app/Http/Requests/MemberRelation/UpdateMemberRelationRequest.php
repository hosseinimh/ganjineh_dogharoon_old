<?php

namespace App\Http\Requests\MemberRelation;

use App\Constants\ErrorCode;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;

class UpdateMemberRelationRequest extends FormRequest
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
            'national_no' => 'required|digits:10',
            'identity_no' => 'required|numeric|gte:0|lt:1000000',
            'birth_date' => 'required|numeric|gte:13000101',
            'description' => 'max:1000',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => __('member_relation.name_required'),
            'name.min' => __('member_relation.name_min'),
            'name.max' => __('member_relation.name_max'),
            'family.required' => __('member_relation.family_required'),
            'family.min' => __('member_relation.family_min'),
            'family.max' => __('member_relation.family_max'),
            'national_no.required' => __('member_relation.national_no_required'),
            'national_no.digits' => __('member_relation.national_no_digits'),
            'identity_no.required' => __('member_relation.identity_no_required'),
            'identity_no.numeric' => __('member_relation.identity_no_numeric'),
            'identity_no.gte' => __('member_relation.identity_no_gte'),
            'identity_no.lt' => __('member_relation.identity_no_lt'),
            'birth_date.required' => __('member_relation.birth_date_required'),
            'birth_date.numeric' => __('member_relation.birth_date_numeric'),
            'birth_date.gte' => __('member_relation.birth_date_gte'),
            'description.max' => __('member_relation.description_max'),
        ];
    }
}

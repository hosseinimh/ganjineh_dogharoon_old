<?php

namespace App\Http\Requests\Member;

use App\Constants\ErrorCode;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Response;
use Illuminate\Validation\ValidationException;

class UpdateMemberRequest extends FormRequest
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
            'member_no' => 'required|numeric|min:1',
            'card_no' => 'required|numeric|min:1',
            'national_no' => 'required|digits:10',
            'identity_no' => 'required|numeric|gte:0|lt:1000000',
            'father_name' => 'required|min:3|max:50',
            'birth_date' => 'required|numeric|gte:13000101',
            'membership_date' => 'required|numeric|gte:13800101',
            'postal_code' => 'max_digits:10',
            'address' => 'max:300',
            'tel' => 'max_digits:20',
            'mobile' => 'max_digits:11',
        ];
    }

    public function messages()
    {
        return [
            'name.required' => __('member.name_required'),
            'name.min' => __('member.name_min'),
            'name.max' => __('member.name_max'),
            'family.required' => __('member.family_required'),
            'family.min' => __('member.family_min'),
            'family.max' => __('member.family_max'),
            'member_no.required' => __('member.member_no_required'),
            'member_no.numeric' => __('member.member_no_numeric'),
            'member_no.min' => __('member.member_no_min'),
            'card_no.required' => __('member.card_no_required'),
            'card_no.numeric' => __('member.card_no_numeric'),
            'card_no.min' => __('member.card_no_min'),
            'national_no.required' => __('member.national_no_required'),
            'national_no.digits' => __('member.national_no_digits'),
            'identity_no.required' => __('member.identity_no_required'),
            'identity_no.numeric' => __('member.identity_no_numeric'),
            'identity_no.gte' => __('member.identity_no_gte'),
            'identity_no.lt' => __('member.identity_no_lt'),
            'father_name.required' => __('member.father_name_required'),
            'father_name.min' => __('member.father_name_min'),
            'father_name.max' => __('member.father_name_max'),
            'birth_date.required' => __('member.birth_date_required'),
            'birth_date.numeric' => __('member.birth_date_numeric'),
            'birth_date.gte' => __('member.birth_date_gte'),
            'membership_date.required' => __('member.membership_date_required'),
            'membership_date.numeric' => __('member.membership_date_numeric'),
            'membership_date.gte' => __('member.membership_date_gte'),
            'postal_code.max_digits' => __('member.postal_code_max_digits'),
            'address.max' => __('member.address_max'),
            'tel.max_digits' => __('member.tel_max_digits'),
            'mobile.max_digits' => __('member.mobile_max_digits'),
        ];
    }
}

<?php

$templateMessages = [
    'required' => 'لطفا :field را وارد نمایید.',
    'minString' => 'طول فیلد :field حداقل باید :length حرف باشد.',
    'maxString' => 'طول فیلد :field حداکثر باید :length حرف باشد.',
    'select' => 'لطفا یک :field را انتخاب نمایید.',
    'digits' => 'طول فیلد :field باید :length رقم باشد.',
];

$requiredMessage = function ($field) use ($templateMessages) {
    $message = $templateMessages['required'];

    return str_replace(':field', $field, $message);
};

$minStringMessage = function ($field, $length) use ($templateMessages) {
    $message = $templateMessages['minString'];
    $message = str_replace(':field', $field, $message);

    return str_replace(':length', $length, $message);
};

$maxStringMessage = function ($field, $length) use ($templateMessages) {
    $message = $templateMessages['maxString'];
    $message = str_replace(':field', $field, $message);

    return str_replace(':length', $length, $message);
};

$selectMessage = function ($field) use ($templateMessages) {
    $message = $templateMessages['select'];

    return str_replace(':field', $field, $message);
};

$digitsMessage = function ($field, $length) use ($templateMessages) {
    $message = $templateMessages['digits'];
    $message = str_replace(':field', $field, $message);

    return str_replace(':length', $length, $message);
};

<?php

require_once __DIR__ . '/MessageHelper.php';

return [
    'name_required' => $requiredMessage('بانک'),
    'name_min' => $minStringMessage('بانک', 3),
    'name_max' => $maxStringMessage('بانک', 50),
];

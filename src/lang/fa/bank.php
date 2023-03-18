<?php

require_once __DIR__ . '/Helper/MessageHelper.php';

return [
    'name_required' => $requiredMessage('بانک'),
    'name_min' => $minStringMessage('بانک', 3),
    'name_max' => $maxStringMessage('بانک', 50),
];

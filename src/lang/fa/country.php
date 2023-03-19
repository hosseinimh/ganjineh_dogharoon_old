<?php

require_once __DIR__ . '/Helper/MessageHelper.php';

return [
    'name_required' => $requiredMessage('کشور'),
    'name_min' => $minStringMessage('کشور', 3),
    'name_max' => $maxStringMessage('کشور', 50),
];

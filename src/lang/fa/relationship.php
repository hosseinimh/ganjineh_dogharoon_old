<?php

require_once __DIR__ . '/MessageHelper.php';

return [
    'name_required' => $requiredMessage('رابطه خویشاوندی'),
    'name_min' => $minStringMessage('رابطه خویشاوندی', 3),
    'name_max' => $maxStringMessage('رابطه خویشاوندی', 50),
];

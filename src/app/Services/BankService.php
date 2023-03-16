<?php

namespace App\Services;

use App\Models\Bank as Model;

class BankService
{
    public function get(int $id): mixed
    {
        return
            Model::where('id', $id)->first();
    }

    public function getPaginate(): mixed
    {
        return Model::orderBy('name', 'ASC')->get();
    }

    public function store(string $name): mixed
    {
        $data = [
            'name' => $name,
        ];
        $model = Model::create($data);

        return $model ?? null;
    }

    public function update(Model $model, string $name): bool
    {
        $data = [
            'name' => $name,
        ];

        return $model->update($data);
    }
}

<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Inventory;

class InventorySeeder extends Seeder
{
    public function run(): void
    {
        // Gunakan factory untuk menghasilkan 10 data
        Inventory::factory(10)->create();
    }
}

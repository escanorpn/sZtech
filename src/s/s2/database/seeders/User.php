<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class User extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=0; $i < 10; $i++) {
            DB::table('users')->insert([
                'name' => Str::random(4),
                'code' => Str::random(5),
                'email' => Str::random(4).'@gmail.com',
                'password' => Hash::make('password'),
            ]);
        }
    }
}

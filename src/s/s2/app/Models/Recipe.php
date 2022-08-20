<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    use HasFactory;
    protected $table = 'recipes';
    protected $fillable = [
        'name', 'discription'
    ];
    
   
    public function images()
    {
        return $this->hasMany('App\Models\Image','Recipe_id','id');
    }
}

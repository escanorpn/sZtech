<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class portfolio extends Model
{
    use HasFactory;   
     protected $table = 'projects';
    protected $fillable = [
        'duration', 'discription','priority'
    ];
    public function images()
    {
        return $this->hasMany('App\Models\Image','Pojetct_id','id');
    }
}

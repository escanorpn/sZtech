<?php

namespace App\Models;
use App\Models\Image;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    // use HasFactory;
    protected $table = 'images';
    protected $fillable = [
     'url', 'product_id', 'service_id', 'recipe_id'
    ];
  public function product()
  {
    return $this->belongsTo('App\Product', 'product_id');
  }
  
  public function service()
  {
    return $this->belongsTo('App\Service', 'service_id');
  }
  public function recipe()
  {
    return $this->belongsTo('App\Recipe', 'recipe_id');
  }
//   public function service(){
//     $this->belongsTo('App\Service');
// }
 
// public function product(){
//     $this->belongsTo('App\Product');
// }
}

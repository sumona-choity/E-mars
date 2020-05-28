<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    protected $fillable = [ 
        'name','categoryId'
    ];
    public function category(){
        return $this->belongsTo("App\Category",'categoryId');
    }
}

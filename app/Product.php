<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [ 
        'name','description','price','stock','warranty','isNew','isFeatured','totalSale','categoryId','subCategoryId','image','cost','discount'
        
    ];
 

    public function photo(){
        return $this->hasMany('App\Photo','productId');
    }
    public function category(){
        return $this->belongsTo('App\Category','categoryId');
    }
    public function Subcategory(){
        return $this->belongsTo('App\SubCategory','subCategoryId');
    }
}

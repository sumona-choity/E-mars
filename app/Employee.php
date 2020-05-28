<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $fillable = [
        'designation_id','user_type','name','email','address','phone','password'
    ];
}

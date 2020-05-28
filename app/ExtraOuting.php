<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExtraOuting extends Model
{
    protected $fillable = [
        'attendance_id','employee_id','leave_time','entry_time','duration','reason'
    ];
    public function employee(){
        return $this->belongsTo("App\User",'employee_id');
    }
}

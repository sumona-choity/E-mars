<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmployeeAttendance extends Model
{
    protected $fillable = [
        'employee_id','current_date','entry_time','break_start','break_end','duration_of_break','leave_time','number_of_outing','total_in_time',
        'total_out_time','score'
    ];
    public function employee(){
        return $this->belongsTo("App\User",'employee_id');
    }
    public function outings(){
        return $this->hasMany("App\ExtraOuting",'attendance_id');
    }
    // public function absent(){
    //     return $this->hasOne('App\Like')->select('product_id',DB::raw ('count(islike) as totalDislike'))
    //                                     ->where('islike','=','0')
    //                                     ->groupBy('product_id');
    // }
}

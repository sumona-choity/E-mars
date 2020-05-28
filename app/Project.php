<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Project extends Model
{
    protected $fillable = [
        'project_name','client_id','start_date','deadline_date','submit_date','progress','duration','status'
    ];
    public function client(){
        return $this->belongsTo('App\Client');
    }
    public function tasks(){
        return $this->hasMany('App\AssignTask','project_id')->setEagerLoads([]);
    }
    public function assignTask(){
        return $this->hasOne('App\AssignTask','project_id')->select('project_id',DB::raw ('SUM(estimated_time) as totalestimated_time'))
                                                           ->groupBy('project_id');
    }
    public function assignTaskForCompleted(){
        return $this->hasOne('App\AssignTask','project_id')
                    ->select('project_id',DB::raw ('SUM(estimated_time) as totalestimated_time'))
                    ->where('status', 'Completed')
                    ->groupBy('project_id');
    }
}

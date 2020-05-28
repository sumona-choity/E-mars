<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AssignProject extends Model
{
    protected $fillable = [
        'project_id','employee_id'
    ];
    public function projects(){
        return $this->belongsTo("App\Project",'project_id')->setEagerLoads([]);
    }
    public function employee(){
        return $this->belongsTo("App\User",'employee_id');
    }
    public function tasks(){
        return $this->hasMany('App\AssignTask','assign_task_id')->setEagerLoads([]);
    }
}

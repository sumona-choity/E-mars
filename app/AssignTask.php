<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AssignTask extends Model
{
    protected $fillable = [
        'project_id','employee_id','task_name','assign_task_id','description','estimated_time','start_time','end_time','total_time','status'
    ];
    public function projects(){
        return $this->belongsTo("App\Project",'project_id');
    }
    public function employee(){
        return $this->belongsTo("App\User",'employee_id');
    }
    public function lastPause(){
        return $this->hasMany("App\TaskPause",'task_id')->orderBy('id','desc')->limit(1);
    }
    public function Pausess(){
        return $this->hasMany("App\TaskPause",'task_id')->orderBy('id','desc');
    }
    
}

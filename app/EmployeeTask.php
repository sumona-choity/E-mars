<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmployeeTask extends Model
{
    protected $fillable = [
        'employee_id','project_id','task_name','description','estimated_time'
    ];
}

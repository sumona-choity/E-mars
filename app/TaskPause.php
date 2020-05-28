<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TaskPause extends Model
{
   protected $fillable = [
       'employee_id','start_time','reason','task_id'
   ];
}

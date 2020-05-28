<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmployeeAttendancesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employee_attendances', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('employee_id');
            $table->datetime('current_date');
            $table->datetime('entry_time');
            $table->datetime('break_start');
            $table->datetime('break_end');
            $table->datetime('duration_of_break');
            $table->datetime('leave_time');
            $table->integer('number_of_outing');
            $table->datetime('total_in_time');
            $table->datetime('total_out_time');
            $table->integer('score');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('employee_attendances');
    }
}

<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDayLeaveApprovesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('day_leave_approves', function (Blueprint $table) {
            $table->boolean('leave_approve');
            $table->integer('legger_page');
            $table->boolean('deleted');
            $table->string('user_data',255);
            $table->timestamps();
        });

        Schema::table('day_leave_approves', function (Blueprint $table) {
            $table->unsignedBigInteger('dl_leave_id');
        
            $table->foreign('dl_leave_id')->references('dl_leave_id')->on('day_leaves')
            ->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('day_leave_approves', function (Blueprint $table) {
            $table->unsignedBigInteger('emp_act_id');
        
            $table->foreign('emp_act_id')->references('emp_id')->on('employees')
            ->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('day_leave_approves', function (Blueprint $table) {
            $table->unsignedBigInteger('supervising_officer');
        
            $table->foreign('supervising_officer')->references('emp_id')->on('employees')
            ->onDelete('cascade')->onUpdate('cascade');
        });
        
    }
    				
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('day_leave_approves');
    }
}

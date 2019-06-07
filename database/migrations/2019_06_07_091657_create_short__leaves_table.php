<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateShortLeavesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('short_leaves', function (Blueprint $table) {
            $table->bigIncrements('sl_leave_id');
            $table->date('request_date');
            $table->string('leave_desc', 100);
            $table->time('start_time');
            $table->time('end_time');
            $table->boolean('leave_approve');
            $table->boolean('deleted');
            $table->string('user_data',255);
            $table->timestamps();
        });

        Schema::table('short_leaves', function (Blueprint $table) {
            $table->unsignedBigInteger('emp_id');
        
            $table->foreign('emp_id')->references('emp_id')->on('employees')
            ->onDelete('cascade')->onUpdate('cascade');
        });
        
        Schema::table('short_leaves', function (Blueprint $table) {
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
        Schema::dropIfExists('short_leaves');
    }
}

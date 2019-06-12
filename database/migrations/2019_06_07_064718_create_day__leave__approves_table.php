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
        Schema::create('head_leave_approves', function (Blueprint $table) {
            $table->string('leave_type',10);
            $table->boolean('leave_approve');
            $table->boolean('deleted');
            $table->string('user_data',255);
            $table->timestamps();
        });

        Schema::table('head_leave_approves', function (Blueprint $table) {
            $table->unsignedBigInteger('leave_id');
        
            $table->foreign('leave_id')->references('dl_leave_id')->on('day_leaves')
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
        Schema::dropIfExists('head_leave_approves');
    }
}

<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApprovalSupervisesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('approval_supervises', function (Blueprint $table) {
            $table->string('leave_type', 10);
            $table->boolean('approve_supervise');
            $table->boolean('deleted');
            $table->string('user_data',255);
            $table->timestamps();
        });
        Schema::table('approval_supervises', function (Blueprint $table) {
            $table->unsignedBigInteger('leave_id');
        
            $table->foreign('leave_id')->references('dl_leave_id')->on('day_leaves')
            ->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('approval_supervises', function (Blueprint $table) {
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
        Schema::dropIfExists('approval_supervises');
    }
}

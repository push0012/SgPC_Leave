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
            $table->integer('leave_id');
            $table->string('leave_type', 10);
            $table->char('approve_supervise',1)->default('0');
            $table->boolean('deleted');
            //$table->string('user_data',255);
            $table->timestamps();
        });
        
        Schema::table('approval_supervises', function (Blueprint $table) {
            $table->unsignedBigInteger('supervising_officer');
        
            $table->foreign('supervising_officer')->references('id')->on('users')
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

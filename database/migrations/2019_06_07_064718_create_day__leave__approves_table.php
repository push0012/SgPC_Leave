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
            $table->integer('leave_id');
            $table->string('leave_type',10);
            //$table->boolean('leave_approve');
            $table->char('leave_approve',1)->default('0');
            $table->boolean('deleted');
            $table->timestamps();
        });

        Schema::table('head_leave_approves', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id');
        
            $table->foreign('user_id')->references('id')->on('users')
                                    ->onDelete('cascade')
                                    ->onUpdate('cascade');
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

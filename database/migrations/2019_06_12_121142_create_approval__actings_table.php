<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateApprovalActingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('approval_actings', function (Blueprint $table) {
            $table->string('approve_acting');
            $table->boolean('deleted');
            $table->integer('user_data');
            $table->timestamps();
        });

        Schema::table('approval_actings', function (Blueprint $table) {
            $table->unsignedBigInteger('dl_leave_id');
        
            $table->foreign('dl_leave_id')->references('dl_leave_id')->on('day_leaves')
            ->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('approval_actings', function (Blueprint $table) {
            $table->unsignedBigInteger('emp_act_id');
        
            $table->foreign('emp_act_id')->references('emp_id')->on('employees')
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
        Schema::dropIfExists('approval_actings');
    }
}
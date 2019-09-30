<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDayLeavesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('day_leaves', function (Blueprint $table) {
            $table->bigIncrements('dl_leave_id');
            //$table->string('leave_title', 20);
            $table->double('leave_size', 3,2);
            $table->date('request_date');
            $table->string('leave_desc', 100);
            $table->date('start_date');
            $table->date('end_date');
            $table->string('on_leave_address', 100);
            $table->integer('legger_page');
            $table->boolean('deleted');
            $table->timestamps();
        });
        Schema::table('day_leaves', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id');
        
            $table->foreign('user_id')->references('id')
            ->on('users')
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
        Schema::dropIfExists('day_leaves');
    }
}

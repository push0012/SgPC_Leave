<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOfficialLeavesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('official_leaves', function (Blueprint $table) {
            $table->bigIncrements('ol_leave_id');
            $table->date('request_date');
            $table->string('leave_desc', 100);
            $table->date('dates');
            $table->boolean('deleted');
            $table->string('user_data',255);
            $table->timestamps();
        });

        Schema::table('official_leaves', function (Blueprint $table) {
            $table->unsignedBigInteger('emp_id');
        
            $table->foreign('emp_id')->references('emp_id')->on('employees')
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
        Schema::dropIfExists('official_leaves');
    }
}

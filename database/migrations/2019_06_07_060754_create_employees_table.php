<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEmployeesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->bigIncrements('emp_id');
            $table->string('title', 5);
            $table->string('emp_name', 100);
            $table->string('nic', 12);
            $table->string('mobile', 10);
            $table->string('email', 45);
            $table->date('joined_date');
            $table->boolean('nine_month');
            $table->boolean('deleted');
            $table->integer('user_data');
            $table->timestamps();
        });

        Schema::table('employees', function (Blueprint $table) {
            $table->unsignedBigInteger('job_id');
        
            $table->foreign('job_id')->references('job_id')->on('job_roles')->onDelete('cascade');
        });
    }
    						

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('employees');
    }
}

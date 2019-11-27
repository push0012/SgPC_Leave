<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRecordMonthsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('record_months', function (Blueprint $table) {
            $table->integer('record_year');
            $table->integer('record_month');
            $table->integer('ol_count');
            $table->integer('sl_count');
            $table->double('casual_count', 3,2);
            $table->double('medical_count', 3,2);
            $table->timestamps();
        });
        
        Schema::table('record_months', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id');
        
            $table->foreign('user_id')->references('id')
                                    ->on('users')
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
        Schema::dropIfExists('record_months');
    }
}

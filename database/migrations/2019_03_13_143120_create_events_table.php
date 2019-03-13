<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('events', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('eventName');
            $table->string('eventLocation');
            $table->string('timeSlot');
            $table->float('totalHours');
            $table->integer('numberOfGuests');
            $table->integer('numberOfValetsNeeded');
            $table->integer('visibleAfter')->default(0);
            $table->string('status')->default('runningWeek');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('events');
    }
}







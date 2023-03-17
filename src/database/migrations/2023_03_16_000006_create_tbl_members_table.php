<?php

use App\Constants\Role;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_members', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('family');
            $table->string('national_no');
            $table->string('identity_no');
            $table->string('father_name');
            $table->string('birth_date');
            $table->string('membership_date');
            $table->string('postal_code');
            $table->string('address');
            $table->string('tel');
            $table->string('mobile');
            $table->string('card_no');
            $table->unsignedTinyInteger('gender');
            $table->unsignedBigInteger('village_id');
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('village_id')->references('id')->on('tbl_villages');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tbl_members', function (Blueprint $table) {
            $table->dropSoftDeletes();
        });
    }
};

<?php

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
        Schema::create('tbl_member_relations', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('family');
            $table->string('national_no');
            $table->string('identity_no');
            $table->string('birth_date');
            $table->unsignedTinyInteger('gender');
            $table->string('description');
            $table->unsignedBigInteger('member_id');
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('member_id')->references('id')->on('tbl_members');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('tbl_member_relations', function (Blueprint $table) {
            $table->dropSoftDeletes();
        });
    }
};

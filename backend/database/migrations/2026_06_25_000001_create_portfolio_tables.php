<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('profiles', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email');
            $table->string('phone');
            $table->string('phone_tel');
            $table->string('years_experience');
            $table->json('location');
            $table->json('headline');
            $table->json('tagline');
            $table->json('bio');
            $table->json('availability');
            $table->string('cv_path')->nullable();
            $table->string('photo_path')->nullable();
            $table->string('job_title')->default('Web Developer');
            $table->string('address_locality')->default('Bogor');
            $table->string('address_country', 2)->default('ID');
            $table->json('knows_about')->nullable();
            $table->timestamps();
        });

        Schema::create('profile_highlights', function (Blueprint $table) {
            $table->id();
            $table->foreignId('profile_id')->constrained()->cascadeOnDelete();
            $table->json('text');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('profile_stats', function (Blueprint $table) {
            $table->id();
            $table->foreignId('profile_id')->constrained()->cascadeOnDelete();
            $table->json('label');
            $table->string('value');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('profile_social_links', function (Blueprint $table) {
            $table->id();
            $table->foreignId('profile_id')->constrained()->cascadeOnDelete();
            $table->string('label');
            $table->string('url');
            $table->string('icon');
            $table->string('handle')->nullable();
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('experiences', function (Blueprint $table) {
            $table->id();
            $table->string('company');
            $table->json('role');
            $table->json('period');
            $table->json('description');
            $table->json('tags');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('experience_bullets', function (Blueprint $table) {
            $table->id();
            $table->foreignId('experience_id')->constrained()->cascadeOnDelete();
            $table->json('text');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('projects', function (Blueprint $table) {
            $table->id();
            $table->string('slug')->unique();
            $table->json('title');
            $table->json('description');
            $table->json('context');
            $table->json('role');
            $table->json('outcome');
            $table->string('image_path')->nullable();
            $table->string('url')->nullable();
            $table->json('stack');
            $table->string('status')->default('completed');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('project_screenshots', function (Blueprint $table) {
            $table->id();
            $table->foreignId('project_id')->constrained()->cascadeOnDelete();
            $table->string('image_path');
            $table->json('caption')->nullable();
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('skill_primary_items', function (Blueprint $table) {
            $table->id();
            $table->string('label');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('skill_categories', function (Blueprint $table) {
            $table->id();
            $table->json('title');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('skill_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('skill_category_id')->constrained()->cascadeOnDelete();
            $table->string('label');
            $table->string('level');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('skill_tags', function (Blueprint $table) {
            $table->id();
            $table->string('label');
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        Schema::create('ui_translations', function (Blueprint $table) {
            $table->id();
            $table->string('group');
            $table->string('key')->unique();
            $table->text('value_id');
            $table->text('value_en');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ui_translations');
        Schema::dropIfExists('skill_tags');
        Schema::dropIfExists('skill_items');
        Schema::dropIfExists('skill_categories');
        Schema::dropIfExists('skill_primary_items');
        Schema::dropIfExists('project_screenshots');
        Schema::dropIfExists('projects');
        Schema::dropIfExists('experience_bullets');
        Schema::dropIfExists('experiences');
        Schema::dropIfExists('profile_social_links');
        Schema::dropIfExists('profile_stats');
        Schema::dropIfExists('profile_highlights');
        Schema::dropIfExists('profiles');
    }
};

<?php

namespace Database\Seeders;

use App\Models\Experience;
use App\Models\ExperienceBullet;
use App\Models\Profile;
use App\Models\ProfileHighlight;
use App\Models\ProfileSocialLink;
use App\Models\ProfileStat;
use App\Models\Project;
use App\Models\ProjectScreenshot;
use App\Models\SiteSetting;
use App\Models\SkillCategory;
use App\Models\SkillItem;
use App\Models\SkillPrimaryItem;
use App\Models\SkillTag;
use App\Models\UiTranslation;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\File;

class PortfolioSeeder extends Seeder
{
    public function run(): void
    {
        $path = database_path('seeders/data/portfolio-seed.json');

        if (! File::exists($path)) {
            $this->command?->error('portfolio-seed.json not found.');

            return;
        }

        /** @var array<string, mixed> $data */
        $data = json_decode(File::get($path), true);

        UiTranslation::query()->delete();

        foreach ($data['ui'] as $row) {
            UiTranslation::query()->create($row);
        }

        Profile::query()->delete();

        /** @var array<string, mixed> $profileData */
        $profileData = $data['profile'];
        $highlights = $profileData['highlights'];
        $stats = $profileData['stats'];
        $social = $profileData['social'];
        unset($profileData['highlights'], $profileData['stats'], $profileData['social']);

        $profile = Profile::query()->create($profileData);

        foreach ($highlights as $index => $text) {
            ProfileHighlight::query()->create([
                'profile_id' => $profile->id,
                'text' => $text,
                'sort_order' => $index,
            ]);
        }

        foreach ($stats as $index => $stat) {
            ProfileStat::query()->create([
                'profile_id' => $profile->id,
                'label' => $stat['label'],
                'value' => $stat['value'],
                'sort_order' => $index,
            ]);
        }

        foreach ($social as $index => $link) {
            ProfileSocialLink::query()->create([
                'profile_id' => $profile->id,
                ...$link,
                'sort_order' => $index,
            ]);
        }

        Experience::query()->delete();

        foreach ($data['experiences'] as $index => $experienceData) {
            $bullets = $experienceData['bullets'];
            unset($experienceData['bullets']);

            $experience = Experience::query()->create([
                ...$experienceData,
                'sort_order' => $index,
            ]);

            foreach ($bullets as $bulletIndex => $text) {
                ExperienceBullet::query()->create([
                    'experience_id' => $experience->id,
                    'text' => $text,
                    'sort_order' => $bulletIndex,
                ]);
            }
        }

        Project::query()->delete();

        foreach ($data['projects'] as $index => $projectData) {
            $screenshots = $projectData['screenshots'];
            unset($projectData['screenshots']);

            $project = Project::query()->create([
                ...$projectData,
                'sort_order' => $index,
            ]);

            foreach ($screenshots as $shotIndex => $shot) {
                ProjectScreenshot::query()->create([
                    'project_id' => $project->id,
                    ...$shot,
                    'sort_order' => $shotIndex,
                ]);
            }
        }

        SkillPrimaryItem::query()->delete();
        SkillCategory::query()->delete();
        SkillTag::query()->delete();

        foreach ($data['skills']['primaryStack'] as $index => $label) {
            SkillPrimaryItem::query()->create([
                'label' => $label,
                'sort_order' => $index,
            ]);
        }

        foreach ($data['skills']['skillGroups'] as $groupIndex => $group) {
            $skills = $group['skills'];
            unset($group['skills']);

            $category = SkillCategory::query()->create([
                'title' => $group['title'],
                'sort_order' => $groupIndex,
            ]);

            foreach ($skills as $skillIndex => $skill) {
                SkillItem::query()->create([
                    'skill_category_id' => $category->id,
                    'label' => $skill['label'],
                    'level' => $skill['level'],
                    'sort_order' => $skillIndex,
                ]);
            }
        }

        foreach ($data['skills']['skillTags'] as $index => $label) {
            SkillTag::query()->create([
                'label' => $label,
                'sort_order' => $index,
            ]);
        }

        SiteSetting::query()->delete();
        SiteSetting::query()->create([
            'site_name' => 'Ahmad Fadilah — Web Developer',
            'logo_path' => null,
            'favicon_path' => '/favicon.svg',
        ]);
    }
}

<?php

namespace App\Services;

use App\Models\Experience;
use App\Models\Profile;
use App\Models\Project;
use App\Models\SiteSetting;
use App\Models\SkillCategory;
use App\Models\SkillPrimaryItem;
use App\Models\SkillTag;
use App\Models\UiTranslation;

class PortfolioApiService
{
    /**
     * @return array<string, mixed>
     */
    public function all(): array
    {
        $profile = Profile::query()
            ->with(['highlights', 'stats', 'socialLinks'])
            ->first();

        $uiId = [];
        $uiEn = [];

        UiTranslation::query()
            ->orderBy('group')
            ->orderBy('key')
            ->get()
            ->each(function (UiTranslation $row) use (&$uiId, &$uiEn): void {
                $uiId[$row->key] = $row->value_id;
                $uiEn[$row->key] = $row->value_en;
            });

        return [
            'site' => SiteSetting::query()->first()?->toApiPayload() ?? [
                'siteName' => 'WebProfile',
                'logoUrl' => null,
                'faviconUrl' => '/favicon.svg',
            ],
            'profile' => $profile?->toApiPayload() ?? [],
            'experience' => Experience::query()
                ->with('bullets')
                ->orderBy('sort_order')
                ->get()
                ->map(fn (Experience $item): array => $item->toApiPayload())
                ->values()
                ->all(),
            'projects' => Project::query()
                ->with('screenshots')
                ->orderBy('sort_order')
                ->get()
                ->map(fn (Project $item): array => $item->toApiPayload())
                ->values()
                ->all(),
            'skills' => [
                'primaryStack' => SkillPrimaryItem::query()
                    ->orderBy('sort_order')
                    ->pluck('label')
                    ->all(),
                'skillGroups' => SkillCategory::query()
                    ->with('items')
                    ->orderBy('sort_order')
                    ->get()
                    ->map(fn (SkillCategory $item): array => $item->toApiPayload())
                    ->values()
                    ->all(),
                'skillTags' => SkillTag::query()
                    ->orderBy('sort_order')
                    ->pluck('label')
                    ->all(),
            ],
            'ui' => [
                'id' => $this->nestUiMessages($uiId),
                'en' => $this->nestUiMessages($uiEn),
            ],
        ];
    }

    /**
     * @param  array<string, string>  $flat
     * @return array<string, mixed>
     */
    private function nestUiMessages(array $flat): array
    {
        $nested = [];

        foreach ($flat as $key => $value) {
            $segments = explode('.', $key);
            $cursor = &$nested;

            foreach ($segments as $index => $segment) {
                if ($index === count($segments) - 1) {
                    $cursor[$segment] = $value;
                } else {
                    if (! isset($cursor[$segment]) || ! is_array($cursor[$segment])) {
                        $cursor[$segment] = [];
                    }
                    $cursor = &$cursor[$segment];
                }
            }
        }

        return $nested;
    }
}

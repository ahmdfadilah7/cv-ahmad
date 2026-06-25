<?php

namespace App\Models;

use App\Support\Localized;
use App\Support\MediaUrl;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Project extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = [
        'slug',
        'title',
        'description',
        'context',
        'role',
        'outcome',
        'image_path',
        'url',
        'stack',
        'status',
        'sort_order',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'title' => 'array',
            'description' => 'array',
            'context' => 'array',
            'role' => 'array',
            'outcome' => 'array',
            'stack' => 'array',
        ];
    }

    public function screenshots(): HasMany
    {
        return $this->hasMany(ProjectScreenshot::class)->orderBy('sort_order');
    }

    /**
     * @return array<string, mixed>
     */
    public function toApiPayload(): array
    {
        return [
            'slug' => $this->slug,
            'title' => Localized::normalize($this->title),
            'description' => Localized::normalize($this->description),
            'context' => Localized::normalize($this->context),
            'role' => Localized::normalize($this->role),
            'outcome' => Localized::normalize($this->outcome),
            'imageUrl' => MediaUrl::publicUrl($this->image_path),
            'url' => $this->url,
            'stack' => $this->stack ?? [],
            'status' => $this->status,
            'screenshots' => $this->screenshots->map(
                fn (ProjectScreenshot $item): array => $item->toApiPayload(),
            )->values()->all(),
        ];
    }
}

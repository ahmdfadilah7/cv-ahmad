<?php

namespace App\Models;

use App\Support\Localized;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Experience extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = [
        'company',
        'role',
        'period',
        'description',
        'tags',
        'sort_order',
    ];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'role' => 'array',
            'period' => 'array',
            'description' => 'array',
            'tags' => 'array',
        ];
    }

    public function bullets(): HasMany
    {
        return $this->hasMany(ExperienceBullet::class)->orderBy('sort_order');
    }

    /**
     * @return array<string, mixed>
     */
    public function toApiPayload(): array
    {
        return [
            'company' => $this->company,
            'role' => Localized::normalize($this->role),
            'period' => Localized::normalize($this->period),
            'description' => Localized::normalize($this->description),
            'bullets' => $this->bullets->map(
                fn (ExperienceBullet $item): array => Localized::normalize($item->text),
            )->values()->all(),
            'tags' => $this->tags ?? [],
        ];
    }
}

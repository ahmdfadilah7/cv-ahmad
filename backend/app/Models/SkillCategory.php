<?php

namespace App\Models;

use App\Support\Localized;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class SkillCategory extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = ['title', 'sort_order'];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return ['title' => 'array'];
    }

    public function items(): HasMany
    {
        return $this->hasMany(SkillItem::class)->orderBy('sort_order');
    }

    /**
     * @return array<string, mixed>
     */
    public function toApiPayload(): array
    {
        return [
            'title' => Localized::normalize($this->title),
            'skills' => $this->items->map(
                fn (SkillItem $item): array => $item->toApiPayload(),
            )->values()->all(),
        ];
    }
}

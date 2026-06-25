<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SkillItem extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = ['skill_category_id', 'label', 'level', 'sort_order'];

    public function category(): BelongsTo
    {
        return $this->belongsTo(SkillCategory::class, 'skill_category_id');
    }

    /**
     * @return array{label: string, level: string}
     */
    public function toApiPayload(): array
    {
        return [
            'label' => $this->label,
            'level' => $this->level,
        ];
    }
}

<?php

namespace App\Models;

use App\Support\Localized;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProfileStat extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = ['profile_id', 'label', 'value', 'sort_order'];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return ['label' => 'array'];
    }

    public function profile(): BelongsTo
    {
        return $this->belongsTo(Profile::class);
    }

    /**
     * @return array{label: array{id: string, en: string}, value: string}
     */
    public function toApiPayload(): array
    {
        return [
            'label' => Localized::normalize($this->label),
            'value' => $this->value,
        ];
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProfileSocialLink extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = ['profile_id', 'label', 'url', 'icon', 'handle', 'sort_order'];

    public function profile(): BelongsTo
    {
        return $this->belongsTo(Profile::class);
    }

    /**
     * @return array<string, string|null>
     */
    public function toApiPayload(): array
    {
        return [
            'label' => $this->label,
            'url' => $this->url,
            'icon' => $this->icon,
            'handle' => $this->handle,
        ];
    }
}

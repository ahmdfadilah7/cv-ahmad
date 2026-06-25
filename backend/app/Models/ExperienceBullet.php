<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ExperienceBullet extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = ['experience_id', 'text', 'sort_order'];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return ['text' => 'array'];
    }

    public function experience(): BelongsTo
    {
        return $this->belongsTo(Experience::class);
    }
}

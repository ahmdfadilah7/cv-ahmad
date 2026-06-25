<?php

namespace App\Models;

use App\Support\Localized;
use App\Support\MediaUrl;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ProjectScreenshot extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = ['project_id', 'image_path', 'caption', 'sort_order'];

    /**
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return ['caption' => 'array'];
    }

    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class);
    }

    /**
     * @return array<string, mixed>
     */
    public function toApiPayload(): array
    {
        $url = MediaUrl::publicUrl($this->image_path);

        if (blank($url)) {
            return [];
        }

        $payload = [
            'url' => $url,
        ];

        if (filled($this->caption)) {
            $payload['caption'] = Localized::normalize($this->caption);
        }

        return $payload;
    }
}

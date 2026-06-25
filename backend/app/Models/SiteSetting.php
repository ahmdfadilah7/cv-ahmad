<?php

namespace App\Models;

use App\Support\MediaUrl;
use Illuminate\Database\Eloquent\Model;

class SiteSetting extends Model
{
    /**
     * @var list<string>
     */
    protected $fillable = [
        'site_name',
        'logo_path',
        'favicon_path',
    ];

    /**
     * @return array<string, mixed>
     */
    public function toApiPayload(): array
    {
        return [
            'siteName' => $this->site_name,
            'logoUrl' => MediaUrl::publicUrl($this->logo_path),
            'faviconUrl' => MediaUrl::publicUrl($this->favicon_path) ?? '/favicon.svg',
        ];
    }
}

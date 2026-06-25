<?php

namespace App\Support;

use App\Models\SiteSetting;

class SiteBranding
{
    public static function settings(): ?SiteSetting
    {
        return SiteSetting::query()->first();
    }

    public static function siteName(): string
    {
        return self::settings()?->site_name ?? (string) config('app.name', 'WebProfile');
    }

    public static function adminBrandName(): string
    {
        return self::siteName().' — Admin';
    }

    public static function logoUrl(): ?string
    {
        return MediaUrl::publicUrl(self::settings()?->logo_path);
    }

    public static function faviconUrl(): string
    {
        return MediaUrl::publicUrl(self::settings()?->favicon_path)
            ?? MediaUrl::publicUrl('/favicon.svg')
            ?? rtrim((string) config('app.frontend_url', config('app.url')), '/').'/favicon.svg';
    }
}

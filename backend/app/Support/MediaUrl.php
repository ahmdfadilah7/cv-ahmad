<?php

namespace App\Support;

use Illuminate\Support\Facades\Storage;

class MediaUrl
{
    public static function publicUrl(?string $path): ?string
    {
        if (blank($path)) {
            return null;
        }

        if (str_starts_with($path, 'http://') || str_starts_with($path, 'https://')) {
            return $path;
        }

        if (str_starts_with($path, '/')) {
            $frontendUrl = config('app.frontend_url', config('app.url'));

            return rtrim((string) $frontendUrl, '/').$path;
        }

        if (! Storage::disk('public')->exists($path)) {
            return null;
        }

        return rtrim((string) config('app.url'), '/').'/storage/'.$path;
    }
}

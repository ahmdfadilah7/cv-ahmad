<?php

namespace App\Filament\Support;

use Illuminate\Database\Eloquent\Model;

class UploadPathNormalizer
{
    /**
     * @var list<string>
     */
    public const UPLOAD_FIELDS = [
        'photo_path',
        'cv_path',
        'image_path',
        'logo_path',
        'favicon_path',
    ];

    /**
     * @param  array<string, mixed>  $data
     * @return array<string, mixed>
     */
    public static function prepareForSave(array $data, ?Model $record = null): array
    {
        return self::stripVirtualUploadFields(self::mergeNewUploads($data));
    }

    /**
     * Gabungkan file baru dari field *_upload ke kolom database.
     *
     * @param  array<string, mixed>  $data
     * @return array<string, mixed>
     */
    public static function mergeNewUploads(array $data): array
    {
        foreach (self::UPLOAD_FIELDS as $field) {
            $uploadKey = self::uploadFieldName($field);

            if (! array_key_exists($uploadKey, $data)) {
                continue;
            }

            $path = self::resolveUploadPath($data[$uploadKey]);

            if (filled($path)) {
                $data[$field] = $path;
            }
        }

        return $data;
    }

    /**
     * @param  array<string, mixed>  $data
     * @return array<string, mixed>
     */
    public static function preserveRelationshipUpload(array $data, Model $record, string $field = 'image_path'): array
    {
        $data = self::mergeNewUploads($data);

        if (blank($data[$field] ?? null) && filled($record->getAttribute($field))) {
            $data[$field] = $record->getAttribute($field);
        }

        return self::stripVirtualUploadFields($data);
    }

    public static function uploadFieldName(string $field): string
    {
        return "{$field}_upload";
    }

    /**
     * @param  array<string, mixed>  $data
     * @return array<string, mixed>
     */
    public static function stripVirtualUploadFields(array $data): array
    {
        foreach (self::UPLOAD_FIELDS as $field) {
            unset($data[self::uploadFieldName($field)]);
        }

        return $data;
    }

    public static function resolveUploadPath(mixed $value): ?string
    {
        if (is_string($value) && filled($value)) {
            return $value;
        }

        if (! is_array($value) || ! self::isFilamentUploadState($value)) {
            return null;
        }

        return self::extractUploadPath($value);
    }

    /**
     * @param  array<mixed>  $value
     */
    private static function isFilamentUploadState(array $value): bool
    {
        if ($value === []) {
            return false;
        }

        foreach ($value as $key => $item) {
            if (! is_string($item)) {
                return false;
            }

            if (in_array($key, ['id', 'en'], true)) {
                return false;
            }
        }

        return true;
    }

    /**
     * @param  array<mixed>  $value
     */
    private static function extractUploadPath(array $value): ?string
    {
        $paths = array_values(array_filter(
            $value,
            fn (mixed $path): bool => is_string($path) && filled($path),
        ));

        return $paths[0] ?? null;
    }
}

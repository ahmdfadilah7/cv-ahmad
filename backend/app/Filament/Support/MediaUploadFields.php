<?php

namespace App\Filament\Support;

use App\Support\MediaUrl;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Placeholder;
use Filament\Schemas\Components\Utilities\Get;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\HtmlString;

class MediaUploadFields
{
    /**
     * @return list<Placeholder|Hidden|FileUpload>
     */
    public static function image(string $name, string $label, string $directory, bool $required = false): array
    {
        $upload = self::configureUploadField(
            FileUpload::make(UploadPathNormalizer::uploadFieldName($name))
                ->label($label)
                ->disk('public')
                ->directory($directory)
                ->visibility('public')
                ->image()
                ->imagePreviewHeight('160')
                ->maxSize(5120)
                ->helperText('Seret file ke sini atau klik untuk memilih gambar baru.')
                ->columnSpanFull(),
            $name,
        );

        if ($required) {
            $upload->required(fn (Get $get): bool => blank($get($name)));
        }

        return [
            self::previewPlaceholder($name, $label, image: true),
            Hidden::make($name),
            $upload,
        ];
    }

    /**
     * @return list<Placeholder|Hidden|FileUpload>
     */
    public static function favicon(string $name, string $label, string $directory): array
    {
        return [
            self::previewPlaceholder($name, $label, image: true),
            Hidden::make($name),
            self::configureUploadField(
                FileUpload::make(UploadPathNormalizer::uploadFieldName($name))
                    ->label($label)
                    ->disk('public')
                    ->directory($directory)
                    ->visibility('public')
                    ->image()
                    ->imagePreviewHeight('64')
                    ->maxSize(1024)
                    ->acceptedFileTypes([
                        'image/png',
                        'image/jpeg',
                        'image/webp',
                        'image/svg+xml',
                        'image/x-icon',
                        'image/vnd.microsoft.icon',
                    ])
                    ->helperText('Format: PNG, JPG, WebP, SVG, atau ICO. Maks. 1 MB.')
                    ->columnSpanFull(),
                $name,
            ),
        ];
    }

    /**
     * @return list<Placeholder|Hidden|FileUpload>
     */
    public static function pdf(string $name, string $label, string $directory): array
    {
        return [
            self::previewPlaceholder($name, $label, image: false),
            Hidden::make($name),
            self::configureUploadField(
                FileUpload::make(UploadPathNormalizer::uploadFieldName($name))
                    ->label($label)
                    ->disk('public')
                    ->directory($directory)
                    ->visibility('public')
                    ->acceptedFileTypes([
                        'application/pdf',
                        'application/x-pdf',
                    ])
                    ->maxSize(10240)
                    ->downloadable()
                    ->openable()
                    ->helperText('Seret file ke sini atau klik untuk memilih PDF baru.')
                    ->columnSpanFull(),
                $name,
            ),
        ];
    }

    private static function previewPlaceholder(string $name, string $label, bool $image): Placeholder
    {
        return Placeholder::make("{$name}_preview")
            ->label("Preview {$label}")
            ->content(function (Get $get, mixed $record) use ($name, $image): HtmlString {
                $path = $get($name) ?: self::resolveStoredPath($record, $name);
                $url = MediaUrl::publicUrl(is_string($path) ? $path : null);

                if (blank($url)) {
                    return new HtmlString(
                        '<p class="text-sm text-gray-500 dark:text-gray-400">Belum ada file.</p>',
                    );
                }

                if ($image) {
                    return new HtmlString(
                        '<img src="'.e($url).'" alt="" class="max-h-48 rounded-lg border border-gray-200 object-contain dark:border-gray-700" />',
                    );
                }

                return new HtmlString(
                    '<a href="'.e($url).'" target="_blank" rel="noopener" class="text-sm font-medium text-lime-700 underline dark:text-lime-300">'
                    .e(basename((string) $path)).
                    '</a>',
                );
            })
            ->columnSpanFull();
    }

    private static function configureUploadField(FileUpload $field, string $storageField): FileUpload
    {
        return $field
            ->deletable()
            ->default(null);
    }

    private static function resolveStoredPath(mixed $record, string $name): ?string
    {
        if ($record instanceof Model) {
            $path = $record->getAttribute($name);
        } elseif (is_object($record) && isset($record->{$name})) {
            $path = $record->{$name};
        } else {
            return null;
        }

        return is_string($path) && filled($path) ? $path : null;
    }
}

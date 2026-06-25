<?php

namespace App\Filament\Resources\SiteSettings;

use App\Filament\Resources\SiteSettings\Pages\EditSiteSetting;
use App\Filament\Resources\SiteSettings\Pages\ListSiteSettings;
use App\Filament\Resources\SiteSettings\Schemas\SiteSettingForm;
use App\Models\SiteSetting;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use UnitEnum;

class SiteSettingResource extends Resource
{
    protected static ?string $model = SiteSetting::class;

    protected static ?string $slug = 'site-settings';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedGlobeAlt;

    protected static ?string $navigationLabel = 'Website';

    protected static ?string $modelLabel = 'Pengaturan website';

    protected static ?string $pluralModelLabel = 'Pengaturan website';

    protected static string|UnitEnum|null $navigationGroup = 'Pengaturan';

    protected static ?int $navigationSort = 0;

    public static function canCreate(): bool
    {
        return SiteSetting::query()->count() === 0;
    }

    public static function canDelete($record): bool
    {
        return false;
    }

    public static function getNavigationUrl(): string
    {
        $settings = SiteSetting::query()->first();

        if ($settings) {
            return static::getUrl('edit', ['record' => $settings]);
        }

        return static::getUrl('index');
    }

    public static function form(Schema $schema): Schema
    {
        return SiteSettingForm::configure($schema);
    }

    public static function getPages(): array
    {
        return [
            'index' => ListSiteSettings::route('/'),
            'edit' => EditSiteSetting::route('/{record}/edit'),
        ];
    }
}

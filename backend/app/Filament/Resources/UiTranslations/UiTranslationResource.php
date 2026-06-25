<?php

namespace App\Filament\Resources\UiTranslations;

use App\Filament\Resources\UiTranslations\Pages\CreateUiTranslation;
use App\Filament\Resources\UiTranslations\Pages\EditUiTranslation;
use App\Filament\Resources\UiTranslations\Pages\ListUiTranslations;
use App\Filament\Resources\UiTranslations\Schemas\UiTranslationForm;
use App\Filament\Resources\UiTranslations\Tables\UiTranslationsTable;
use App\Models\UiTranslation;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class UiTranslationResource extends Resource
{
    protected static ?string $model = UiTranslation::class;

    protected static ?string $slug = 'ui-texts';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedLanguage;

    protected static ?string $navigationLabel = 'Teks UI';

    protected static ?string $modelLabel = 'Teks UI';

    protected static ?string $pluralModelLabel = 'Teks UI';

    protected static string|UnitEnum|null $navigationGroup = 'Pengaturan';

    protected static ?int $navigationSort = 1;

    public static function canCreate(): bool
    {
        return false;
    }

    public static function canDelete($record): bool
    {
        return false;
    }

    public static function form(Schema $schema): Schema
    {
        return UiTranslationForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return UiTranslationsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListUiTranslations::route('/'),
            'create' => CreateUiTranslation::route('/create'),
            'edit' => EditUiTranslation::route('/{record}/edit'),
        ];
    }
}

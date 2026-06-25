<?php

namespace App\Filament\Resources\Profiles;

use App\Filament\Resources\Profiles\Pages\CreateProfile;
use App\Filament\Resources\Profiles\Pages\EditProfile;
use App\Filament\Resources\Profiles\Pages\ListProfiles;
use App\Filament\Resources\Profiles\Schemas\ProfileForm;
use App\Filament\Resources\Profiles\Tables\ProfilesTable;
use App\Models\Profile;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class ProfileResource extends Resource
{
    protected static ?string $model = Profile::class;

    protected static ?string $slug = 'profile';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedUserCircle;

    protected static ?string $navigationLabel = 'Profil';

    protected static ?string $modelLabel = 'Profil';

    protected static ?string $pluralModelLabel = 'Profil';

    protected static string|UnitEnum|null $navigationGroup = 'Konten Website';

    protected static ?int $navigationSort = 1;

    public static function canCreate(): bool
    {
        return Profile::query()->count() === 0;
    }

    public static function canDelete($record): bool
    {
        return false;
    }

    public static function getNavigationUrl(): string
    {
        $profile = Profile::query()->first();

        if ($profile) {
            return static::getUrl('edit', ['record' => $profile]);
        }

        return static::getUrl('index');
    }

    public static function form(Schema $schema): Schema
    {
        return ProfileForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return ProfilesTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListProfiles::route('/'),
            'create' => CreateProfile::route('/create'),
            'edit' => EditProfile::route('/{record}/edit'),
        ];
    }
}

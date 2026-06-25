<?php

namespace App\Filament\Resources\SkillTags;

use App\Filament\Resources\SkillTags\Pages\CreateSkillTag;
use App\Filament\Resources\SkillTags\Pages\EditSkillTag;
use App\Filament\Resources\SkillTags\Pages\ListSkillTags;
use App\Filament\Resources\SkillTags\Schemas\SkillTagForm;
use App\Filament\Resources\SkillTags\Tables\SkillTagsTable;
use App\Models\SkillTag;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class SkillTagResource extends Resource
{
    protected static ?string $model = SkillTag::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedTag;

    protected static ?string $navigationLabel = 'Tag keahlian';

    protected static ?string $modelLabel = 'Tag keahlian';

    protected static ?string $pluralModelLabel = 'Tag keahlian';

    protected static string|UnitEnum|null $navigationGroup = 'Konten Website';

    protected static ?int $navigationSort = 7;

    public static function form(Schema $schema): Schema
    {
        return SkillTagForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return SkillTagsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListSkillTags::route('/'),
            'create' => CreateSkillTag::route('/create'),
            'edit' => EditSkillTag::route('/{record}/edit'),
        ];
    }
}

<?php

namespace App\Filament\Resources\SkillPrimaryItems;

use App\Filament\Resources\SkillPrimaryItems\Pages\CreateSkillPrimaryItem;
use App\Filament\Resources\SkillPrimaryItems\Pages\EditSkillPrimaryItem;
use App\Filament\Resources\SkillPrimaryItems\Pages\ListSkillPrimaryItems;
use App\Filament\Resources\SkillPrimaryItems\Schemas\SkillPrimaryItemForm;
use App\Filament\Resources\SkillPrimaryItems\Tables\SkillPrimaryItemsTable;
use App\Models\SkillPrimaryItem;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use UnitEnum;

class SkillPrimaryItemResource extends Resource
{
    protected static ?string $model = SkillPrimaryItem::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedStar;

    protected static ?string $navigationLabel = 'Stack utama';

    protected static ?string $modelLabel = 'Stack utama';

    protected static ?string $pluralModelLabel = 'Stack utama';

    protected static string|UnitEnum|null $navigationGroup = 'Konten Website';

    protected static ?int $navigationSort = 6;

    public static function form(Schema $schema): Schema
    {
        return SkillPrimaryItemForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return SkillPrimaryItemsTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListSkillPrimaryItems::route('/'),
            'create' => CreateSkillPrimaryItem::route('/create'),
            'edit' => EditSkillPrimaryItem::route('/{record}/edit'),
        ];
    }
}

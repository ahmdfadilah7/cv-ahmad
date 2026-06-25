<?php

namespace App\Filament\Resources\SkillCategories\Schemas;

use App\Filament\Support\LocalizedFields;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class SkillCategoryForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->components([
                Section::make('Kategori keahlian')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        ...LocalizedFields::pair('title', 'Judul kategori'),
                        Repeater::make('items')
                            ->relationship()
                            ->label('Keahlian')
                            ->schema([
                                TextInput::make('label')->required()->columnSpanFull(),
                                Select::make('level')
                                    ->options([
                                        'expert' => 'Mahir',
                                        'proficient' => 'Terampil',
                                        'familiar' => 'Familiar',
                                    ])
                                    ->required()
                                    ->columnSpanFull(),
                            ])
                            ->columns(1)
                            ->reorderableWithButtons()
                            ->defaultItems(0)
                            ->columnSpanFull(),
                    ]),
            ]);
    }
}

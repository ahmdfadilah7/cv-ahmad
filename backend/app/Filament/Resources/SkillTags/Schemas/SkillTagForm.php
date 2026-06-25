<?php

namespace App\Filament\Resources\SkillTags\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class SkillTagForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->components([
                Section::make('Tag keahlian')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        TextInput::make('label')->label('Tag')->required()->columnSpanFull(),
                        TextInput::make('sort_order')->label('Urutan')->numeric()->default(0)->columnSpanFull(),
                    ]),
            ]);
    }
}

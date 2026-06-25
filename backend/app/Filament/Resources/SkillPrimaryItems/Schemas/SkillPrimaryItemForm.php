<?php

namespace App\Filament\Resources\SkillPrimaryItems\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class SkillPrimaryItemForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->components([
                Section::make('Stack utama')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        TextInput::make('label')->label('Stack utama')->required()->columnSpanFull(),
                        TextInput::make('sort_order')->label('Urutan')->numeric()->default(0)->columnSpanFull(),
                    ]),
            ]);
    }
}

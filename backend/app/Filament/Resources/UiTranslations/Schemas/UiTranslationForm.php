<?php

namespace App\Filament\Resources\UiTranslations\Schemas;

use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class UiTranslationForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->components([
                Section::make('Teks antarmuka')
                    ->description('Semua label tombol, judul section, dan teks UI website.')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        TextInput::make('group')->label('Grup')->disabled()->columnSpanFull(),
                        TextInput::make('key')->label('Kunci')->disabled()->columnSpanFull(),
                        Textarea::make('value_id')->label('Bahasa Indonesia')->rows(3)->required()->columnSpanFull(),
                        Textarea::make('value_en')->label('English')->rows(3)->required()->columnSpanFull(),
                    ]),
            ]);
    }
}

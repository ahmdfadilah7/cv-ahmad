<?php

namespace App\Filament\Resources\Experiences\Schemas;

use App\Filament\Support\LocalizedFields;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\TagsInput;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class ExperienceForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->components([
                Section::make('Pengalaman kerja')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        TextInput::make('company')->label('Perusahaan')->required()->columnSpanFull(),
                        ...LocalizedFields::pair('role', 'Jabatan'),
                        ...LocalizedFields::pair('period', 'Periode'),
                        ...LocalizedFields::pair('description', 'Deskripsi', true),
                        TagsInput::make('tags')->label('Tag teknologi')->columnSpanFull(),
                        TextInput::make('sort_order')
                            ->label('Urutan')
                            ->numeric()
                            ->default(0)
                            ->minValue(0)
                            ->helperText('Angka lebih kecil tampil lebih dulu. Bisa juga diatur dengan drag-and-drop di daftar.')
                            ->columnSpanFull(),
                        Repeater::make('bullets')
                            ->relationship()
                            ->label('Poin pencapaian')
                            ->schema([
                                TextInput::make('text.id')->label('Indonesia')->required()->columnSpanFull(),
                                TextInput::make('text.en')->label('English')->required()->columnSpanFull(),
                            ])
                            ->columns(1)
                            ->reorderableWithButtons()
                            ->defaultItems(0)
                            ->columnSpanFull(),
                    ]),
            ]);
    }
}

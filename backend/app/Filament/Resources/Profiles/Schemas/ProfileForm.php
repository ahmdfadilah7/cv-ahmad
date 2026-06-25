<?php

namespace App\Filament\Resources\Profiles\Schemas;

use App\Filament\Support\LocalizedFields;
use App\Filament\Support\MediaUploadFields;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class ProfileForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->components([
                Section::make('Identitas')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        TextInput::make('name')->label('Nama')->required()->columnSpanFull(),
                        TextInput::make('email')->label('Email')->email()->required()->columnSpanFull(),
                        TextInput::make('phone')->label('Telepon (tampilan)')->required()->columnSpanFull(),
                        TextInput::make('phone_tel')->label('Telepon (tel:)')->required()->columnSpanFull(),
                        TextInput::make('years_experience')->label('Tahun pengalaman')->required()->columnSpanFull(),
                        ...MediaUploadFields::pdf('cv_path', 'File CV', 'portfolio/profile/cv'),
                        ...MediaUploadFields::image('photo_path', 'Foto profil', 'portfolio/profile/photos'),
                    ]),
                Section::make('Konten dwibahasa')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        ...LocalizedFields::pair('location', 'Lokasi'),
                        ...LocalizedFields::pair('headline', 'Headline'),
                        ...LocalizedFields::pair('tagline', 'Tagline', true),
                        ...LocalizedFields::pair('bio', 'Bio', true),
                        ...LocalizedFields::pair('availability', 'Ketersediaan', true),
                    ]),
                Section::make('Highlight tentang')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        Repeater::make('highlights')
                            ->relationship()
                            ->label('Highlight')
                            ->schema([
                                TextInput::make('text.id')->label('Indonesia')->required()->columnSpanFull(),
                                TextInput::make('text.en')->label('English')->required()->columnSpanFull(),
                            ])
                            ->columns(1)
                            ->reorderableWithButtons()
                            ->defaultItems(0)
                            ->columnSpanFull(),
                    ]),
                Section::make('Statistik hero')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        Repeater::make('stats')
                            ->relationship()
                            ->label('Stat')
                            ->schema([
                                TextInput::make('label.id')->label('Label ID')->required()->columnSpanFull(),
                                TextInput::make('label.en')->label('Label EN')->required()->columnSpanFull(),
                                TextInput::make('value')->label('Nilai')->required()->columnSpanFull(),
                            ])
                            ->columns(1)
                            ->reorderableWithButtons()
                            ->defaultItems(0)
                            ->columnSpanFull(),
                    ]),
                Section::make('Media sosial')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        Repeater::make('socialLinks')
                            ->relationship()
                            ->label('Link sosial')
                            ->schema([
                                TextInput::make('label')->required()->columnSpanFull(),
                                TextInput::make('url')->url()->required()->columnSpanFull(),
                                Select::make('icon')
                                    ->options([
                                        'github' => 'GitHub',
                                        'linkedin' => 'LinkedIn',
                                        'instagram' => 'Instagram',
                                        'whatsapp' => 'WhatsApp',
                                    ])
                                    ->required()
                                    ->columnSpanFull(),
                                TextInput::make('handle')->columnSpanFull(),
                            ])
                            ->columns(1)
                            ->reorderableWithButtons()
                            ->defaultItems(0)
                            ->columnSpanFull(),
                    ]),
            ]);
    }
}

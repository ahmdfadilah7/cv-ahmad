<?php

namespace App\Filament\Resources\SiteSettings\Schemas;

use App\Filament\Support\MediaUploadFields;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class SiteSettingForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->components([
                Section::make('Identitas website')
                    ->description('Nama, logo, dan favicon yang tampil di website publik.')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        TextInput::make('site_name')
                            ->label('Nama website')
                            ->required()
                            ->maxLength(120)
                            ->helperText('Ditampilkan di header dan judul tab browser.')
                            ->columnSpanFull(),
                        ...MediaUploadFields::image('logo_path', 'Logo website', 'portfolio/site/logo'),
                        ...MediaUploadFields::favicon('favicon_path', 'Favicon', 'portfolio/site/favicon'),
                    ]),
            ]);
    }
}

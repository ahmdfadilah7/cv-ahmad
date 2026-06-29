<?php

namespace App\Filament\Resources\Projects\Schemas;

use App\Filament\Support\LocalizedFields;
use App\Filament\Support\MediaUploadFields;
use App\Filament\Support\UploadPathNormalizer;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TagsInput;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Illuminate\Database\Eloquent\Model;

class ProjectForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->components([
                Section::make('Proyek')
                    ->columns(1)
                    ->columnSpanFull()
                    ->schema([
                        TextInput::make('slug')->label('Slug URL')->required()->unique(ignoreRecord: true)->columnSpanFull(),
                        ...LocalizedFields::pair('title', 'Judul'),
                        ...LocalizedFields::pair('description', 'Deskripsi', true),
                        ...LocalizedFields::pair('context', 'Konteks', true),
                        ...LocalizedFields::pair('role', 'Peran', true),
                        ...LocalizedFields::pair('outcome', 'Hasil', true),
                        ...MediaUploadFields::image('image_path', 'Gambar cover', 'portfolio/projects/covers'),
                        TextInput::make('url')->label('URL demo/repo')->url()->columnSpanFull(),
                        TagsInput::make('stack')->label('Stack')->columnSpanFull(),
                        Select::make('status')
                            ->options([
                                'completed' => 'Selesai',
                                'in_progress' => 'Berjalan',
                                'planned' => 'Direncanakan',
                            ])
                            ->required()
                            ->columnSpanFull(),
                        TextInput::make('sort_order')
                            ->label('Urutan')
                            ->numeric()
                            ->default(0)
                            ->minValue(0)
                            ->helperText('Angka lebih kecil tampil lebih dulu. Bisa juga diatur dengan drag-and-drop di daftar.')
                            ->columnSpanFull(),
                        Repeater::make('screenshots')
                            ->relationship()
                            ->label('Screenshot')
                            ->mutateRelationshipDataBeforeCreateUsing(
                                fn (array $data): array => UploadPathNormalizer::stripVirtualUploadFields(
                                    UploadPathNormalizer::mergeNewUploads($data),
                                ),
                            )
                            ->mutateRelationshipDataBeforeSaveUsing(
                                fn (array $data, Model $record): array => UploadPathNormalizer::preserveRelationshipUpload($data, $record),
                            )
                            ->schema([
                                ...MediaUploadFields::image('image_path', 'Gambar screenshot', 'portfolio/projects/screenshots'),
                                TextInput::make('caption.id')->label('Caption ID')->columnSpanFull(),
                                TextInput::make('caption.en')->label('Caption EN')->columnSpanFull(),
                            ])
                            ->columns(1)
                            ->reorderableWithButtons()
                            ->defaultItems(0)
                            ->columnSpanFull(),
                    ]),
            ]);
    }
}

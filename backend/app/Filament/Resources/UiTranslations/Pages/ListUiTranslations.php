<?php

namespace App\Filament\Resources\UiTranslations\Pages;

use App\Filament\Resources\UiTranslations\UiTranslationResource;
use Filament\Resources\Pages\ListRecords;

class ListUiTranslations extends ListRecords
{
    protected static string $resource = UiTranslationResource::class;

    protected function getHeaderActions(): array
    {
        return [];
    }
}

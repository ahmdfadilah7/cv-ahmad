<?php

namespace App\Filament\Resources\UiTranslations\Pages;

use App\Filament\Resources\UiTranslations\UiTranslationResource;
use Filament\Resources\Pages\EditRecord;

class EditUiTranslation extends EditRecord
{
    protected static string $resource = UiTranslationResource::class;

    protected function getHeaderActions(): array
    {
        return [];
    }
}

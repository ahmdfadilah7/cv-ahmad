<?php

namespace App\Filament\Resources\UiTranslations\Pages;

use App\Filament\Resources\UiTranslations\UiTranslationResource;
use Filament\Resources\Pages\CreateRecord;

class CreateUiTranslation extends CreateRecord
{
    protected static string $resource = UiTranslationResource::class;

    public function mount(): void
    {
        $this->redirect(UiTranslationResource::getUrl('index'));
    }
}

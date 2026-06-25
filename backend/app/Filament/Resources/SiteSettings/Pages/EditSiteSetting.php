<?php

namespace App\Filament\Resources\SiteSettings\Pages;

use App\Filament\Concerns\NormalizesUploadFormData;
use App\Filament\Resources\SiteSettings\SiteSettingResource;
use Filament\Resources\Pages\EditRecord;

class EditSiteSetting extends EditRecord
{
    use NormalizesUploadFormData;

    protected static string $resource = SiteSettingResource::class;

    protected function getHeaderActions(): array
    {
        return [];
    }
}

<?php

namespace App\Filament\Resources\Profiles\Pages;

use App\Filament\Concerns\NormalizesUploadFormData;
use App\Filament\Resources\Profiles\ProfileResource;
use Filament\Resources\Pages\EditRecord;

class EditProfile extends EditRecord
{
    use NormalizesUploadFormData;

    protected static string $resource = ProfileResource::class;

    protected function getHeaderActions(): array
    {
        return [];
    }
}

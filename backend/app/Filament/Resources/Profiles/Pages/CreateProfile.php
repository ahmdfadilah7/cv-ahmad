<?php

namespace App\Filament\Resources\Profiles\Pages;

use App\Filament\Concerns\NormalizesUploadFormData;
use App\Filament\Resources\Profiles\ProfileResource;
use App\Models\Profile;
use Filament\Resources\Pages\CreateRecord;

class CreateProfile extends CreateRecord
{
    use NormalizesUploadFormData;

    protected static string $resource = ProfileResource::class;

    public function mount(): void
    {
        $profile = Profile::query()->first();

        if ($profile) {
            $this->redirect(ProfileResource::getUrl('edit', ['record' => $profile]));
        }

        parent::mount();
    }
}

<?php

namespace App\Filament\Resources\Profiles\Pages;

use App\Filament\Resources\Profiles\ProfileResource;
use App\Models\Profile;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListProfiles extends ListRecords
{
    protected static string $resource = ProfileResource::class;

    public function mount(): void
    {
        parent::mount();

        $profile = Profile::query()->first();

        if ($profile) {
            $this->redirect(ProfileResource::getUrl('edit', ['record' => $profile]));
        }
    }

    protected function getHeaderActions(): array
    {
        if (! ProfileResource::canCreate()) {
            return [];
        }

        return [
            CreateAction::make(),
        ];
    }
}

<?php

namespace App\Filament\Resources\SiteSettings\Pages;

use App\Filament\Resources\SiteSettings\SiteSettingResource;
use App\Models\SiteSetting;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListSiteSettings extends ListRecords
{
    protected static string $resource = SiteSettingResource::class;

    public function mount(): void
    {
        parent::mount();

        $settings = SiteSetting::query()->first();

        if ($settings) {
            $this->redirect(SiteSettingResource::getUrl('edit', ['record' => $settings]));
        }
    }

    protected function getHeaderActions(): array
    {
        if (! SiteSettingResource::canCreate()) {
            return [];
        }

        return [
            CreateAction::make(),
        ];
    }
}

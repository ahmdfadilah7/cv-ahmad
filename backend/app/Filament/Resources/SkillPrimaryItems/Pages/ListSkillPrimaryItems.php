<?php

namespace App\Filament\Resources\SkillPrimaryItems\Pages;

use App\Filament\Resources\SkillPrimaryItems\SkillPrimaryItemResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListSkillPrimaryItems extends ListRecords
{
    protected static string $resource = SkillPrimaryItemResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}

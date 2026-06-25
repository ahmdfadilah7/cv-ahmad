<?php

namespace App\Filament\Resources\SkillPrimaryItems\Pages;

use App\Filament\Resources\SkillPrimaryItems\SkillPrimaryItemResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditSkillPrimaryItem extends EditRecord
{
    protected static string $resource = SkillPrimaryItemResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}

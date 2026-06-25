<?php

namespace App\Filament\Resources\SkillTags\Pages;

use App\Filament\Resources\SkillTags\SkillTagResource;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\EditRecord;

class EditSkillTag extends EditRecord
{
    protected static string $resource = SkillTagResource::class;

    protected function getHeaderActions(): array
    {
        return [
            DeleteAction::make(),
        ];
    }
}

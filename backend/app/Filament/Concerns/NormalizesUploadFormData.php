<?php

namespace App\Filament\Concerns;

use App\Filament\Support\UploadPathNormalizer;

trait NormalizesUploadFormData
{
    /**
     * @param  array<string, mixed>  $data
     * @return array<string, mixed>
     */
    protected function mutateFormDataBeforeSave(array $data): array
    {
        $record = property_exists($this, 'record') ? $this->record : null;

        return UploadPathNormalizer::prepareForSave($data, $record);
    }

    protected function afterSave(): void
    {
        if (! property_exists($this, 'record') || ! $this->record?->exists) {
            return;
        }

        $this->record->refresh();

        if (method_exists($this, 'fillForm')) {
            $this->fillForm();
        }
    }
}

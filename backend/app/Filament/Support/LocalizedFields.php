<?php

namespace App\Filament\Support;

use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;

class LocalizedFields
{
    /**
     * @return list<TextInput|Textarea>
     */
    public static function pair(string $name, string $label, bool $textarea = false): array
    {
        if ($textarea) {
            return [
                Textarea::make("{$name}.id")->label("{$label} (Indonesia)")->rows(3)->required()->columnSpanFull(),
                Textarea::make("{$name}.en")->label("{$label} (English)")->rows(3)->required()->columnSpanFull(),
            ];
        }

        return [
            TextInput::make("{$name}.id")->label("{$label} (Indonesia)")->required()->columnSpanFull(),
            TextInput::make("{$name}.en")->label("{$label} (English)")->required()->columnSpanFull(),
        ];
    }
}

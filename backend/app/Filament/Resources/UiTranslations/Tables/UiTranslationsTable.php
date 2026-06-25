<?php

namespace App\Filament\Resources\UiTranslations\Tables;

use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;

class UiTranslationsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('group')
                    ->label('Grup')
                    ->badge()
                    ->sortable(),
                TextColumn::make('key')
                    ->label('Kunci')
                    ->searchable()
                    ->sortable()
                    ->copyable(),
                TextColumn::make('value_id')
                    ->label('Indonesia')
                    ->limit(80)
                    ->wrap()
                    ->searchable(),
                TextColumn::make('value_en')
                    ->label('English')
                    ->limit(80)
                    ->wrap()
                    ->searchable(),
            ])
            ->filters([
                SelectFilter::make('group')
                    ->label('Grup')
                    ->options(fn (): array => \App\Models\UiTranslation::query()
                        ->distinct()
                        ->orderBy('group')
                        ->pluck('group', 'group')
                        ->all()),
            ])
            ->defaultSort('key')
            ->recordActions([
                EditAction::make(),
            ]);
    }
}

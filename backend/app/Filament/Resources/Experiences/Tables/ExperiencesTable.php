<?php

namespace App\Filament\Resources\Experiences\Tables;

use App\Support\Localized;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class ExperiencesTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('company')
                    ->label('Perusahaan')
                    ->searchable()
                    ->sortable()
                    ->wrap(),
                TextColumn::make('role')
                    ->label('Jabatan')
                    ->formatStateUsing(fn (mixed $state): string => Localized::tableLabel($state)),
                TextColumn::make('period')
                    ->label('Periode')
                    ->formatStateUsing(fn (mixed $state): string => Localized::tableLabel($state)),
                TextColumn::make('tags')
                    ->label('Tag')
                    ->formatStateUsing(fn (mixed $state): string => Localized::tableJoin($state))
                    ->wrap(),
                TextColumn::make('sort_order')
                    ->label('Urutan')
                    ->sortable()
                    ->alignCenter(),
            ])
            ->defaultSort('sort_order')
            ->reorderable('sort_order')
            ->recordActions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}

<?php

namespace App\Filament\Resources\Projects\Tables;

use App\Support\Localized;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;

class ProjectsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('title')
                    ->label('Judul')
                    ->searchable()
                    ->formatStateUsing(fn (mixed $state): string => Localized::tableLabel($state))
                    ->wrap(),
                TextColumn::make('slug')
                    ->label('Slug')
                    ->searchable()
                    ->copyable(),
                TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->formatStateUsing(fn (mixed $state): string => match ((string) $state) {
                        'completed' => 'Selesai',
                        'in_progress' => 'Berjalan',
                        'planned' => 'Direncanakan',
                        default => filled($state) ? (string) $state : '—',
                    })
                    ->color(fn (mixed $state): string => match ((string) $state) {
                        'completed' => 'success',
                        'in_progress' => 'warning',
                        'planned' => 'gray',
                        default => 'gray',
                    }),
                TextColumn::make('stack')
                    ->label('Stack')
                    ->formatStateUsing(fn (mixed $state): string => Localized::tableJoin($state))
                    ->wrap(),
                TextColumn::make('sort_order')
                    ->label('Urutan')
                    ->sortable()
                    ->alignCenter(),
            ])
            ->filters([
                SelectFilter::make('status')
                    ->label('Status')
                    ->options([
                        'completed' => 'Selesai',
                        'in_progress' => 'Berjalan',
                        'planned' => 'Direncanakan',
                    ]),
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

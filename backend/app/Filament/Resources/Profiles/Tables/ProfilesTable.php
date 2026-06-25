<?php

namespace App\Filament\Resources\Profiles\Tables;

use App\Support\Localized;
use Filament\Actions\EditAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class ProfilesTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->label('Nama')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('email')
                    ->label('Email')
                    ->searchable(),
                TextColumn::make('phone')
                    ->label('Telepon'),
                TextColumn::make('years_experience')
                    ->label('Pengalaman')
                    ->badge(),
                TextColumn::make('headline')
                    ->label('Headline')
                    ->formatStateUsing(fn (mixed $state): string => Localized::tableLabel($state))
                    ->wrap(),
            ])
            ->recordActions([
                EditAction::make(),
            ]);
    }
}

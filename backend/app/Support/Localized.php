<?php

namespace App\Support;

class Localized
{
    /**
     * @return array{id: string, en: string}
     */
    public static function make(string $id, string $en): array
    {
        return ['id' => $id, 'en' => $en];
    }

    /**
     * @param  array{id?: string, en?: string}|string|null  $value
     */
    public static function normalize(?array $value): array
    {
        return [
            'id' => (string) ($value['id'] ?? ''),
            'en' => (string) ($value['en'] ?? ''),
        ];
    }

    public static function tableLabel(mixed $state, string $locale = 'id'): string
    {
        if (is_array($state)) {
            return $state[$locale] ?? $state['en'] ?? $state['id'] ?? '—';
        }

        if (is_string($state) && $state !== '') {
            $decoded = json_decode($state, true);

            if (is_array($decoded)) {
                return $decoded[$locale] ?? $decoded['en'] ?? $decoded['id'] ?? '—';
            }

            return $state;
        }

        return '—';
    }

    /**
     * @return list<string>
     */
    public static function tableList(mixed $state): array
    {
        if (is_array($state)) {
            return array_values(array_filter($state, fn (mixed $item): bool => is_string($item) && $item !== ''));
        }

        if (is_string($state) && $state !== '') {
            $trimmed = trim($state);

            if ($trimmed === '' || $trimmed === '[]') {
                return [];
            }

            $decoded = json_decode($state, true);

            if (is_array($decoded)) {
                return array_values(array_filter($decoded, fn (mixed $item): bool => is_string($item) && $item !== ''));
            }

            return [$state];
        }

        return [];
    }

    public static function tableJoin(mixed $state, string $separator = ', '): string
    {
        $items = self::tableList($state);

        return $items === [] ? '—' : implode($separator, $items);
    }
}

<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $publicPath = env('PUBLIC_PATH');

        if (is_string($publicPath) && $publicPath !== '') {
            $this->app->usePublicPath($publicPath);
        }
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        $publicRoot = config('filesystems.disks.public.root');

        $directories = [
            is_string($publicRoot) && $publicRoot !== ''
                ? $publicRoot
                : storage_path('app/public'),
            storage_path('app/livewire-tmp'),
            storage_path('framework/cache'),
            storage_path('framework/sessions'),
            storage_path('framework/views'),
            storage_path('logs'),
        ];

        foreach ($directories as $directory) {
            if (! is_dir($directory)) {
                mkdir($directory, 0755, true);
            }
        }
    }
}

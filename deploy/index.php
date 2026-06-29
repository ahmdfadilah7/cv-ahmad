<?php

use Illuminate\Foundation\Application;
use Illuminate\Http\Request;

define('LARAVEL_START', microtime(true));

if (file_exists($maintenance = __DIR__.'/laravel-profile/storage/framework/maintenance.php')) {
    require $maintenance;
}

require __DIR__.'/laravel-profile/vendor/autoload.php';

/** @var Application $app */
$app = require_once __DIR__.'/laravel-profile/bootstrap/app.php';

// public_html adalah document root, bukan laravel-profile/public
$app->usePublicPath(__DIR__);

$app->handleRequest(Request::capture());

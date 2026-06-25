<?php

namespace App\Http\Controllers\Api;

use App\Services\PortfolioApiService;
use Illuminate\Http\JsonResponse;

class PortfolioController
{
    public function __invoke(PortfolioApiService $service): JsonResponse
    {
        return response()->json($service->all());
    }
}

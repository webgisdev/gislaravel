<?php

use App\Models\Monument;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard', function () {
        $geojson = [
            'type' => 'FeatureCollection',
            'features' => [],
        ];

        Monument::selectRaw('id, name, image, ST_AsGeoJSON(geom) as geom')
            ->get()
            ->each(function ($monument) use (&$geojson) {
                $geojson['features'][] = [
                    'type' => 'Feature',
                    'properties' => [
                        'name' => $monument->name,
                        'image' => $monument->image,
                    ],
                    'geometry' => json_decode($monument->geom, true),
                ];
            });

        return view('dashboard', ['geojson' => $geojson]);
    })->name('dashboard');
});

<?php

namespace App\Console\Commands;

use App\Models\User;
use App\Models\Monument;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class ReloadMonuments extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'laravel-gis:reload-monuments';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Truncate the monuments table and reload the geojson';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $user = User::first();

        if (!$user) {
            $this->info('No user found in the database, the monuments cannot be loaded.');

            return 0;
        }

        $geojson = file_get_contents(resource_path('/geodata/geojson/monuments.geojson'));

        Monument::truncate();

        $features = collect(json_decode($geojson, true)['features'])->each(function ($feature) use ($user) {
            Monument::create([
                'name' => $feature['properties']['name'],
                'image' => null,
                'geom' => DB::raw("ST_GeomFromGeoJSON('" . json_encode($feature['geometry']) . "')"),
                'user_id' => $user->id
            ]);
        });

        $this->info($features->count() . ' monuments loaded successfully.');

        return 0;
    }
}

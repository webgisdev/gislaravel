<?php

namespace App\Http\Livewire\Monuments;

use Livewire\Component;
use App\Models\Monument;
use Illuminate\Support\Facades\DB;

class Create extends Component
{
    public $coordinates = [];
    public $name;

    protected $rules = [
        'coordinates.0' => 'required|numeric|between:-180,180',
        'coordinates.1' => 'required|numeric|between:-90,90',
        'name' => 'required|string|max:255|unique:monuments,name',
    ];

    protected $messages = [
        'coordinates.0.required' => 'The longitude is required.',
        'coordinates.0.numeric' => 'The longitude must be a number.',
        'coordinates.0.between' => 'The longitude must be between -180 and 180.',
        'coordinates.1.required' => 'The latitude is required.',
        'coordinates.1.numeric' => 'The latitude must be a number.',
        'coordinates.1.between' => 'The latitude must be between -90 and 90.',
        'name.required' => 'The name is required.',
        'name.string' => 'The name must be a string.',
        'name.max' => 'The name may not be greater than 255 characters.',
        'name.unique' => 'The name has already been taken.',
    ];

    public function save()
    {
        $this->validate();

        $monumentId = Monument::insertGetId([
            'name' => $this->name,
            'geom' => DB::raw("ST_GeomFromText('POINT({$this->coordinates[0]} {$this->coordinates[1]})')"),
            'user_id' => auth()->id(),
        ]);

        $this->coordinates = [];
        $this->name = '';

        $this->emit('saved');

        $geojson = Monument::query()
            ->where('id', $monumentId)
            ->selectRaw('st_asgeojson(monuments.*) as geojson')
            ->firstOrFail()
            ->geojson;

        $this->dispatchBrowserEvent('new-monument', ['monument' => $geojson]);
    }

    public function render()
    {
        return view('livewire.monuments.create');
    }
}

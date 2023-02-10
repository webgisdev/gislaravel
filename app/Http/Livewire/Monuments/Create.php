<?php

namespace App\Http\Livewire\Monuments;

use Livewire\Component;
use App\Models\Monument;
use Illuminate\Support\Facades\DB;
use Livewire\WithFileUploads;

class Create extends Component
{
    use WithFileUploads;

    public $coordinates = [];
    public $name;
    public $upload;

    protected $rules = [
        'coordinates.0' => 'required|numeric|between:-180,180',
        'coordinates.1' => 'required|numeric|between:-90,90',
        'name' => 'required|string|max:255|unique:monuments,name',
        'upload' => 'required|file|mimes:png,jpg|max:4096',
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
        'upload.required' => 'The image is required.',
        'upload.file' => 'The image must be a file.',
        'upload.mimes' => 'The image must be a file of type: png, jpg.',
        'upload.max' => 'The image may not be greater than 4096 kilobytes.',
    ];

    public function save()
    {
        $this->validate();

        $monument = Monument::create([
            'name' => $this->name,
            'geom' => DB::raw("ST_GeomFromText('POINT({$this->coordinates[0]} {$this->coordinates[1]})')"),
            'image_file' => $this->upload->store('/', 'monuments'),
            'user_id' => auth()->id(),
        ]);

        $monument->image = route('monument-image', $monument);
        $monument->save();

        $this->coordinates = [];
        $this->name = '';
        $this->upload = null;

        $this->emit('saved');

        $geojson = DB::table('monuments_view')
            ->where('id', $monument->id)
            ->selectRaw('st_asgeojson(monuments_view.*) as geojson')
            ->get()
            ->first()
            ->geojson;

        $this->dispatchBrowserEvent('clear-upload');
        $this->dispatchBrowserEvent('new-monument', ['monument' => $geojson]);
    }

    public function render()
    {
        return view('livewire.monuments.create');
    }
}

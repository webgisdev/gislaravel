<?php

namespace App\Http\Controllers;

use App\Models\Monument;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class MonumentsImagesController extends Controller
{
    public function __invoke(Monument $monument)
    {
        if (!Auth::check()) {
            abort(404);
        }

        return Storage::disk('monuments')->response($monument->image_file);
    }
}

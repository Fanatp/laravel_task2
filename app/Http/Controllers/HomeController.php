<?php

namespace App\Http\Controllers;

use App\Models\Profession;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function dashboard(){

        $profession = Profession::all();

        return view('dashboard', ['professions' => $profession]);
    }
}

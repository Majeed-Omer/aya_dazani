<?php

namespace App\Http\Controllers;

use App\Models\Informations;
use Illuminate\Http\Request;

class InformationsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $informations = Informations::all();
        return response()->json($informations);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Informations  $informations
     * @return \Illuminate\Http\Response
     */
    public function show(Informations $informations)
    {
        return response()->json($informations);
    }
}

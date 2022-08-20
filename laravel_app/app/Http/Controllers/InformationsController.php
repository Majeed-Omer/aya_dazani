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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->validate([
            'name' => 'required',
            'information' => 'required',
            'image' => 'required',
        ]);
        $informations = new Informations();
        $informations->name = $input['name'];
        $informations->information = $input['information'];
        $informations->image = $input['image'];
        $informations->save();
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

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Informations  $informations
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Informations $informations)
    {
        $input = $request->validate([
            'name' => 'required',
            'information' => 'required',
            'image' => 'required',
        ]);
        $informations->name = $input['name'];
        $informations->information = $input['information'];
        $informations->image = $input['image'];
        $informations->save();
        return response()->json($informations);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Informations  $informations
     * @return \Illuminate\Http\Response
     */
    public function destroy(Informations $informations)
    {
        return response()->json($informations->delete());
    }
}
